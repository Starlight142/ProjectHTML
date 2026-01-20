using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConvertCurrency : System.Web.UI.Page
{
    double USD = 33.85;
    double EUR = 39.15;
    double JPY = 0.30;
    double HKD = 4.35;
    double SGD = 26.30;

    int currency = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
        Session["convertedAmount"] = 0;
        Session["currency"] = 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        double amount;
        if (!double.TryParse(TextCurrency1.Text, out amount))
        {
            TextCurrency1.Text = "โปรดใส่จำนวนเงิน";
            return;
        }

        Server.Transfer("YourCurrency.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        double amount;
        if (!double.TryParse(TextCurrency1.Text, out amount))
        {
            // Invalid input and clear session
            Session["convertedAmount"] = null;
            Session["currency"] = null;
            return;
        }

        double convertedAmount = 0;
        string currency = "";
        switch (DropDownList1.SelectedIndex)
        {
            case 0:

                Session["convertedAmount"] = null;
                Session["currency"] = null;
                break;
            case 1:

                convertedAmount = amount / USD;
                currency = "USD";
                break;
            case 2:

                convertedAmount = amount / EUR;
                currency = "EUR";
                break;
            case 3:

                convertedAmount = amount / JPY;
                currency = "JPY";
                break;
            case 4:

                convertedAmount = amount / HKD;
                currency = "HKD";
                break;
            case 5:

                convertedAmount = amount / SGD;
                currency = "SGD";
                break;
        }

        if (!string.IsNullOrEmpty(currency))
        {
            Session["convertedAmount"] = convertedAmount;
            Session["currency"] = currency;
        }
    }
}