<%@ Page Title="Custom Inhaler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Custom.aspx.cs" Inherits="Custom" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="text-center mb-5 mt-4">Craft Your Signature Scent</h1>

            <div class="row">
                <div class="col-md-7">
                    <div class="card shadow-sm border-0 p-4">
                        <h3>Select Your Ingredients</h3>
                        <p class="text-muted">Choose up to 3 herbs for your custom blend.</p>

                        <div class="row g-3">
                            <asp:Repeater ID="HerbRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-6">
                                        <div class="card p-3 herb-item border" style="cursor: pointer;">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <h5 class="mb-0">
                                                    <%# Eval("Name") %>
                                                </h5>
                                                <input type="checkbox" class="form-check-input" />
                                            </div>
                                            <small class="text-muted">
                                                <%# Eval("Effect") %>
                                            </small>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 mt-4 mt-md-0">
                    <div class="card shadow border-0 p-4 sticky-top" style="top: 100px;">
                        <h3>Your Blend</h3>
                        <hr />
                        <div id="selection-summary">
                            <p class="text-muted">No ingredients selected yet.</p>
                        </div>
                        <div class="mt-4">
                            <h5>Total Price: <span class="text-primary">$15.00</span></h5>
                        </div>
                        <button type="button" class="btn btn-primary btn-lg w-100 mt-3 rounded-pill">Add to
                            Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>