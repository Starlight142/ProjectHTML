<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1>Order Details <span class="text-muted fs-4">#1001</span></h1>
                <a href="OrderHistory.aspx" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i>Back
                    to Orders</a>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="card shadow-sm border-0 mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0">Items</h5>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th class="text-end">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="fw-bold">Peppermint Fresh</div>
                                        </td>
                                        <td>$5.99</td>
                                        <td>2</td>
                                        <td class="text-end fw-bold">$11.98</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="fw-bold">Lavender Sleep</div>
                                        </td>
                                        <td>$6.99</td>
                                        <td>1</td>
                                        <td class="text-end fw-bold">$6.99</td>
                                    </tr>
                                </tbody>
                                <tfoot class="table-light">
                                    <tr>
                                        <td colspan="3" class="text-end fw-bold">Grand Total</td>
                                        <td class="text-end fw-bold text-primary fs-5">$18.97</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <div class="mt-3">
                        <a href="Reviews.aspx?id=1" class="btn btn-outline-warning rounded-pill"><i
                                class="fas fa-star me-1"></i>Review Products</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm border-0 mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0">Order Summary</h5>
                        </div>
                        <div class="card-body">
                            <dl class="row mb-0">
                                <dt class="col-sm-5 text-muted">Date</dt>
                                <dd class="col-sm-7">Jan 18, 2026</dd>

                                <dt class="col-sm-5 text-muted">Status</dt>
                                <dd class="col-sm-7"><span class="badge bg-success">Completed</span></dd>
                            </dl>
                        </div>
                    </div>

                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0">Shipping Info</h5>
                        </div>
                        <div class="card-body">
                            <p class="mb-2"><i class="fas fa-map-marker-alt me-2 text-muted"></i>123 Bangkok Road,
                                Thailand</p>
                            <p class="mb-0"><i class="fas fa-credit-card me-2 text-muted"></i>Credit Card</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>