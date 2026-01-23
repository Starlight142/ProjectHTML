<%@ Page Title="Order History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="OrderHistory.aspx.cs" Inherits="OrderHistory" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="mb-4">My Orders</h1>

            <div class="table-responsive">
                <table class="table table-hover border">
                    <thead class="table-light">
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="OrderRepeater" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>#<%# Eval("Id") %>
                                    </td>
                                    <td>
                                        <%# Eval("Date", "{0:MMM dd, yyyy}" ) %>
                                    </td>
                                    <td class="fw-bold text-primary">$<%# Eval("Total", "{0:F2}" ) %>
                                    </td>
                                    <td><span
                                            class='badge <%# (string)Eval("Status") == "Completed" ? "bg-success" : "bg-warning text-dark" %>'>
                                            <%# Eval("Status") %>
                                        </span></td>
                                    <td><a href='OrderDetails.aspx?id=<%# Eval("Id") %>'
                                            class="btn btn-sm btn-outline-secondary rounded-pill">View Details</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </asp:Content>