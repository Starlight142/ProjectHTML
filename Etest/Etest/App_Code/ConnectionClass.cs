using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Etest
{
    public class ConnectionClass
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ExamDbConn"].ConnectionString;
        }

        public static SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            return conn;
        }

        public static List<Product> GetAllProducts()
        {
            List<Product> items = new List<Product>();
            using (SqlConnection conn = GetConnection())
            {
                string query = "SELECT Id, Name, Category, Price, Quantity FROM Products";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    items.Add(new Product
                    {
                        id = reader["Id"].ToString(),
                        name = reader["Name"].ToString(),
                        category = reader["Category"].ToString(),
                        price = Convert.ToDecimal(reader["Price"]),
                        quantity = Convert.ToInt32(reader["Quantity"])
                    });
                }
            }
            return items;
        }

        public static bool ExecuteNonQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                return rows > 0;
            }
        }
    }
}
