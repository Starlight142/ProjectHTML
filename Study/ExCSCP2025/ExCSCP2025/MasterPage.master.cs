using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Logic for the main MasterPage, handles login state and top-level navigation.
/// </summary>
public partial class MasterPage : System.Web.UI.MasterPage
{
    /// <summary>
    /// Handles the Page_Load event to update the login label and button text.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            lbllogin.Text = "Welcome" + Session["login"];
            lbllogin.Visible = true;
            btnlinkLogin.Text = "Logout";
        }
        else
        {
            lbllogin.Visible = false;
            btnlinkLogin.Text = "Login";
        }
    }

    /// <summary>
    /// Handles the click event of the login/logout link button.
    /// Redirects to Login page or clears session.
    /// </summary>
    protected void btnlinkLogin_Click(object sender, EventArgs e)
    {
        if (btnlinkLogin.Text == "Login")
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
        else
        {
            Session.Clear();
            Response.Redirect("~/index.aspx");
        }
    }
}
