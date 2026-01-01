using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TherapyWebApp
{
    // FIX: Class name now needs to match the Inherits attribute in Login_Signup.aspx
    public partial class Login_Signup : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["TherapyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Mode"] = "Login";
                SetUIMode("Login");
            }
        }

        private void SetUIMode(string mode)
        {
            if (mode == "Login")
            {
                litMode.Text = "User Login";
                btnLogin.Text = "Login";
                btnToggle.Text = "Switch to Register";
            }
            else // Signup Mode
            {
                litMode.Text = "New User Signup";
                btnLogin.Text = "Register Account";
                btnToggle.Text = "Switch to Login";
            }
            lblMsg.Text = "";
            txtPassword.Text = "";
            txtEmail.Focus();
        }

        protected void btnToggle_Click(object sender, EventArgs e)
        {
            if ((string)Session["Mode"] == "Login")
            {
                Session["Mode"] = "Signup";
                SetUIMode("Signup");
            }
            else
            {
                Session["Mode"] = "Login";
                SetUIMode("Login");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                if ((string)Session["Mode"] == "Signup")
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(conStr))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO Users (Email, Password, IsAdmin) VALUES (@Email, @Password, 0)", con);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", password);
                            cmd.ExecuteNonQuery();

                            lblMsg.Text = "Registration successful. You can now log in.";
                            SetUIMode("Login");
                            Session["Mode"] = "Login";
                        }
                    }
                    catch (SqlException ex) when (ex.Number == 2627)
                    {
                        lblMsg.Text = "Error: This email is already registered.";
                    }
                    catch (Exception)
                    {
                        lblMsg.Text = "An unexpected error occurred during registration.";
                    }
                }
                else
                {
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT UserID, IsAdmin, Password FROM Users WHERE Email = @Email", con);
                        cmd.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string storedPassword = reader["Password"].ToString();

                                if (storedPassword == password)
                                {
                                    Session["UserID"] = reader["UserID"].ToString();
                                    Session["IsAdmin"] = (bool)reader["IsAdmin"];

                                    // Inside btnLogin_Click method, after successful password check:

                                    // ... (code above)

                                    if ((bool)Session["IsAdmin"])
                                        Response.Redirect("AdminDashboard.aspx");
                                    else
                                        Response.Redirect("UserDashboard.aspx"); // <--- UPDATED TO NEW DASHBOARD
                                                                                 // ... (code below)
                                }
                                else
                                {
                                    lblMsg.Text = "Invalid email or password.";
                                }
                            }
                            else
                            {
                                lblMsg.Text = "Invalid email or password.";
                            }
                        }
                    }
                }
            }
        }
    }
}