using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SessionMultiviw_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int total1 = Convert.ToInt32(Session["f1"]).ToString());
        int total2 = Convert.ToInt32(Session["f2"]).ToString());

        lbltotal.text = "Total is " + Convert.ToString(total1+total2) + " บาท"
    }
}