using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Softscent.Models;

public partial class Pages_Reviews : System.Web.UI.Page
{
    // Extended class to hold display info like UserName
    public class ReviewViewModel : Review
    {
        public string ReviewerName { get; set; }
    }

    public List<ReviewViewModel> ReviewList = new List<ReviewViewModel>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadReviews();
        }
    }

    private void LoadReviews()
    {
        // Join with Users table if possible, otherwise just show generic or from current session knowledge
        // Assuming Users table has 'Id' (nvarchar) and 'FirstName' or similar.
        // If the query fails due to missing column, we might need to fallback to just showing "Anonymous" or fixing schema later.

        // SAFE APPROACH: Try minimal selection first or use LEFT JOIN with safety
        string query = @"
            SELECT r.*, u.FirstName 
            FROM Reviews r 
            LEFT JOIN Users u ON r.UserId = u.Id 
            ORDER BY r.CreatedDate DESC";

        DataTable dt;
        try
        {
            dt = DataHelper.ExecuteQuery(query);
        }
        catch
        {
            // Fallback if JOIN fails (maybe Users table has different structure)
            query = "SELECT * FROM Reviews ORDER BY CreatedDate DESC";
            dt = DataHelper.ExecuteQuery(query);
        }

        ReviewList.Clear();
        foreach (DataRow row in dt.Rows)
        {
            ReviewViewModel review = new ReviewViewModel
            {
                Id = Convert.ToInt32(row["Id"]),
                Rating = Convert.ToInt32(row["Rating"]),
                Comment = row["Comment"].ToString(),
                CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                UserId = row["UserId"].ToString()
            };

            // Try to set name
            if (dt.Columns.Contains("FirstName") && row["FirstName"] != DBNull.Value)
            {
                review.ReviewerName = row["FirstName"].ToString();
            }
            else
            {
                // Verify if it's the current user, maybe we display "You"
                review.ReviewerName = "ลูกค้า (" + review.UserId.Substring(0, Math.Min(3, review.UserId.Length)) + "...)";
            }

            ReviewList.Add(review);
        }
    }

    protected void btnSubmitReview_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            // We need the User ID. Since Session["User"] only stores Email in this legacy app (from Login.aspx analysis),
            // We need to fetch ID or just store Email as UserId if that's how the constraint works.
            // Let's assume we fetch ID from Email first.
            string userEmail = Session["User"].ToString();
            string userId = GetUserIdFromEmail(userEmail);

            int rating = int.Parse(ddlRating.SelectedValue);
            string comment = txtReviewComment.Text.Trim();

            if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(comment))
            {
                string query = "INSERT INTO Reviews (UserId, Rating, Comment, CreatedDate) VALUES (@UserId, @Rating, @Comment, GETDATE())";
                var parameters = new Dictionary<string, object>
                {
                    { "@UserId", userId },
                    { "@Rating", rating },
                    { "@Comment", comment }
                };

                DataHelper.ExecuteNonQuery(query, parameters);

                // Reset and Reload
                txtReviewComment.Text = "";
                ddlRating.SelectedIndex = 4; // Default 5 stars
                LoadReviews();
            }
        }
        else
        {
            Response.Redirect("/Pages/Login.aspx");
        }
    }

    private string GetUserIdFromEmail(string email)
    {
        string query = "SELECT Id FROM Users WHERE Email = @Email";
        object result = DataHelper.ExecuteScalar(query, new Dictionary<string, object> { { "@Email", email } });
        return result != null ? result.ToString() : null;
    }
}
