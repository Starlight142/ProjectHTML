using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Admin_Products : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProducts();
        }
    }

    private void BindProducts()
    {
        var products = new List<Product>();
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            string query = "SELECT Id, Name, Description, Price, ImageUrl, IsCustomizable FROM Products";
            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn))
            {
                try
                {
                    conn.Open();
                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            products.Add(new Product(
                                (int)reader["Id"],
                                reader["Name"].ToString(),
                                reader["Description"] != DBNull.Value ? reader["Description"].ToString() : "",
                                (decimal)reader["Price"],
                                reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : "",
                                (bool)reader["IsCustomizable"]
                            ));
                        }
                    }
                }
                catch (Exception)
                {
                    // Fallback
                }
            }
        }

        AdminProductRepeater.DataSource = products;
        AdminProductRepeater.DataBind();
    }
}
