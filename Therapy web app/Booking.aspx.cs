using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Data; // Added for SqlDbType

namespace TherapyWebApp
{
    public partial class Booking : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["TherapyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("Login_Signup.aspx");

            if (!IsPostBack)
            {
                LoadDropdowns();
                UpdatePrice();
            }
        }

        void LoadDropdowns()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    // Load Therapies
                    SqlCommand cmdTherapies = new SqlCommand("SELECT TherapyID, TherapyName FROM Therapies", con);
                    ddlTherapy.DataSource = cmdTherapies.ExecuteReader();
                    ddlTherapy.DataTextField = "TherapyName";
                    ddlTherapy.DataValueField = "TherapyID";
                    ddlTherapy.DataBind();
                }

                // New connection needed because DataReader closes the previous one
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    // Load Therapists
                    SqlCommand cmdTherapists = new SqlCommand("SELECT TherapistID, Name FROM Therapists", con);
                    ddlTherapist.DataSource = cmdTherapists.ExecuteReader();
                    ddlTherapist.DataTextField = "Name";
                    ddlTherapist.DataValueField = "TherapistID";
                    ddlTherapist.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error loading options: " + ex.Message;
            }
        }

        protected void ddlTherapy_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdatePrice();
        }

        private void UpdatePrice()
        {
            if (ddlTherapy.SelectedValue == "") return;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT Price FROM Therapies WHERE TherapyID=@id", con);
                cmd.Parameters.AddWithValue("@id", ddlTherapy.SelectedValue);
                con.Open();
                object price = cmd.ExecuteScalar();
                lblPrice.Text = price != null ? Convert.ToDecimal(price).ToString("N2") : "0.00";
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            // 1. Validate Date
            DateTime sessionDate;
            if (!DateTime.TryParse(txtDate.Text, out sessionDate) || sessionDate.Date < DateTime.Today)
            {
                lblMsg.Text = "Please select a valid future date.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // 2. Calculate Start and End Times
            // The dropdown values are like "14:00", so we parse them into TimeSpan
            TimeSpan startTime = TimeSpan.Parse(ddlTime.SelectedValue);
            TimeSpan endTime = startTime.Add(new TimeSpan(1, 30, 0)); // Add 1 hour 30 minutes

            // 3. Handle File Upload
            string dbFilePath = "";
            if (fuScreenshot.HasFile)
            {
                try
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuScreenshot.FileName);
                    fuScreenshot.SaveAs(folderPath + fileName);
                    dbFilePath = "Uploads/" + fileName;
                }
                catch { lblMsg.Text = "File upload failed."; return; }
            }

            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();

                    // 4. FIX: Concurrency Check using StartTime instead of TimeSlot
                    // We check if this therapist already has a booking starting at this specific time on this date
                    string checkQuery = @"
                        SELECT COUNT(*) FROM Bookings 
                        WHERE TherapistID=@t 
                        AND SessionDate=@d 
                        AND StartTime=@st 
                        AND Status != 'Cancelled'";

                    SqlCommand check = new SqlCommand(checkQuery, con);
                    check.Parameters.AddWithValue("@t", ddlTherapist.SelectedValue);
                    check.Parameters.AddWithValue("@d", sessionDate);
                    check.Parameters.AddWithValue("@st", startTime); // Pass TimeSpan object

                    if ((int)check.ExecuteScalar() > 0)
                    {
                        lblMsg.Text = "This therapist is already booked for this slot.";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        return;
                    }

                    // 5. FIX: Insert Query using StartTime and EndTime
                    string insertQuery = @"
                        INSERT INTO Bookings 
                        (UserID, TherapistID, TherapyID, SessionDate, StartTime, EndTime, PaymentScreenshot, GoogleMeetLink, Status) 
                        VALUES 
                        (@u, @t, @th, @d, @st, @et, @img, @link, 'Pending')";

                    SqlCommand cmd = new SqlCommand(insertQuery, con);
                    cmd.Parameters.AddWithValue("@u", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@t", ddlTherapist.SelectedValue);
                    cmd.Parameters.AddWithValue("@th", ddlTherapy.SelectedValue);
                    cmd.Parameters.AddWithValue("@d", sessionDate);
                    cmd.Parameters.AddWithValue("@st", startTime); // Insert StartTime
                    cmd.Parameters.AddWithValue("@et", endTime);   // Insert EndTime
                    cmd.Parameters.AddWithValue("@img", dbFilePath);
                    cmd.Parameters.AddWithValue("@link", "https://meet.google.com/" + Guid.NewGuid().ToString().Substring(0, 10));

                    cmd.ExecuteNonQuery();

                    lblMsg.Text = "Success! Your booking is pending admin approval.";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Booking Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login_Signup.aspx");
        }
    }
}