using ATM5;
using Etest;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // This method is required by the OnClick attribute in the ASPX file.
        // Currently, the logic is handled by JavaScript calling WebMethods.
        // If server-side processing is needed, implement it here.
    }

    [System.Web.Services.WebMethod]
    public static List<bookbank> GetItems()
    {
        return ConnectionClass.GetAllProducts();
    }

    [System.Web.Services.WebMethod]
    public static string AddItem(string bookid, string bookname, string phone, float balance)
    {
        try
        {
            string query = "INSERT INTO bookbank (bookid, bookname, phone, balance) VALUES (@Bookid, @Name, @Phone, @Balance)";
            SqlParameter[] parameters = {
                    new SqlParameter("@Bookid", bookid),
                    new SqlParameter("@Name", bookname),
                    new SqlParameter("@Phone", phone),
                    new SqlParameter("@Balance", balance)
                };
            ConnectionClass.ExecuteNonQuery(query, parameters);
            return "Success";
        }
        catch (Exception ex) { return "Error: " + ex.Message; }
    }

    [System.Web.Services.WebMethod]
    public static string UpdateItem(string bookid, string bookname, string phone, float balance)
    {
        try
        {
            // Assuming bookid is the primary key/identifier
            string query = "UPDATE bookbank SET bookname=@Name, phone=@Phone, balance=@Balance WHERE bookid=@Bookid";
            SqlParameter[] parameters = {
                    new SqlParameter("@Bookid", bookid),
                    new SqlParameter("@Name", bookname),
                    new SqlParameter("@Phone", phone),
                    new SqlParameter("@Balance", balance)
                };
            ConnectionClass.ExecuteNonQuery(query, parameters);
            return "Success";
        }
        catch (Exception ex) { return "Error: " + ex.Message; }
    }

}