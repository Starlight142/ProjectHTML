<%@ Page Title="Shop" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs"
    Inherits="Pages_Shop" %>
    <%-- Storefront page where users can browse products and add them to their order. --%>

        <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <p>
                <br />
                <asp:Label ID="lblResult" runat="server" Text="Label" Visible="False"></asp:Label>
            </p>
            <p>
                <asp:Button ID="btnOK" runat="server" Text="OK" Visible="False" OnClick="btnOK_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="False" OnClick="btnCancel_Click" />
            </p>
            <p>
                <asp:Button ID="btnOrder" runat="server" Text="Order!" OnClick="btnOrder_Click" />
            </p>
            <p>
                <asp:Label ID="lblEror" runat="server"></asp:Label>
            </p>
            <p>
            <table>

                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Panel ID="pnlProducts" runat="server">
            </asp:Panel>
            </p>

        </asp:Content>