<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Wearable.aspx.cs" Inherits="Pages_Wearable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
       
        Select a type:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="sysType" DataTextField="type" DataValueField="type" AppendDataBoundItems="True">
            <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="sysType" runat="server" ConnectionString="<%$ ConnectionStrings:dbCPCCS69ConnectionString %>" SelectCommand="SELECT DISTINCT [type] FROM [typeWearable] ORDER BY [type]"></asp:SqlDataSource>
       
    </p>
    <p>
       
        <asp:Label ID="lblOutput" runat="server" Text="Label"></asp:Label>
       
    </p>
    <p>
       
    </p>
    <p>
       

       
    </p>
    <p>
       
    </p>
    
</asp:Content>

