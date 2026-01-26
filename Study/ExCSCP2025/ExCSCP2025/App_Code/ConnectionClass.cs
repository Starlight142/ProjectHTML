using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Provides data access methods for interacting with the database.
/// </summary>
public class ConnectionClass
{
    private static SqlConnection conn;
    private static SqlCommand command;

    /// <summary>
    /// Static constructor to initialize the database connection.
    /// </summary>
    static ConnectionClass()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbCPCCS69ConnectionString"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    /// <summary>
    /// Retrieves a list of wearable products by type.
    /// </summary>
    /// <param name="wearableType">The type of wearable to search for.</param>
    /// <returns>An ArrayList of Wearable objects.</returns>
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

    /// <summary>
    /// Adds a new wearable product to the database.
    /// </summary>
    /// <param name="wearable">The Wearable object to be added.</param>
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

    /// <summary>
    /// Authenticates a user based on username and password.
    /// </summary>
    /// <param name="name">The username.</param>
    /// <param name="password">The password.</param>
    /// <returns>A User object if authentication is successful; otherwise, null.</returns>
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

    /// <summary>
    /// Checks if a username is available.
    /// </summary>
    /// <param name="name">The username to check.</param>
    /// <returns>1 if valid/available; 0 if already exists.</returns>
    public static int ValidUsername(string name)
    {
        string query = string.Format("SELECT COUNT(*) FROM users WHERE user_name = '{0}'", name);
        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUser = (int)command.ExecuteScalar();
            if (amountOfUser > 0)
                return 0;
            else
                return 1;
        }
        finally
        {
            conn.Close();
        }          
    } 

    /// <summary>
    /// Registers a new user in the system.
    /// </summary>
    /// <param name="user">The User object containing registration data.</param>
    /// <returns>A message indicating registration status.</returns>
    public static string RegisterUser(User user)
    {
        string query = string.Format("SELECT COUNT(*) FROM users WHERE user_name = '{0}'", user.UserName);

        try
        {
            conn.Open();
            command.CommandText = query;
            int amountOfUser = (int)command.ExecuteScalar();

            if (amountOfUser < 1)
            {
                query = string.Format(@"INSERT INTO users VALUES('{0}', '{1}', '{2}', '{3}')", 
                                        user.UserName, user.PassWord, user.Email, user.UserType);
                command.CommandText = query;
                command.ExecuteNonQuery();
                return "User Registered";
            }
            else
            {
                return "A user with this name already exitx !!!!";
            }
        }
        finally
        {
            conn.Close();
        }
    }

    /// <summary>
    /// Retrieves a wearable product by its ID.
    /// </summary>
    /// <param name="id">The ID of the wearable.</param>
    /// <returns>A Wearable object if found; otherwise, null.</returns>
    public static Wearable GetWearableById(int id)
    {
        Wearable wearable = null;
        string query = string.Format("SELECT * FROM wearable WHERE idWearable = '{0}'", id);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string name = reader.GetString(1);
                string type = reader.GetString(2);
                double price = reader.GetDouble(3);
                string image = reader.GetString(4);
                string review = reader.GetString(5);

                wearable = new Wearable(name, type, price, image, review);
            }
        }
        finally
        {
            conn.Close();
        }

        return wearable;
    }

    /// <summary>
    /// Adds a list of orders to the database.
    /// </summary>
    /// <param name="orders">An ArrayList of Order objects.</param>
    public static void AddOrder(ArrayList orders)
    {
        string query = string.Format(@"INSERT INTO orders VALUES(@client, @product, @amount,
                                        @price, @date, @ordershipped)");
        try
        {
            conn.Open();
            command.CommandText = query;
            foreach (Order order in orders)
            {
                command.Parameters.Add(new SqlParameter("@client", order.Client));
                command.Parameters.Add(new SqlParameter("@product", order.Product));
                command.Parameters.Add(new SqlParameter("@amount", order.Amount));
                command.Parameters.Add(new SqlParameter("@price", order.Price));
                command.Parameters.Add(new SqlParameter("@date", order.Date));
                command.Parameters.Add(new SqlParameter("@ordershipped", order.OrderShipped));

                command.ExecuteNonQuery();
                command.Parameters.Clear();
            }

        }
        finally
        {
            conn.Close();
        }
    }
}