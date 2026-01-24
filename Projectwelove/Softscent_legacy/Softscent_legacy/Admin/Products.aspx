<%@ Page Title="Manage Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="Admin_Products" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1>Manage Products</h1>
            <button type="button" class="btn btn-primary"><i class="fas fa-plus me-1"></i> Create New</button>
        </div>

        <table class="table table-hover">
            <thead class="table-light">
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Customizable</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="AdminProductRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="width: 100px;">
                                <img src='<%# ResolveUrl("~/" + Eval("ImageUrl")) %>'
                                    style="width: 60px; height: 60px; object-fit: cover;" class="rounded" />
                            </td>
                            <td>
                                <h6 class="mb-0">
                                    <%# Eval("Name") %>
                                </h6>
                                <small class="text-muted">
                                    <%# Eval("Description") %>
                                </small>
                            </td>
                            <td>$<%# Eval("Price", "{0:F2}" ) %>
                            </td>
                            <td>
                                <%# (bool)Eval("IsCustomizable") ? "<span class='badge bg-info text-dark'>Yes</span>"
                                    : "<span class='badge bg-secondary'>No</span>" %>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary me-1"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </asp:Content>