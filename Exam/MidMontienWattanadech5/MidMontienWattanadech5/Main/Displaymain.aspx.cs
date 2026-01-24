using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedIndex)
        {
            case 0:
                MultiView1.Visible = false;
                btnClick.Visible = false;
                break;
            case 1:
                MultiView1.Visible = true;
                MultiView1.SetActiveView(EyeShadow);
                btnClick.Visible = true;
                break;
            case 2:
                MultiView1.Visible = true;
                MultiView1.SetActiveView(LipStick);
                btnClick.Visible = true;
                break;
            case 3:
                MultiView1.Visible = true;
                MultiView1.SetActiveView(Powderblush);
                btnClick.Visible = true;
                break;
        }
}