using System;
using System.Web.UI;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text;

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            lblMessage.Text = "Please enter email and password.";
            lblMessage.Visible = true;
            return;
        }

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            try
            {
                string query = "SELECT Id, PasswordHash FROM Users WHERE Email = @Email";
                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();

                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string dbPasswordHash = reader["PasswordHash"].ToString();
                            string userId = reader["Id"].ToString();

                            if (PasswordHasher.VerifyPassword(dbPasswordHash, password))
                            {
                                // Login successful
                                Session["UserId"] = userId;
                                Session["UserEmail"] = email;
                                
                                // Check for admin role if needed, simplified for now
                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "Invalid password.";
                                lblMessage.Visible = true;
                            }
                        }
                        else
                        {
                            lblMessage.Text = "User not found.";
                            lblMessage.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}
