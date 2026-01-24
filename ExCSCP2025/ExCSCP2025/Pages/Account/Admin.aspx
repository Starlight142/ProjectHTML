<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Pages_Account_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Manage User: 
    </p>
<p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="idUsers" DataSourceID="sds_users" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="idUsers" HeaderText="idUsers" InsertVisible="False" ReadOnly="True" SortExpression="idUsers" />
                <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="sds_users" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbCPCCS69ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [idUsers] = @original_idUsers AND [user_name] = @original_user_name AND [password] = @original_password AND [email] = @original_email AND [user_type] = @original_user_type" InsertCommand="INSERT INTO [users] ([user_name], [password], [email], [user_type]) VALUES (@user_name, @password, @email, @user_type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [user_name] = @user_name, [password] = @password, [email] = @email, [user_type] = @user_type WHERE [idUsers] = @original_idUsers AND [user_name] = @original_user_name AND [password] = @original_password AND [email] = @original_email AND [user_type] = @original_user_type">
            <DeleteParameters>
                <asp:Parameter Name="original_idUsers" Type="Int32" />
                <asp:Parameter Name="original_user_name" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_user_type" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="user_type" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="user_type" Type="String" />
                <asp:Parameter Name="original_idUsers" Type="Int32" />
                <asp:Parameter Name="original_user_name" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_user_type" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

