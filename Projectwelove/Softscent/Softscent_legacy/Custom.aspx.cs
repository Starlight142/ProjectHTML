using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Custom : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindHerbs();
        }
    }

    private void BindHerbs()
    {
        var herbs = new[] {
            new { Name = "Peppermint", Effect = "Cooling & Focus" },
            new { Name = "Lavender", Effect = "Calm & Sleep" },
            new { Name = "Eucalyptus", Effect = "Clear Breathing" },
            new { Name = "Star Anise", Effect = "Warmth & Comfort" },
            new { Name = "Borneol", Effect = "Traditional Freshness" },
            new { Name = "Camphor", Effect = "Stimulating" }
        };
        HerbRepeater.DataSource = herbs;
        HerbRepeater.DataBind();
    }
}
