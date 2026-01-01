using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace TherapyWebApp
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["TherapyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Security Check
            if (Session["UserID"] == null)
                Response.Redirect("Login_Signup.aspx");

            if (!IsPostBack)
            {
                litUserID.Text = Session["UserID"].ToString();
                litUserEmail.Text = litUserEmailDisplay.Text = Session["UserEmail"]?.ToString();
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
               
                string query = @"
                    SELECT 
                        B.BookingID, 
                        T.Name as TherapistName, 
                        T.Email as TherapistEmail, 
                        Th.TherapyName, 
                        B.SessionDate, 
                        B.Status,
                        FORMAT(B.StartTime, 'hh:mm tt') + ' - ' + FORMAT(B.EndTime, 'hh:mm tt') AS TimeSlot
                    FROM Bookings B 
                    JOIN Therapists T ON B.TherapistID = T.TherapistID 
                    JOIN Therapies Th ON B.TherapyID = Th.TherapyID 
                    WHERE B.UserID = @uID 
                    ORDER BY B.SessionDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@uID", Session["UserID"]);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // 1. Filter Upcoming: Date is Today/Future AND Status is NOT Cancelled
                DataView dvUpcoming = new DataView(dt);
                dvUpcoming.RowFilter = "SessionDate >= '" + DateTime.Today.ToString("yyyy-MM-dd") + "' AND Status <> 'Cancelled'";
                gvUpcoming.DataSource = dvUpcoming;
                gvUpcoming.DataBind();

                // 2. Filter Past: Date is in past OR Status is Cancelled
                DataView dvPast = new DataView(dt);
                dvPast.RowFilter = "SessionDate < '" + DateTime.Today.ToString("yyyy-MM-dd") + "' OR Status = 'Cancelled'";
                gvPast.DataSource = dvPast;
                gvPast.DataBind();
            }
        }

        protected void gvUpcoming_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelBooking")
            {
                int bookingID = Convert.ToInt32(e.CommandArgument);
                ProcessCancellation(bookingID);
            }
        }

        private void ProcessCancellation(int bID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();

                    string infoQuery = @"
                        SELECT 
                            U.Email as UserEmail, 
                            T.Email as TherapistEmail, 
                            B.SessionDate, 
                            FORMAT(B.StartTime, 'hh:mm tt') + ' - ' + FORMAT(B.EndTime, 'hh:mm tt') AS TimeSlot
                        FROM Bookings B 
                        JOIN Users U ON B.UserID = U.UserID 
                        JOIN Therapists T ON B.TherapistID = T.TherapistID 
                        WHERE B.BookingID = @id";

                    SqlCommand cmdInfo = new SqlCommand(infoQuery, con);
                    cmdInfo.Parameters.AddWithValue("@id", bID);
                    SqlDataReader dr = cmdInfo.ExecuteReader();

                    if (dr.Read())
                    {
                        string uEmail = dr["UserEmail"].ToString();
                        string tEmail = dr["TherapistEmail"].ToString();
                        string dateStr = Convert.ToDateTime(dr["SessionDate"]).ToShortDateString();

                        string slot = dr["TimeSlot"].ToString();
                        dr.Close();

                        // Update Status to Cancelled
                        SqlCommand cmdUpdate = new SqlCommand("UPDATE Bookings SET Status = 'Cancelled' WHERE BookingID = @id", con);
                        cmdUpdate.Parameters.AddWithValue("@id", bID);
                        cmdUpdate.ExecuteNonQuery();

                        // Send Notifications
                        SendCancellationEmail(uEmail, tEmail, dateStr, slot);

                        lblBookingMessage.Text = "Booking cancelled successfully. Notifications sent.";
                        lblBookingMessage.ForeColor = System.Drawing.Color.Green;
                        LoadBookings(); // Refresh tables
                    }
                }
            }
            catch (Exception ex)
            {
                lblBookingMessage.Text = "Cancellation failed: " + ex.Message;
                lblBookingMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void SendCancellationEmail(string userEmail, string therapistEmail, string date, string slot)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("clinic-noreply@edchat.pk");
                mail.To.Add(userEmail);      // Recipient 1: User
                mail.To.Add(therapistEmail); // Recipient 2: Therapist

                mail.Subject = "Therapy Session Cancellation";
                mail.Body = $"The session scheduled for {date} during slot {slot} has been cancelled by the patient.";

                // SmtpClient configuration (Example for Gmail)
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential("YOUR_EMAIL", "YOUR_APP_PASSWORD");
                smtp.EnableSsl = true;
                // smtp.Send(mail); // Uncomment when credentials are set
            }
            catch { /* In production, log the error to a file */ }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login_Signup.aspx");
        }
    }
}