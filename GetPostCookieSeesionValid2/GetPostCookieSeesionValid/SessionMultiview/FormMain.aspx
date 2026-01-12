<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormMain.aspx.cs" Inherits="Multiview_FormMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            width: 315px;
            background-color: #CCFFCC;
        }
        .auto-style5 {
            width: 392px;
            text-align: center;
            background-color: #FFCCFF;
        }
        .auto-style6 {
            width: 392px;
            background-color: #FFCCFF;
        }
        .auto-style7 {
            text-align: center;
            width: 182px;
            background-color: #FFCC99;
        }
        .auto-style12 {
            text-align: center;
            width: 363px;
            background-color: #99CCFF;
        }
        .auto-style13 {
            width: 392px;
            height: 26px;
            background-color: #FFCCFF;
        }
        .auto-style14 {
            text-align: center;
            width: 182px;
            height: 26px;
            background-color: #FFCC99;
        }
        .auto-style15 {
            text-align: center;
            width: 363px;
            height: 26px;
            background-color: #99CCFF;
        }
        .auto-style16 {
            text-align: center;
            width: 315px;
            height: 26px;
            background-color: #CCFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="กรุณาเลือกอาหารหรือเครื่องดื่ม: "></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
                <asp:ListItem>อาหาร</asp:ListItem>
                <asp:ListItem>เครื่องดื่ม</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="Meat" runat="server">
                <table style="width:100%;">
                      <tr>
                        <td class="auto-style5">รายการอาหาร</td>
                        <td class="auto-style7">ราคา</td>
                        <td class="auto-style12">จำนวน</td>
                        <td class="auto-style2">ราคารวม</td>
                     </tr>
                     <tr>
                        <td class="auto-style13">
                            <asp:CheckBox ID="ckOne" runat="server" AutoPostBack="True" OnCheckedChanged="ckOne_CheckedChanged" Text="ข้าวขาหมู" />
                         </td>
                        <td class="auto-style14">
                            <asp:Label ID="lblPrice1" runat="server" Text="50"></asp:Label>
                         </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="txtQN1" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN1_TextChanged"></asp:TextBox>
                         </td>
                        <td class="auto-style16">
                            <asp:TextBox ID="txtTotal1" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                        <td class="auto-style13">
                            <asp:CheckBox ID="ckTwo" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                         </td>
                        <td class="auto-style14">
                            <asp:Label ID="lblPrice2" runat="server" Text="60"></asp:Label>
                         </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="txtQN2" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN2_TextChanged"></asp:TextBox>
                         </td>
                        <td class="auto-style16">
                            <asp:TextBox ID="txtTotal2" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                         </td>
                     </tr>
                </table>
            </asp:View>
            <asp:View ID="Drink" runat="server">
            </asp:View>
        </asp:MultiView>
        <asp:Button ID="btnClick" runat="server" Text="รวมรายการ" Visible="False" OnClick="btnClick_Click" />
    </form>
</body>
</html>
