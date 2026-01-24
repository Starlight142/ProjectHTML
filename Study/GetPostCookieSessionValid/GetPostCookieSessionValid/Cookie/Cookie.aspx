<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie.aspx.cs" Inherits="Cookie_Cookie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHello" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="ชื่อ: "></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />

        </div>
    </form>
</body>
</html>
