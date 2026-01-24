<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="card border-0 shadow-sm p-4 bg-white text-center">
                        <img id="ProductImage" runat="server" class="img-fluid"
                            style="max-height: 400px; object-fit: contain;" alt="Product Image" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav aria-label="breadcrumb" class="mb-3">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                            <li class="breadcrumb-item"><a href="Products.aspx">Products</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <asp:Literal ID="litBreadcrumb" runat="server"></asp:Literal>
                            </li>
                        </ol>
                    </nav>

                    <h1 class="display-4 fw-bold mb-3">
                        <asp:Literal ID="litName" runat="server"></asp:Literal>
                    </h1>
                    <p class="lead text-muted mb-4">
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </p>

                    <div class="mb-4">
                        <span class="h2 text-primary fw-bold">$<asp:Literal ID="litPrice" runat="server"></asp:Literal>
                        </span>
                    </div>

                    <div class="d-flex gap-3 mb-5">
                        <div class="input-group" style="width: 140px;">
                            <button class="btn btn-outline-secondary" type="button" onclick="decrementQty()">-</button>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control text-center" Text="1">
                            </asp:TextBox>
                            <button class="btn btn-outline-secondary" type="button" onclick="incrementQty()">+</button>
                        </div>
                    </div>

                    <script>
                        function incrementQty() {
                            var qty = document.getElementById('<%= txtQuantity.ClientID %>');
                            qty.value = parseInt(qty.value) + 1;
                        }
                        function decrementQty() {
                            var qty = document.getElementById('<%= txtQuantity.ClientID %>');
                            if (parseInt(qty.value) > 1) {
                                qty.value = parseInt(qty.value) - 1;
                            }
                        }
                    </script>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart"
                        CssClass="btn btn-primary btn-lg rounded-pill px-5 flex-grow-1" OnClick="btnAddToCart_Click" />
                </div>

                <div class="card bg-light border-0 p-3 mb-4">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-shipping-fast fa-2x text-muted me-3"></i>
                        <div>
                            <h6 class="mb-0">Fast Shipping</h6>
                            <small class="text-muted">Delivery in 2-3 business days.</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </asp:Content>