<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Pages_Account_Login, App_Web_kf5c3oeo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td style="width: 228px; text-align: right">login: </td>
        <td>
            <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 228px; text-align: right; height: 28px">passwird: </td>
        <td style="height: 28px">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 228px; text-align: right">
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="login" />
            <br />
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

