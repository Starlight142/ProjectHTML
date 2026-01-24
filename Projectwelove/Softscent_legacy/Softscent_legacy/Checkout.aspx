<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="mb-5">Checkout</h1>

            <div class="row">
                <div class="col-md-7">
                    <div class="card shadow-sm border-0 p-4 mb-4">
                        <h4 class="mb-4">Shipping Information</h4>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"
                                Rows="3" placeholder="Enter your full address"></asp:TextBox>
                        </div>

                        <h4 class="mt-5 mb-3">Shipping Method</h4>
                        <div class="form-check mb-2">
                            <asp:RadioButton ID="rbStandard" runat="server" GroupName="Ship" Checked="true"
                                Text="Standard Shipping (Free)" CssClass="form-check-input" />
                        </div>
                        <div class="form-check">
                            <asp:RadioButton ID="rbExpress" runat="server" GroupName="Ship"
                                Text="Express Shipping ($5.00)" CssClass="form-check-input" />
                        </div>
                    </div>

                    <div class="card shadow-sm border-0 p-4">
                        <h4 class="mb-4">Payment Method</h4>
                        <div class="mb-3">
                            <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Credit Card" Value="CreditCard"></asp:ListItem>
                                <asp:ListItem Text="Cash on Delivery" Value="COD"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 mt-4 mt-md-0">
                    <div class="card shadow border-0 p-4">
                        <h4>Order Summary</h4>
                        <hr />
                        <div class="d-flex justify-content-between mb-2">
                            <span>Items</span>
                            <span>$<asp:Literal ID="litItemsTotal" runat="server"></asp:Literal></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Shipping</span>
                            <span class="text-success">
                                <asp:Literal ID="litShipping" runat="server">Free</asp:Literal>
                            </span>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold fs-5">Total</span>
                            <span class="fw-bold text-primary fs-4">$<asp:Literal ID="litTotal" runat="server">
                                </asp:Literal></span>
                        </div>
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order"
                            CssClass="btn btn-success btn-lg w-100 rounded-pill py-3 fw-bold"
                            OnClick="btnPlaceOrder_Click" />
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mt-2"
                            Visible="false"></asp:Label>
                        <p class="text-center mt-3 small text-muted"><i class="fas fa-lock me-1"></i> Secure Checkout
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>