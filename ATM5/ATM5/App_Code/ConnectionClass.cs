using ATM5;
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
            return ConfigurationManager.ConnectionStrings["dbCSATMConn"].ConnectionString;
        }

        public static SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            return conn;
        }

        public static List<bookbank> GetAllProducts()
        {
            List<bookbank> items = new List<bookbank>();
            using (SqlConnection conn = GetConnection())
            {
                string query = "SELECT bookid,bookname,phone,balance FROM bookbank";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    items.Add(new bookbank
                    {
                        bookid = reader["BookId"].ToString(),
                        bookname = reader["Name"].ToString(),
                        phone = Convert.ToInt32(reader["Phone"]),
                        balance = Convert.ToInt32(reader["Balance"])
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
