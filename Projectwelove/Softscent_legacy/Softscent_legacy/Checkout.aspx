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
                            <textarea class="form-control" rows="3" placeholder="Enter your full address"></textarea>
                        </div>

                        <h4 class="mt-5 mb-3">Shipping Method</h4>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="Ship" id="std" checked />
                            <label class="form-check-label" for="std">Standard Shipping (Free)</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Ship" id="exp" />
                            <label class="form-check-label" for="exp">Express Shipping ($5.00)</label>
                        </div>
                    </div>

                    <div class="card shadow-sm border-0 p-4">
                        <h4 class="mb-4">Payment Method</h4>
                        <div class="row g-3">
                            <div class="col-6">
                                <div class="border p-3 rounded text-center" style="cursor: pointer;">
                                    <i class="fas fa-credit-card fa-2x mb-2 text-primary"></i>
                                    <div>Credit Card</div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="border p-3 rounded text-center" style="cursor: pointer;">
                                    <i class="fas fa-money-bill-wave fa-2x mb-2 text-success"></i>
                                    <div>Cash on Delivery</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 mt-4 mt-md-0">
                    <div class="card shadow border-0 p-4">
                        <h4>Order Summary</h4>
                        <hr />
                        <div class="d-flex justify-content-between mb-2">
                            <span>Items (3)</span>
                            <span>$26.98</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Shipping</span>
                            <span class="text-success">Free</span>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold fs-5">Total</span>
                            <span class="fw-bold text-primary fs-4">$26.98</span>
                        </div>
                        <button type="button" class="btn btn-success btn-lg w-100 rounded-pill py-3 fw-bold">Place
                            Order</button>
                        <p class="text-center mt-3 small text-muted"><i class="fas fa-lock me-1"></i> Secure Checkout
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>