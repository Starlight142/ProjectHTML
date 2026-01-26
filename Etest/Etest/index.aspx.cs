using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Services;

namespace Etest
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static List<Product> GetItems()
        {
            return ConnectionClass.GetAllProducts();
        }

        [WebMethod]
        public static string AddItem(string name, string category, decimal price, int quantity)
        {
            try
            {
                string query = "INSERT INTO Products (Name, Category, Price, Quantity) VALUES (@Name, @Category, @Price, @Quantity)";
                SqlParameter[] parameters = {
                    new SqlParameter("@Name", name),
                    new SqlParameter("@Category", category),
                    new SqlParameter("@Price", price),
                    new SqlParameter("@Quantity", quantity)
                };

                ConnectionClass.ExecuteNonQuery(query, parameters);
                return "Success";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        [WebMethod]
        public static string UpdateItem(int id, string name, string category, decimal price, int quantity)
        {
            try
            {
                string query = "UPDATE Products SET Name=@Name, Category=@Category, Price=@Price, Quantity=@Quantity WHERE Id=@Id";
                SqlParameter[] parameters = {
                    new SqlParameter("@Id", id),
                    new SqlParameter("@Name", name),
                    new SqlParameter("@Category", category),
                    new SqlParameter("@Price", price),
                    new SqlParameter("@Quantity", quantity)
                };

                ConnectionClass.ExecuteNonQuery(query, parameters);
                return "Success";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        [WebMethod]
        public static string DeleteItem(int id)
        {
            try
            {
                string query = "DELETE FROM Products WHERE Id=@Id";
                SqlParameter[] parameters = {
                    new SqlParameter("@Id", id)
                };

                ConnectionClass.ExecuteNonQuery(query, parameters);
                return "Success";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
    }
}
