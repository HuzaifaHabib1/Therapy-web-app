using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace TherapyWebApp
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["TherapyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("Login_Signup.aspx");
                return;
            }

            if (!IsPostBack)
            {
                RefreshAll();
            }
        }

        private void RefreshAll()
        {
            LoadMetrics();
            LoadBookings(txtSearchTerm.Text);
        }

        void LoadMetrics()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                litTotalBookings.Text = new SqlCommand("SELECT COUNT(*) FROM Bookings", con).ExecuteScalar().ToString();
                litTotalTherapists.Text = new SqlCommand("SELECT COUNT(*) FROM Therapists", con).ExecuteScalar().ToString();
                litTotalUsers.Text = new SqlCommand("SELECT COUNT(*) FROM Users WHERE IsAdmin = 0", con).ExecuteScalar().ToString();
            }
        }

        void LoadBookings(string searchTerm)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                // FIX: Replaced 'b.TimeSlot' with a concatenation of StartTime and EndTime
                // This creates a fake column named 'TimeSlot' so your GridView doesn't break
                string sql = @"
                    SELECT b.BookingID, u.Email AS UserEmail, t.Name AS Therapist, th.TherapyName AS Therapy,
                           b.SessionDate, 
                           CONVERT(varchar(5), b.StartTime) + ' - ' + CONVERT(varchar(5), b.EndTime) AS TimeSlot, 
                           b.PaymentScreenshot, b.Status
                    FROM Bookings b
                    JOIN Users u ON b.UserID = u.UserID
                    JOIN Therapists t ON b.TherapistID = t.TherapistID
                    JOIN Therapies th ON b.TherapyID = th.TherapyID
                    WHERE (t.Name LIKE @f OR u.Email LIKE @f OR th.TherapyName LIKE @f)
                    ORDER BY b.SessionDate DESC";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@f", "%" + searchTerm.Trim() + "%");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }

        protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                int bookingID = Convert.ToInt32(e.CommandArgument);
                string newStatus = (e.CommandName == "Approve") ? "Confirmed" : "Rejected";
                ProcessBookingUpdate(bookingID, newStatus);
            }
        }

        private void ProcessBookingUpdate(int bID, string status)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();

                    // FIX: Updated query to fetch StartTime/EndTime instead of TimeSlot
                    string query = @"SELECT u.Email as uEmail, t.Email as tEmail, th.TherapyName, 
                                     b.SessionDate, b.StartTime, b.EndTime, b.GoogleMeetLink 
                                     FROM Bookings b 
                                     JOIN Users u ON b.UserID = u.UserID 
                                     JOIN Therapists t ON b.TherapistID = t.TherapistID 
                                     JOIN Therapies th ON b.TherapyID = th.TherapyID 
                                     WHERE b.BookingID = @id";

                    SqlCommand cmdInfo = new SqlCommand(query, con);
                    cmdInfo.Parameters.AddWithValue("@id", bID);
                    SqlDataReader dr = cmdInfo.ExecuteReader();

                    if (dr.Read())
                    {
                        string userEmail = dr["uEmail"].ToString();
                        string therapistEmail = dr["tEmail"].ToString();

                        // FIX: Format the time range string for the email
                        string timeRange = $"{dr["StartTime"]} - {dr["EndTime"]}";
                        string details = $"{dr["TherapyName"]} on {Convert.ToDateTime(dr["SessionDate"]):dd-MMM-yyyy} at {timeRange}";

                        string meetLink = dr["GoogleMeetLink"].ToString();
                        dr.Close();

                        // 2. Update DB
                        SqlCommand cmdUpd = new SqlCommand("UPDATE Bookings SET Status=@s WHERE BookingID=@id", con);
                        cmdUpd.Parameters.AddWithValue("@s", status);
                        cmdUpd.Parameters.AddWithValue("@id", bID);
                        cmdUpd.ExecuteNonQuery();

                        // 3. Send Email
                        SendEmail(userEmail, therapistEmail, status, details, meetLink);
                    }
                }
                RefreshAll();
            }
            catch (Exception ex)
            {
                // It's good practice to log this error or show it on a label
                // System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }

        private void SendEmail(string uEmail, string tEmail, string status, string details, string link)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("clinic-admin@edchat.pk");
                mail.To.Add(uEmail);
                mail.To.Add(tEmail);
                mail.Subject = "Booking Status Update - " + status;

                if (status == "Confirmed")
                    mail.Body = $"Great news! Your session for {details} is CONFIRMED.\nJoin Link: {link}";
                else
                    mail.Body = $"The session request for {details} was REJECTED by the administrator.";

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                // Make sure to replace these credentials with valid ones or use Web.config settings
                smtp.Credentials = new System.Net.NetworkCredential("YOUR_EMAIL", "APP_PASSWORD");
                smtp.EnableSsl = true;

                // smtp.Send(mail); // Uncomment when ready to test real emails
            }
            catch { }
        }

        protected void btnSearch_Click(object sender, EventArgs e) => LoadBookings(txtSearchTerm.Text);
        protected void btnClear_Click(object sender, EventArgs e) { txtSearchTerm.Text = ""; LoadBookings(""); }
        protected void btnLogout_Click(object sender, EventArgs e) { Session.Clear(); Response.Redirect("Login_Signup.aspx"); }
    }
}