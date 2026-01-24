<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayPost.aspx.cs" Inherits="Post_DisplayPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblShowName" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Department: "></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblShowDepart" runat="server" ForeColor="Red"></asp:Label>

        </div>
    </form>
</body>
</html>
