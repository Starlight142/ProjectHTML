<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Aspx_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblScore" runat="server" Text="คะแนน"></asp:Label> 
        &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtScore" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btncal" runat="server" Text="คำนวณ" OnClick="btncal_Click" />
        </div>
    </form>
</body>
</html>
