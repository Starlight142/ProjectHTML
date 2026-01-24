<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        session["f1"] = 0;
        session["f2"] = 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedIndex)
        {
            case 0:
                MultiView1.ActiveViewIndex = false;
                btnCiick.Visible = false;
                break;
            case 1:
                MultiView1.ActiveViewIndex = true;
                MultiView1.SetActiveView(Meat);
                btnCiick.Visible = true;
                break;
            case 2:
                MultiView1.ActiveViewIndex = 1;
                MultiView1.SetActiveView(Drink);
                btnCiick.Visible = true;
                break;
        }
    }

    protected void ckOne_CheckedChanged(object sender, EventArgs e)
    {
        if (ckOne.Checked == true)
        {
            txtQN1.visible = true;
            txtTotal1.Visible = true;
            Session["f1"] = txtTotal1.Text;
        }
        else
        {
            txtQN1.visible = true;
            txtTotal1.Visible = true;
            Session["f1"] = 0;
        }
    }

    protected void ckTwo_CheckedChanged(object sender, EventArgs e)
    {
        if (ckTwo.Checked == true)
        {
            txtQN2.visible = true;
            txtTotal2.Visible = true;
            Session["f2"] = txtTotal1.Text;
        }
        else
        {
            txtQN2.visible = true;
            txtTotal2.Visible = true;
            Session["f2"] = 0;
        }
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
    <style type="text/css">
        .auto-style7 {
            height: 23px;
            width: 297px;
            text-align: center;
        }
        .auto-style8 {
            width: 297px;
            text-align: left;
        }
        .auto-style17 {
            height: 23px;
            width: 133px;
            text-align: center;
        }
        .auto-style18 {
            width: 133px;
            text-align: left;
        }
        .auto-style19 {
            height: 23px;
            width: 167px;
            text-align: center;
            background-color: #9999FF;
        }
        .auto-style20 {
            width: 167px;
            text-align: left;
            background-color: #9999FF;
        }
        .auto-style21 {
            width: 133px;
            text-align: center;
        }
        .auto-style22 {
            height: 23px;
            width: 115px;
            text-align: center;
            background-color: #FFFFCC;
        }
        .auto-style23 {
            width: 115px;
            text-align: center;
            background-color: #FFFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
        <asp:Label ID="Label1" runat="server" Text="กรุณาเลือกอาหารหรือเครื่องดื่ม :"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>กรุณาเลือก</asp:ListItem>
            <asp:ListItem>อาหาร</asp:ListItem>
            <asp:ListItem>เครื่องดื่ม</asp:ListItem>
        </asp:DropDownList>
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
            <asp:View ID="Meat" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style19">รายการอาหาร</td>
                        <td class="auto-style22"><strong>ราคา</strong></td>
                        <td class="auto-style17">จำนวน</td>
                        <td aria-expanded="undefined" class="auto-style7">ราคารวม</td>
                    </tr>
                    <tr>
                        <td class="auto-style20">
                            <asp:CheckBox ID="ckOne" runat="server" Text="ข้าวขาหมู" OnCheckedChanged="ckOne_CheckedChanged" />
                        </td>
                        <td class="auto-style23"><strong>50</strong></td>
                        <td class="auto-style21">
                            <asp:TextBox ID="txtQN1" runat="server" AutoPostBack="True" Visible="False"></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtTotal1" runat="server" AutoPostBack="True" BackColor="#999999" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">
                            <asp:CheckBox ID="ckTwo" runat="server" Text="ข้าวผัวปู" OnCheckedChanged="ckTwo_CheckedChanged" />
                        </td>
                        <td class="auto-style23"><strong>60</strong></td>
                        <td class="auto-style18">
                            <asp:TextBox ID="TxtQN2" runat="server" AutoPostBack="True" Visible="False"></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtTotal2" runat="server" AutoPostBack="True" BackColor="#999999" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Drink" runat="server">
            </asp:View>
        </asp:MultiView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="รวมรายการ" Visible="False" />
    </form>
</body>
</html>
