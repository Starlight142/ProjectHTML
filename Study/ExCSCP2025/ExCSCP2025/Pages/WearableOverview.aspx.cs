using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Administrative overview page for wearable products. Requires admin privileges.
/// </summary>
public partial class Pages_WearableOverview : System.Web.UI.Page
{
    /// <summary>
    /// Handles Page_Load to enforce admin authentication.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((String)Session["type"] != "admin")
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
    }
}