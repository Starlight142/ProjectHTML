using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Multiview_FormMain : System.Web.UI.Page
{
    int price1 = 0;
    int price2 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
            Session["f1"] = 0;
            Session["f2"] = 0;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedIndex)
        {
            case 0: MultiView1.Visible = false;
                    btnClick.Visible = false;
                    break;
            case 1: MultiView1.Visible = true;
                    MultiView1.SetActiveView(Meat);
                    btnClick.Visible = true;
                    break;
            case 2: MultiView1.Visible = true;
                    MultiView1.SetActiveView(Drink);
                    btnClick.Visible = true;
                    break;

        }
    }

    protected void ckOne_CheckedChanged(object sender, EventArgs e)
    {
        if (ckOne.Checked == true)
        {
            txtQN1.Visible = true;
            txtTotal1.Visible = true;
            Session["f1"] = txtTotal1.Text;
        }
        else 
        {
            txtQN1.Visible = false;
            txtTotal1.Visible = false;
            Session["f1"] = 0;
        }
    }

    protected void ckTwo_CheckedChanged(object sender, EventArgs e)
    {
        if (ckTwo.Checked == true)
        {
            txtQN2.Visible = true;
            txtTotal2.Visible = true;
            Session["f2"] = txtTotal2.Text;
        }
        else
        {
            txtQN2.Visible = false;
            txtTotal2.Visible = false;
            Session["f2"] = 0;
        }
    }

    protected void txtQN1_TextChanged(object sender, EventArgs e)
    {
        price1 = (int)Convert.ToInt32(lblPrice1.Text);
        txtTotal1.Text = (string)Convert.ToString(price1*Convert.ToInt32(txtQN1.Text));
    }

    protected void txtQN2_TextChanged(object sender, EventArgs e)
    {
        price2 = (int)Convert.ToInt32(lblPrice2.Text);
        txtTotal2.Text = (string)Convert.ToString(price2 * Convert.ToInt32(txtQN2.Text));
    }

    protected void btnClick_Click(object sender, EventArgs e)
    {
        if (ckOne.Checked == true)
            Session["f1"] = txtTotal1.Text;
        if (ckTwo.Checked == true)
            Session["f2"] = txtTotal2.Text;
        Server.Transfer("DisplayMulti.aspx");
    }
}