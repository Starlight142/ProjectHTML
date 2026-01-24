using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btncal_Click(object sender, EventArgs e)
    {
        if (Convert.ToDecimal(txtScore.Text) <= 50)
        {
            Response.Write("Grade F");
        }
        else if (Convert.ToDecimal(txtScore.Text) <= 60)
        {
            Response.Write("Grade D");
        }
        else if (Convert.ToDecimal(txtScore.Text) <= 70)
        {
            Response.Write("Grade C");
        }
        else if (Convert.ToDecimal(txtScore.Text) <= 80)
        {
            Response.Write("Grade B");
        }
        else
        {
            Response.Write("Grade A");
        }
    }
}