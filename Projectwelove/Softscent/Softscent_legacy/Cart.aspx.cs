using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Cart : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCart();
        }
    }

    private void BindCart()
    {
        // Mock data for cart
        var cartItems = new[] {
            new { Name = "Peppermint Fresh", Quantity = 2, ImageUrl = "Images/products/peppermint.png", Description = "Inhaler", TotalPrice = 11.98m },
            new { Name = "Custom Herbal Blend", Quantity = 1, ImageUrl = "Images/products/thai_jar.png", Description = "Lavender, Eucalyptus", TotalPrice = 15.00m }
        };

        if (cartItems.Length > 0)
        {
            CartRepeater.DataSource = cartItems;
            CartRepeater.DataBind();
            litSubtotal.Text = "26.98";
            litTotal.Text = "26.98";
        }
        else
        {
            CartRepeater.Visible = false;
            EmptyCartPanel.Visible = true;
        }
    }
}
