<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Pages_Wearable, App_Web_xiczaaw4" %>

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

