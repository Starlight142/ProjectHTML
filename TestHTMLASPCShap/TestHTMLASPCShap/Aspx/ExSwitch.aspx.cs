using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_ExSwitch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        switch (TextBox1.Text.ToString())
        {
            case "dog":
                Response.Write("สุนัขเองจะตัวอะไรล่ะ");
                break;
            case "cat":
                Response.Write("แมวเองสงสัยอะไร");
                break;
            case "bat":
                Response.Write("ค้างคาวอยู่ในถ้ำมาได้ไง");
                break;
            default:
                Response.Write("หยุดเถอะอานนท์ไม่มีอะไร");
                break;
        }
    }
}