using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
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
