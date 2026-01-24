using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ConnectionClass
/// </summary>
public class ConnectionClass
{
    private static SqlConnection conn;
    private static SqlCommand command;

    static ConnectionClass()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbCPCCS69ConnectionString"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    public static ArrayList GetWearableByType(string wearableType)
    {
        ArrayList list = new ArrayList();
        string query = "SELECT * FROM wearable WHERE type LIKE @type";
        SqlCommand command = new SqlCommand(query, conn);
        command.Parameters.AddWithValue("@type", "%" + wearableType + "%");
        try
        {
            conn.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int idWearable = reader.GetInt32(0);
                string name = reader.GetString(1);
                string type = reader.GetString(2);
                double price = reader.GetDouble(3);
                string image = reader.GetString(4);
                string review = reader.GetString(5);

                Wearable wearable = new Wearable(idWearable, name, type, price, image, review);

                list.Add(wearable);

            }
        }
        finally{
            conn.Close();
        }
        return list;
    }

    public static void AddWearable(Wearable wearable)
    {
        string query = string.Format(@"INSERT INTO wearable VALUES('{0}', '{1}', @price, '{2}', '{3}')"
                                        ,wearable.Name, wearable.Type, wearable.Image, wearable.Review);
        try
        {
            conn.Open();
            command.CommandText = query;
            command.Parameters.Add(new SqlParameter("@price", wearable.Price));
            command.ExecuteNonQuery();
        }
        finally
        {
            conn.Close();
            command.Parameters.Clear();
        }
    }

    public static User LoginUser(string name, string password)
    {
        User user = null;
        string queryCount = "SELECT COUNT(*) FROM users WHERE user_name = @user_name";
        SqlCommand command = new SqlCommand(queryCount, conn);

        command.Parameters.AddWithValue("@user_name", name.Trim());
        try
        {
            conn.Open();
            int amountOfUsers = (int)command.ExecuteScalar();

            if (amountOfUsers == 1)
            {
                string queryPassword = "SELECT password FROM users WHERE user_name = @user_name";
                SqlCommand cmdPassword = new SqlCommand(queryPassword, conn);
                cmdPassword.Parameters.AddWithValue("@user_name", name.Trim());
                object dbPasswordObj = cmdPassword.ExecuteScalar();

                if (dbPasswordObj != null)
                {
                    string dbpassword = dbPasswordObj.ToString().Trim();

                    if (string.Equals(dbpassword, password.Trim(), StringComparison.Ordinal))
                    {
                        string queryInfo = "SELECT email, user_type FROM users WHERE user_name = @user_name";
                        SqlCommand cmdInfo = new SqlCommand(queryInfo, conn);

                        cmdInfo.Parameters.AddWithValue("@user_name", name.Trim());
                        SqlDataReader reader = cmdInfo.ExecuteReader();
                        if (reader.Read())
                        {
                            string email = reader.GetString(0).Trim();
                            string user_type = reader.GetString(1).Trim();
                            user = new User(name.Trim(), dbpassword, email, user_type);
                        }
                    }
                }
            }
        }
        finally
        {
            conn.Close();
            command.Parameters.Clear();
        }
        return user;
    }

}