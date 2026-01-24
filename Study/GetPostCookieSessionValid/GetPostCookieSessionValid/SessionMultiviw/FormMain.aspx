<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormMain.aspx.cs" Inherits="SessionMultiviw_FormMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 28px;
            text-align: center;
            background-color: #6666FF;
        }

        .auto-style2 {
            height: 28px;
            width: 406px;
            text-align: center;
            background-color: #9999FF;
        }

        .auto-style4 {
            width: 406px;
            text-align: left;
            background-color: #9999FF;
        }

        .auto-style5 {
            text-align: left;
        }

        .auto-style7 {
            margin-left: 0px;
        }

        .auto-style8 {
            height: 28px;
            text-align: center;
            width: 268px;
            background-color: #CC6699;
        }

        .auto-style10 {
            text-align: center;
            width: 341px;
            background-color: #0099FF;
        }

        .auto-style12 {
            height: 28px;
            text-align: center;
            width: 341px;
            background-color: #0099FF;
        }

        .auto-style14 {
            text-align: center;
            width: 268px;
            background-color: #CC6699;
        }

        .auto-style15 {
            width: 110%;
        }

        .auto-style16 {
            margin-left: 0px;
            background-color: #6666FF;
        }

        .auto-style17 {
            background-color: #3399FF;
        }

        .auto-style18 {
            margin-left: 30px;
        }
        .auto-style19 {
            width: 406px;
            text-align: left;
            background-color: #9999FF;
            height: 26px;
        }
        .auto-style20 {
            text-align: center;
            width: 268px;
            background-color: #CC6699;
            height: 26px;
        }
        .auto-style21 {
            text-align: center;
            width: 341px;
            background-color: #0099FF;
            height: 26px;
        }
        .auto-style22 {
            text-align: left;
            height: 26px;
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
                <table class="auto-style15">
                    <tr>
                        <td class="auto-style2">รายการอาหาร</td>
                        <td class="auto-style8">ราคา</td>
                        <td class="auto-style12">จำนวน</td>
                        <td class="auto-style1">ราคารวม</td>
                    </tr>
                    <tr>
                        <td class="auto-style19">
                            <asp:CheckBox ID="ckOne" runat="server" Text="ข้าวขาหมู" CssClass="auto-style17" OnCheckedChanged="Ck1_CheckedChanged" />
                        </td>
                        <td class="auto-style20">
                            <asp:Label ID="lblprice1" runat="server" Text="50"></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="txtNO1" runat="server" AutoPostBack="True" CssClass="auto-style18" OnTextChanged="txtNO1_TextChanged" Visible="False" Width="261px"></asp:TextBox>
                        </td>
                        <td class="auto-style22">
                            <asp:TextBox ID="txtTotal1" runat="server" AutoPostBack="True" BackColor="#999999" CssClass="auto-style16" Visible="False" Width="325px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;<asp:CheckBox ID="ckTwo" runat="server" Text="ข้าวผัดปู" CssClass="auto-style17" OnCheckedChanged="Ck2_CheckedChanged" />

                        </td>
                        <td class="auto-style14">
                            <asp:Label ID="lblprice2" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style10">
                            <asp:TextBox ID="txtNO2" runat="server" AutoPostBack="True" CssClass="auto-style18" Visible="False" Width="261px" OnTextChanged="txtNO2_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtTotal2" runat="server" AutoPostBack="True" BackColor="#999999" CssClass="auto-style7" Visible="False" Width="325px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Drink" runat="server">
            </asp:View>
            <br />
            <br />
            <br />
        </asp:MultiView>
        <asp:Button ID="btnClick" runat="server" Text="รวมรายการ" OnClick="Button1_Click" Visible="False" />
    </form>
</body>
</html>
