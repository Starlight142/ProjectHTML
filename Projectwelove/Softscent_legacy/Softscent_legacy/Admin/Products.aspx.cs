using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Admin_Products : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var products = new List<Product>
            {
                new Product(1, "Peppermint Fresh", "Cooling and refreshing.", 5.99m, "../Images/products/peppermint.png", false),
                new Product(2, "Lavender Sleep", "Calming scent for deep sleep.", 6.99m, "../Images/products/lavender.png", false),
                new Product(4, "Traditional Thai Jar", "Authentic herbal blend.", 12.99m, "../Images/products/thai_jar.png", true)
            };
            AdminProductRepeater.DataSource = products;
            AdminProductRepeater.DataBind();
        }
    }
}
