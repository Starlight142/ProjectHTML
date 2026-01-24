using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

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

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        User user = new User(txtName.Text, txtPassword.Text, txtEmail.Text, "users");
        lblResult.Text = ConnectionClass.RegisterUser(user);
    }
}