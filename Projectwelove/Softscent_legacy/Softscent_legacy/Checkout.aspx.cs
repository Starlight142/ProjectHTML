using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Checkout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSummary();
        }
    }

    private void BindSummary()
    {
        List<CartItem> cart = Session["Cart"] as List<CartItem>;
        if (cart == null || cart.Count == 0)
        {
            Response.Redirect("Products.aspx");
            return;
        }

        decimal itemsTotal = 0;
        foreach (var item in cart)
        {
            itemsTotal += item.TotalPrice;
        }

        litItemsTotal.Text = itemsTotal.ToString("F2");
        litTotal.Text = itemsTotal.ToString("F2"); // Shipping update logic could go here
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("Login.aspx?ReturnUrl=Checkout.aspx");
            return;
        }

        if (string.IsNullOrEmpty(txtAddress.Text))
        {
            lblMessage.Text = "Please enter shipping address.";
            lblMessage.Visible = true;
            return;
        }

        List<CartItem> cart = Session["Cart"] as List<CartItem>;
        if (cart == null || cart.Count == 0) return;

        string userId = Session["UserId"].ToString();
        decimal totalAmount = 0;
        foreach (var item in cart) totalAmount += item.TotalPrice;

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            conn.Open();
            System.Data.SqlClient.SqlTransaction transaction = conn.BeginTransaction();

            try
            {
                // Insert Order
                string orderQuery = @"INSERT INTO Orders (UserId, OrderDate, TotalAmount, Status, ShippingAddress, ShippingMethod, PaymentMethod, PaymentStatus) 
                                      OUTPUT INSERTED.Id
                                      VALUES (@UserId, @OrderDate, @TotalAmount, 'Global_Pending', @ShippingAddress, @ShippingMethod, @PaymentMethod, 'Pending')";

                int orderId;
                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(orderQuery, conn, transaction))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    cmd.Parameters.AddWithValue("@ShippingAddress", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@ShippingMethod", rbStandard.Checked ? "Standard" : "Express");
                    cmd.Parameters.AddWithValue("@PaymentMethod", ddlPayment.SelectedValue);

                    orderId = (int)cmd.ExecuteScalar();
                }

                // Insert OrderDetails
                string detailQuery = @"INSERT INTO OrderDetails (OrderId, ProductId, Quantity, UnitPrice) 
                                       VALUES (@OrderId, @ProductId, @Quantity, @UnitPrice)";

                foreach (var item in cart)
                {
                    using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(detailQuery, conn, transaction))
                    {
                        cmd.Parameters.AddWithValue("@OrderId", orderId);
                        cmd.Parameters.AddWithValue("@ProductId", item.ProductId);
                        cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                        cmd.Parameters.AddWithValue("@UnitPrice", item.Price);
                        cmd.ExecuteNonQuery();
                    }
                }

                transaction.Commit();

                // Clear Cart and Redirect
                Session["Cart"] = null;
                // Redirect to a simple success page or home with a message
                // For now, redirect home
                Response.Write("<script>alert('Order placed successfully!');window.location='Default.aspx';</script>");
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                lblMessage.Text = "Error placing order: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}
