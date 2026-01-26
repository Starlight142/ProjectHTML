using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Softscent.Models;

public partial class Pages_News : System.Web.UI.Page
{
    public List<News> NewsList = new List<News>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNews();
        }
    }

    private void LoadNews()
    {
        string query = "SELECT * FROM News ORDER BY PublishedDate DESC";
        DataTable dt = DataHelper.ExecuteQuery(query);

        NewsList.Clear();
        foreach (DataRow row in dt.Rows)
        {
            NewsList.Add(new News
            {
                Id = Convert.ToInt32(row["Id"]),
                Title = row["Title"].ToString(),
                Content = row["Content"].ToString(),
                ImageUrl = row["ImageUrl"] != DBNull.Value ? row["ImageUrl"].ToString() : "",
                PublishedDate = Convert.ToDateTime(row["PublishedDate"])
            });
        }
    }

    protected void btnAddNews_Click(object sender, EventArgs e)
    {
        if (Session["Role"] != null && Session["Role"].ToString() == "Admin")
        {
            string title = txtNewTitle.Text.Trim();
            string content = txtNewContent.Text.Trim();
            string imageUrl = txtNewImage.Text.Trim();

            if (!string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(content))
            {
                string query = "INSERT INTO News (Title, Content, ImageUrl, PublishedDate) VALUES (@Title, @Content, @ImageUrl, GETDATE())";
                var parameters = new Dictionary<string, object>
                {
                    { "@Title", title },
                    { "@Content", content },
                    { "@ImageUrl", imageUrl }
                };

                DataHelper.ExecuteNonQuery(query, parameters);

                // Clear inputs and reload
                txtNewTitle.Text = "";
                txtNewContent.Text = "";
                txtNewImage.Text = "";

                LoadNews();
            }
        }
    }
}
