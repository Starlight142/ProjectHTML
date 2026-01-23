using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Support : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var tickets = new[] {
                new { Subject = "Delivery delayed", Date = DateTime.Now.AddDays(-2), Message = "Where is my order #1001?", IsResolved = true },
                new { Subject = "Ingredient question", Date = DateTime.Now.AddDays(-1), Message = "Is the Peppermint oil organic?", IsResolved = false }
            };
            TicketRepeater.DataSource = tickets;
            TicketRepeater.DataBind();
        }
    }
}
