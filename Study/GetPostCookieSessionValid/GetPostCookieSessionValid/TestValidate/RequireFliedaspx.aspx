<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequireFliedaspx.aspx.cs" Inherits="TestValidate_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            username :<asp:TextBox ID="txtUser" runat="server" Width="237px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        password :<asp:TextBox ID="txtPass" runat="server" Width="237px"></asp:TextBox>
        <p style="margin-left: 120px">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
        </p>
    </form>
</body>
</html>
