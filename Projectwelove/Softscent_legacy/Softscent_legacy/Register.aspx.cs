using System;
using System.Web.UI;

public partial class Register : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text;
        string confirmPassword = txtConfirmPassword.Text;

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            lblMessage.Text = "Please enter email and password.";
            lblMessage.Visible = true;
            return;
        }

        if (password != confirmPassword)
        {
            lblMessage.Text = "Passwords do not match.";
            lblMessage.Visible = true;
            return;
        }

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            // Check if user exists
            string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
            using (System.Data.SqlClient.SqlCommand checkCmd = new System.Data.SqlClient.SqlCommand(checkQuery, conn))
            {
                checkCmd.Parameters.AddWithValue("@Email", email);
                conn.Open();
                int count = (int)checkCmd.ExecuteScalar();
                if (count > 0)
                {
                    lblMessage.Text = "Email already exists.";
                    lblMessage.Visible = true;
                    return;
                }
            }

            // Insert user
            string insertQuery = @"INSERT INTO Users (Id, UserName, NormalizedUserName, Email, NormalizedEmail, EmailConfirmed, PasswordHash, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnabled, AccessFailedCount) 
                                   VALUES (@Id, @UserName, @NormalizedUserName, @Email, @NormalizedEmail, 0, @PasswordHash, 0, 0, 0, 0)";

            // Note: DB schema has Id as nvarchar(450)
            string userId = Guid.NewGuid().ToString();
            string passwordHash = PasswordHasher.HashPassword(password); // Simple SHA256 for this legacy implementation

            using (System.Data.SqlClient.SqlCommand insertCmd = new System.Data.SqlClient.SqlCommand(insertQuery, conn))
            {
                insertCmd.Parameters.AddWithValue("@Id", userId);
                insertCmd.Parameters.AddWithValue("@UserName", email);
                insertCmd.Parameters.AddWithValue("@NormalizedUserName", email.ToUpper());
                insertCmd.Parameters.AddWithValue("@Email", email);
                insertCmd.Parameters.AddWithValue("@NormalizedEmail", email.ToUpper());
                insertCmd.Parameters.AddWithValue("@PasswordHash", passwordHash);

                insertCmd.ExecuteNonQuery();
            }
        }

        // Redirect to Login
        Response.Redirect("Login.aspx");
    }
}
