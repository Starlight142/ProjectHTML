<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConvertCurrency.aspx.cs" Inherits="ConvertCurrency" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 291px;
            text-align: center;
        }

        .auto-style3 {
            width: 291px;
            text-align: center;
            background-color: #FFFFCC;
        }

        .auto-style4 {
            text-align: center;
            width: 187px;
        }

        .auto-style5 {
            width: 187px;
        }

        .auto-style7 {
            width: 569px;
            height: 220px;
        }

        .auto-style8 {
            width: 326px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style7">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">ConvertCurrency</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="สกุลเงิน (THB)"></asp:Label>
                        <asp:TextBox ID="TextCurrency1" runat="server"></asp:TextBox>
                        <br />
                        </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style8" style="text-align: center">&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>-สกุลเงิน-</asp:ListItem>
                        <asp:ListItem>USD</asp:ListItem>
                        <asp:ListItem>EUR</asp:ListItem>
                        <asp:ListItem>JPY</asp:ListItem>
                        <asp:ListItem>HKD</asp:ListItem>
                        <asp:ListItem>SGD</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Font-Size="X-Large" ForeColor="#FF3300" OnClick="Button1_Click" Style="text-align: left" Text="Convert" Width="184px" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
