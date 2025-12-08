using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aspx_ExDowhile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i = 1;
        do
        {
            Response.Write(i.ToString() + "<br>");
            i++;
        } while (i <= 30);
    }
}