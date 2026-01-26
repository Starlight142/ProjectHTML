<%@ Page Title="Wearable Overview" Language="C#" MasterPageFile="~/MasterPageCMS.master" AutoEventWireup="true"
    CodeFile="WearableOverview.aspx.cs" Inherits="Pages_WearableOverview" %>
    <%-- Administrator overview of all wearable products in the database. --%>

        <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <p>
                Available Weareable:</p>
            <p>
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Pages/AddWearable.aspx">Add New Wearable
                </asp:LinkButton>
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                    DataKeyNames="idWearable" DataSourceID="sds_Wearable" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="idWearable" HeaderText="idWearable" InsertVisible="False"
                            ReadOnly="True" SortExpression="idWearable" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:BoundField DataField="review" HeaderText="review" SortExpression="review" />
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
                <asp:SqlDataSource ID="sds_Wearable" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:dbCPCCS69ConnectionString %>"
                    DeleteCommand="DELETE FROM [wearable] WHERE [idWearable] = @original_idWearable AND [name] = @original_name AND [type] = @original_type AND [price] = @original_price AND [image] = @original_image AND [review] = @original_review"
                    InsertCommand="INSERT INTO [wearable] ([name], [type], [price], [image], [review]) VALUES (@name, @type, @price, @image, @review)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [wearable]"
                    UpdateCommand="UPDATE [wearable] SET [name] = @name, [type] = @type, [price] = @price, [image] = @image, [review] = @review WHERE [idWearable] = @original_idWearable AND [name] = @original_name AND [type] = @original_type AND [price] = @original_price AND [image] = @original_image AND [review] = @original_review">
                    <DeleteParameters>
                        <asp:Parameter Name="original_idWearable" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_type" Type="String" />
                        <asp:Parameter Name="original_price" Type="Double" />
                        <asp:Parameter Name="original_image" Type="String" />
                        <asp:Parameter Name="original_review" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="price" Type="Double" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="review" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="price" Type="Double" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="review" Type="String" />
                        <asp:Parameter Name="original_idWearable" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_type" Type="String" />
                        <asp:Parameter Name="original_price" Type="Double" />
                        <asp:Parameter Name="original_image" Type="String" />
                        <asp:Parameter Name="original_review" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </p>
        </asp:Content>