using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCal_Click(object sender, EventArgs e)
    {
        int score = int.Parse(txtScore.Text);
        string grade = "";

        if (score > 100)
        {
            grade = "มั่วไอควาย";
        }
        else if (score < 0)
        {
            grade = "F+";
        }
        else if (score >= 80)
        {
            grade = "A";
        }
        else if (score >= 75)
        {
            grade = "B+";
        }
        else if (score >= 70)
        {
            grade = "B";
        }
        else if (score >= 65)
        {
            grade = "C+";
        }
        else if (score >= 60)
        {
            grade = "C";
        }
        else if (score >= 55)
        {
            grade = "D+";
        }
        else if (score >= 50)
        {
            grade = "D";
        }
        else grade = "F";

        lblResult.Text = "เกรดของมึง: " + grade;
    }

}