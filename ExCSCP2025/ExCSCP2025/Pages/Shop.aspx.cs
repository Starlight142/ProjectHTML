using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Pages_Shop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateControls();
    }
    private void GenerateControls()
    {
        ArrayList wearableList = ConnectionClass.GetWearableByType("%");
        foreach (Wearable wearable in wearableList)
        {
            Panel wearablePanel = new Panel();
            Image image = new Image { ImageUrl = wearable.Image, CssClass = "ProductImage" };
            Literal literal1 = new Literal { Text = "<br />" };
            Literal literal2 = new Literal { Text = "<br />" };
            Label lblName = new Label { Text = wearable.Name, CssClass = "ProductName" };
            Label lblPrice = new Label { Text = String.Format("{0:0.00}", wearable.Price + "<br />"), 
                                            CssClass = "ProductPrice"};
            TextBox txtBox = new TextBox { ID = wearable.IdWearable.ToString(), CssClass = "ProductTextBox",
                                            Width = 60, Text = "0"};
            RegularExpressionValidator regex = new RegularExpressionValidator { 
                                            ValidationExpression = "^[0-9]*",
                                             ControlToValidate = txtBox.ID,
                                              ErrorMessage = "Please enter a number" };
            wearablePanel.Controls.Add(image);
            wearablePanel.Controls.Add(literal1);
            wearablePanel.Controls.Add(lblName);
            wearablePanel.Controls.Add(literal2);
            wearablePanel.Controls.Add(lblPrice);
            wearablePanel.Controls.Add(txtBox);
            wearablePanel.Controls.Add(regex);

            pnlProducts.Controls.Add(wearablePanel);
        }
    }
    private ArrayList GetOrder()
    {
        ArrayList orderList = new ArrayList();

        ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
        ControlFinder<TextBox> cf = new ControlFinder<TextBox>();

        cf.FindChildControlRecusive(cph);//find textbox

        var textboxList = cf.FoundControls;

        foreach (TextBox textBox in textboxList)
        {
            if (textBox.Text != "")
            {
                int amountOfOrder = Convert.ToInt32(textBox.Text);
                if (amountOfOrder > 0)
                {
                    Wearable wearable = ConnectionClass.GetWearableById(Convert.ToInt32(textBox.ID));
                    Order order = new Order(Session["login"].ToString(), wearable.Name, amountOfOrder, 
                                            wearable.Price, DateTime.Now, false);
                    orderList.Add(order);
                }
            }
        }
        return orderList;
    }

    private void GenerateReview()
    {
        double totalAmount = 0.0;
        ArrayList orderList = GetOrder();
        Session["orders"] = orderList;

        StringBuilder sb = new StringBuilder();
        sb.Append("<table>");
        sb.Append("<h3>Please review your order.</h3>");
        foreach (Order order in orderList)
        {
            double totalRow = order.Price * order.Amount;
            sb.Append(string.Format(@"<tr>
                                            <td widht='50px'>{0} X </td>
                                            <td widht='200px'>{1} ({2})</td>
                                            <td>{3}</td><td>Baht</td>
                                    </tr>", order.Amount, order.Product, order.Price,
                                    string.Format("{0:0.00}", totalRow)));
            totalAmount += totalRow;
        }
        sb.Append(string.Format(@"<tr>
                                        <td><b>Total: </b></td>
                                        <td><b>{0} Baht</b></td>
                                    </tr>", totalAmount));
        sb.Append("</table>");

        lblResult.Text = sb.ToString();
        lblResult.Visible = true;
        btnOK.Visible = true;
        btnCancel.Visible = true;
    }
    private void Authenticate()
    {
        if (Session["login"] == null)
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
        }
    }

    private void ClearAmount()
    {
        ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
        ControlFinder<TextBox> cf = new ControlFinder<TextBox>();
        cf.FindChildControlRecusive(cph);
        var textBoxList = cf.FoundControls;
        foreach (TextBox textBox in textBoxList)
        {
            if (textBox.Text != "0")
                textBox.Text = "0";
        }
    }

    private void SendOrder()
    {
        ArrayList orderList = (ArrayList)Session["orders"];
        ConnectionClass.AddOrder(orderList);
        Session["orders"] = null;
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        Authenticate();
        GenerateReview();
        ClearAmount();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        Authenticate();
        SendOrder();

        lblResult.Text = "Your order has been placed, thank you for shopping at our store.";
        btnOK.Visible = false;
        btnCancel.Visible = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session["orders"] = null;
        btnCancel.Visible = false;
        btnOK.Visible = false;
        lblResult.Visible = false;
    }
}