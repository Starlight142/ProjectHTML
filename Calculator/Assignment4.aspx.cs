using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Assignment4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btncal_Click(object sender, EventArgs e)
    {
        int high = int.Parse(txthigh.Text);
        int weigh = int.Parse(txtweigh.Text);
        string result = "";
        if (high > 200 && weigh > 100)
        {
            result = "ยักษ์";
        }
        else result = "มนุษย์";
        lblResult.Text = result;
    }
}