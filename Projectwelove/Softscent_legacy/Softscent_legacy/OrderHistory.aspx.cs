using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class OrderHistory : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrders();
        }
    }

    private void BindOrders()
    {
        var orders = new[] {
            new { Id = 1001, Date = DateTime.Now.AddDays(-5), Total = 26.98m, Status = "Completed" },
            new { Id = 1052, Date = DateTime.Now.AddDays(-1), Total = 15.00m, Status = "Pending" }
        };
        OrderRepeater.DataSource = orders;
        OrderRepeater.DataBind();
    }
}
