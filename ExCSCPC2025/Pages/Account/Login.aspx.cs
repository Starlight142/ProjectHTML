using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

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