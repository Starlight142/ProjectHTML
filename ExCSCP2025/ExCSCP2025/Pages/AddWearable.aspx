<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddWearable.aspx.cs" Inherits="Pages_AddWearable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Add new Wearable<br />
    </p>
    <p>
        <table style="width:100%;" class="wearableTable">
            <tr>
                <td style="height: 28px; width: 165px;">Name:</td>
                <td style="height: 28px">
                    <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 165px">type:</td>
                <td>
                    <asp:DropDownList ID="listType" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sdsType" DataTextField="type" DataValueField="type">
                        <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:dbCPCCS69ConnectionString %>" SelectCommand="SELECT [type] FROM [typeWearable]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 165px">Price:</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 165px">Image:</td>
                <td>
                    <asp:DropDownList ID="ddImage" runat="server" AppendDataBoundItems="True" AutoPostBack="True" Width="300px">
                        <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="btnUploadImage" runat="server" CausesValidation="False" Text="Upload Image" OnClick="btnUploadImage_Click" />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 165px">Review:</td>
                <td>
                    <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine" Width="332px" Height="98px"></asp:TextBox>
                    <br />
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnSave" runat="server" Text="save" OnClick="btnSave_Click" />
    </p>
    <p>
    </p>
</asp:Content>

