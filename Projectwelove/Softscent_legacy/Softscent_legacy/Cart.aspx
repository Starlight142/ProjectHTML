<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Cart.aspx.cs" Inherits="Cart" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="mb-4">Your Shopping Cart</h1>

            <div class="row">
                <div class="col-md-8">
                    <asp:Repeater ID="CartRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3 shadow-sm border-0">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-2">
                                            <img src='<%# Eval("ImageUrl") %>' class="img-fluid rounded"
                                                alt='<%# Eval("Name") %>' />
                                        </div>
                                        <div class="col-5">
                                            <h5 class="mb-1">
                                                <%# Eval("Name") %>
                                            </h5>
                                            <small class="text-muted">
                                                <%# Eval("Description") %>
                                            </small>
                                        </div>
                                        <div class="col-2">
                                            <input type="number" class="form-control" value='<%# Eval("Quantity") %>'
                                                min="1" />
                                        </div>
                                        <div class="col-2 text-end">
                                            <span class="fw-bold">$<%# Eval("TotalPrice", "{0:F2}" ) %></span>
                                        </div>
                                        <div class="col-1 text-end">
                                            <button type="button" class="btn btn-link text-danger p-0"><i
                                                    class="fas fa-trash"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Panel ID="EmptyCartPanel" runat="server" Visible="false">
                        <div class="text-center py-5">
                            <i class="fas fa-shopping-cart fa-4x text-muted mb-3"></i>
                            <p class="lead">Your cart is empty.</p>
                            <a href="Products.aspx" class="btn btn-primary rounded-pill">Shop Now</a>
                        </div>
                    </asp:Panel>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm border-0 p-4">
                        <h3>Summary</h3>
                        <hr />
                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal</span>
                            <span id="subtotal">$<asp:Literal ID="litSubtotal" runat="server">0.00</asp:Literal></span>
                        </div>
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold">Total</span>
                            <span class="fw-bold text-primary fs-4">$<asp:Literal ID="litTotal" runat="server">0.00
                                </asp:Literal></span>
                        </div>
                        <a href="Checkout.aspx" class="btn btn-primary btn-lg w-100 rounded-pill">Proceed to
                            Checkout</a>
                        <a href="Products.aspx" class="btn btn-link w-100 mt-2 text-decoration-none text-muted">Continue
                            Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>