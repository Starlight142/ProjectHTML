<%@ Page Title="Our Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="Products" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container pb-5">
            <div class="d-flex justify-content-between align-items-center mb-5 fade-in-up">
                <div>
                    <h1 class="display-4 fw-bold text-primary">Our Collection</h1>
                    <p class="lead text-muted">Discover the power of nature in every breath.</p>
                </div>
                <div class="d-flex gap-2">
                    <button class="btn btn-outline-primary rounded-pill px-4 active">All</button>
                    <button class="btn btn-outline-primary rounded-pill px-4">Inhalers</button>
                    <button class="btn btn-outline-primary rounded-pill px-4">Essential Oils</button>
                </div>
            </div>

            <div class="row g-4">
                <asp:Repeater ID="ProductRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3 fade-in-up" onclick="location.href='ProductDetail.aspx?id=<%# Eval(" Id")
                            %>';" style="cursor: pointer;">
                            <div class="card h-100 border-0 shadow-sm product-card bg-white">
                                <img src="<%# Eval(" ImageUrl") %>" class="card-img-top w-100" alt="<%# Eval("Name") %>"
                                    style="height: 250px; object-fit: contain; padding: 20px; background-color:
                                    #f8f9fa;">
                                    <div class="card-body p-3">
                                        <h5 class="fw-bold mb-1">
                                            <%# Eval("Name") %>
                                        </h5>
                                        <p class="text-muted small mb-2">
                                            <%# Eval("Description") %>
                                        </p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span class="fs-5 fw-bold text-primary">$<%# Eval("Price", "{0:F2}" ) %>
                                            </span>
                                            <button class="btn btn-sm btn-primary rounded-circle"><i
                                                    class="fas fa-plus"></i></button>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </asp:Content>