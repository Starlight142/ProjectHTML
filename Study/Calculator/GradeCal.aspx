<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GradeCal.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>หน้าคำนวนเกรด</title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h2>Grade Calculator</h2>
            
            <asp:TextBox ID="txtScore" runat="server" CssClass="input" placeholder="กรอกคะเเนน (0-100)"></asp:TextBox>

            <asp:Button ID="btnCal" runat="server" Text="คำนวนเกรด" CssClass="btn" OnClick="btnCal_Click" ForeColor="Black" />

            <asp:Label ID="lblResult" runat="server" ></asp:Label>
        
        </div>        
    </form>
</body>
</html>
