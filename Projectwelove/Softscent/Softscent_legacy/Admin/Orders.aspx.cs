using System;
using System.Web.UI;

public partial class Admin_Orders : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var orders = new[] {
                new { Id = 1052, Date = DateTime.Now.AddHours(-2), User = "alice@example.com", Total = 45.00m, Status = "Pending" },
                new { Id = 1051, Date = DateTime.Now.AddDays(-1), User = "bob@example.com", Total = 12.99m, Status = "Completed" }
            };
            AdminOrderRepeater.DataSource = orders;
            AdminOrderRepeater.DataBind();
        }
    }
}
