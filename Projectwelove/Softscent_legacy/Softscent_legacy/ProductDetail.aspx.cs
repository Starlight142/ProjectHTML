using System;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI;

public partial class ProductDetail : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                BindProduct(id);
            }
        }
    }

    private void BindProduct(int id)
    {
        // Mock data matching Products.aspx.cs
        var products = new List<Product>
        {
            new Product(1, "Peppermint Fresh", "Cooling and refreshing.", 5.99m, "Images/products/peppermint.png", false),
            new Product(2, "Lavender Sleep", "Calming scent for deep sleep.", 6.99m, "Images/products/lavender.png", false),
            new Product(3, "Citrus Energy", "Boost your energy instantly.", 5.99m, "Images/products/citrus.png", false),
            new Product(4, "Traditional Thai Jar", "Authentic herbal blend.", 12.99m, "Images/products/thai_jar.png", true),
            new Product(5, "Eucalyptus Clear", "Clears nasal congestion.", 6.49m, "Images/products/eucalyptus.png", false),
            new Product(6, "Lemongrass Zen", "Spa-like relaxation.", 7.99m, "Images/products/lemongrass.png", true)
        };

        var product = products.FirstOrDefault(p => p.Id == id);
        if (product != null)
        {
            litName.Text = product.Name;
            litBreadcrumb.Text = product.Name;
            litDescription.Text = product.Description;
            litPrice.Text = product.Price.ToString("F2");
            ProductImage.Src = product.ImageUrl;
        }
    }
}
