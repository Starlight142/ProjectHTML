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
        List<CartItem> cart = Session["Cart"] as List<CartItem>;
        
        if (cart != null && cart.Count > 0)
        {
            CartRepeater.Visible = true;
            EmptyCartPanel.Visible = false;
            
            CartRepeater.DataSource = cart;
            CartRepeater.DataBind();
            
            decimal total = 0;
            foreach(var item in cart)
            {
                total += item.TotalPrice;
            }

            litSubtotal.Text = total.ToString("F2");
            litTotal.Text = total.ToString("F2");
        }
        else
        {
            CartRepeater.Visible = false;
            EmptyCartPanel.Visible = true;
            litSubtotal.Text = "0.00";
            litTotal.Text = "0.00";
        }
    }
}
