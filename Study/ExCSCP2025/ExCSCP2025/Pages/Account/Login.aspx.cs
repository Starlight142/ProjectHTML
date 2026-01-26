using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Page for user authentication (Login).
/// </summary>
public partial class Pages_Account_Login : System.Web.UI.Page
{
    /// <summary>
    /// Handles the Page_Load event.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Handles the login button click. Authenticates the user and sets session variables.
    /// </summary>
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        User user = ConnectionClass.LoginUser(txtLogin.Text, txtPassword.Text);
        if (user != null)
        {
            Session["login"] = user.UserName;
            Session["type"] = user.UserType;
            Response.Redirect("~/index.aspx");
        }
        else
        {
            lblError.Text = "Login Failed";
        }
    }
}