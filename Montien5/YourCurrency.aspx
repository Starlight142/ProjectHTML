<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YourCurrency.aspx.cs" Inherits="YourCurrency" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 222px;
            text-align: center;
        }
        .auto-style4 {
            width: 91px;
            text-align: center;
        }
        .auto-style6 {
            width: 349px;
            height: 204px;
        }
        .auto-style7 {
            width: 57px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style6">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Your Currency :" ForeColor="#33CC33"></asp:Label>
                    </td>
                        
                    <td class="auto-style4">
                        <asp:Label ID="CLabel1" runat="server" ForeColor="#FF66FF" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="currencytext" runat="server" style="text-align: center" Text="text" ForeColor="#FF5050"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:LinkButton ID="LinkBackButtom" runat="server" OnClick="LinkBackButtom_Click" style="font-style: italic">Back to Convert Currency</asp:LinkButton>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
