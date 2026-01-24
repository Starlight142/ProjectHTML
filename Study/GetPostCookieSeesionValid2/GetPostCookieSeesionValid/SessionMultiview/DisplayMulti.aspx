<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayMulti.aspx.cs" Inherits="SessionMultiview_DisplayMulti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 250px;
        }
        .auto-style4 {
            text-align: center;
            background-color: #FFFFCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style4" colspan="3">Your Order</td>
                </tr>
                <tr>
                    <td class="auto-style2">Order Total :</td>
                    <td>
                        <asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
