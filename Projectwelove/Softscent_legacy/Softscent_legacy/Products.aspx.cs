using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Products : Page
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
        try
        {
            var products = new List<Product>();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
            {
                string query = "SELECT Id, Name, Description, Price, ImageUrl, IsCustomizable FROM Products";
                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn))
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
            }

            ProductRepeater.DataSource = products;
            ProductRepeater.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<div style='color:red; font-weight:bold; padding:20px; border:1px solid red;'>Error: " + ex.Message + "<br/> Stack: " + ex.StackTrace + "</div>");
        }
    }
}
