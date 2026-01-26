using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Page for new user registration.
/// </summary>
public partial class Pages_Account_Registration : System.Web.UI.Page
{
    /// <summary>
    /// Handles the Page_Load event.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Checks if the entered username is already taken when the text changes.
    /// </summary>
    protected void txtName_TextChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        int valueMessage = ConnectionClass.ValidUsername(txtName.Text);
        if (valueMessage == 0)
        {
            txtName.Text = "";
            lblCheck.Text = "ชื่อซ้ำจ้าาาาาาาาาาาา กรุณากรอกชื่อใหม่จ๊ะ";
        }
        else
        {
            lblCheck.Text = "OK ใช้โล้ดดดดดดดดดดดด";
        }
    }

    /// <summary>
    /// Handles the register button click to create a new user account.
    /// </summary>
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        User user = new User(txtName.Text, txtPassword.Text, txtEmail.Text, "users");
        lblResult.Text = ConnectionClass.RegisterUser(user);
    }
}