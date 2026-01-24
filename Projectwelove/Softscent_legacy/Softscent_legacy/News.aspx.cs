using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class News : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindNews();
        }
    }

    private void BindNews()
    {
        var newsList = new List<NewsItem>();
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            string query = "SELECT Id, Title, Content, ImageUrl, PublishedDate FROM News ORDER BY PublishedDate DESC";
            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, conn))
            {
                try
                {
                    conn.Open();
                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            newsList.Add(new NewsItem
                            {
                                Id = (int)reader["Id"],
                                Title = reader["Title"].ToString(),
                                Content = reader["Content"].ToString(),
                                ImageUrl = reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : null,
                                PublishedDate = (DateTime)reader["PublishedDate"]
                            });
                        }
                    }
                }
                catch (Exception)
                {
                    // If database connection fails, the list remains empty.
                    // In a production environment, logging should be implemented.
                }
            }
        }

        NewsRepeater.DataSource = newsList;
        NewsRepeater.DataBind();
    }
}
