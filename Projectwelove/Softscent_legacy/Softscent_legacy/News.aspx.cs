using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class News : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var newsItems = new[] {
                new { Title = "Grand Opening!", Date = DateTime.Now.AddDays(-10), Content = "We are officially open for business! Explore our herbal collections.", ImageUrl = "Images/herbs-bundle.png" },
                new { Title = "Seasonal Blend: Lavender", Date = DateTime.Now.AddDays(-2), Content = "Check out our new Lavender collection for better sleep.", ImageUrl = "Images/products/lavender.png" }
            };
            NewsRepeater.DataSource = newsItems;
            NewsRepeater.DataBind();
        }
    }
}
