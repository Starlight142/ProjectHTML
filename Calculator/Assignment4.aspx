<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Assignment4.aspx.cs" Inherits="Assignment4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="text-align: left">
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblhigh" runat="server" Text="ส่วนสูง: "></asp:Label>
        &nbsp;<asp:TextBox ID="txthigh" runat="server" placeholder="กรอกส่วนสูง"></asp:TextBox>
        <br />
        <asp:Label ID="lblweigh" runat="server" Text="น้ำหนัก: "></asp:Label>
        &nbsp;<asp:TextBox ID="txtweigh" runat="server" placeholder="กรอกน้ำหนัก"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btncal" runat="server" Text="คำนวณ" OnClick="btncal_Click" />
    </div>
</asp:Content>

