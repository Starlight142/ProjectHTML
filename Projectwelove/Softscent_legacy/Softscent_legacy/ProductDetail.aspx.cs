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
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            string query = "SELECT Id, Name, Description, Price, ImageUrl, IsCustomizable FROM Products WHERE Id = @Id";
            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Id", id);
                try
                {
                    conn.Open();
                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            var product = new Product(
                                (int)reader["Id"],
                                reader["Name"].ToString(),
                                reader["Description"] != DBNull.Value ? reader["Description"].ToString() : "",
                                (decimal)reader["Price"],
                                reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : "",
                                (bool)reader["IsCustomizable"]
                            );

                            litName.Text = product.Name;
                            litBreadcrumb.Text = product.Name;
                            litDescription.Text = product.Description;
                            litPrice.Text = product.Price.ToString("F2");
                            ProductImage.Src = product.ImageUrl;
                        }
                    }
                }
                catch (Exception) { }
            }
        }
    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            int id = int.Parse(Request.QueryString["id"]);
            int qty = 1;
            int.TryParse(txtQuantity.Text, out qty);
            if (qty < 1) qty = 1;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
            {
                string query = "SELECT Name, Price, ImageUrl, Description FROM Products WHERE Id = @Id";
                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    conn.Open();
                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Get existing cart or create new
                            List<CartItem> cart = Session["Cart"] as List<CartItem>;
                            if (cart == null)
                            {
                                cart = new List<CartItem>();
                            }

                            // Check if item exists
                            var existingItem = cart.FirstOrDefault(i => i.ProductId == id);
                            if (existingItem != null)
                            {
                                existingItem.Quantity += qty;
                            }
                            else
                            {
                                cart.Add(new CartItem(
                                    id,
                                    reader["Name"].ToString(),
                                    (decimal)reader["Price"],
                                    qty,
                                    reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : "",
                                    reader["Description"] != DBNull.Value ? reader["Description"].ToString() : ""
                                ));
                            }

                            Session["Cart"] = cart;
                            Response.Redirect("Cart.aspx");
                        }
                    }
                }
            }
        }
    }
}
