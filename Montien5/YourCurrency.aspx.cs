using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YourCurrency : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["convertedAmount"] != null && Session["currency"] != null)
        {
            double convertedAmount = (double)Session["convertedAmount"];
            string currency = (string)Session["currency"];
            CLabel1.Text = convertedAmount.ToString("F2");
            currencytext.Text = currency;
        }
        else
        {
            CLabel1.Text = "ไม่มีค่าให้แปลง";
            currencytext.Text = "";
        }
    }

    protected void LinkBackButtom_Click(object sender, EventArgs e)
    {
        Server.Transfer("ConvertCurrency.aspx");
    }
}