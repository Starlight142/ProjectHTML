<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Orders.aspx.cs" Inherits="Admin_Orders" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <h1>Manage Orders</h1>

        <table class="table table-hover">
            <thead class="table-light">
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>User</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="AdminOrderRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>#<%# Eval("Id") %>
                            </td>
                            <td>
                                <%# Eval("Date", "{0:g}" ) %>
                            </td>
                            <td>
                                <%# Eval("User") %>
                            </td>
                            <td>$<%# Eval("Total", "{0:F2}" ) %>
                            </td>
                            <td><span
                                    class='badge <%# (string)Eval("Status") == "Completed" ? "bg-success" : "bg-warning text-dark" %>'>
                                    <%# Eval("Status") %>
                                </span></td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">View & Manage</button>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Content>