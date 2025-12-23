using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Get_DisplayGet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblShowName.Text = Request.QueryString["name"];
        lblShowDepart.Text = Request.QueryString["department"];
    }
}