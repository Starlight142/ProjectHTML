<%@ Page Title="Customer Support" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Support.aspx.cs" Inherits="Support" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="mb-5">Contact Support</h1>

            <div class="row">
                <div class="col-md-5">
                    <div class="card shadow-sm border-0 p-4">
                        <h4>New Support Ticket</h4>
                        <hr />
                        <div class="mb-3">
                            <label class="form-label">Subject</label>
                            <input type="text" class="form-control" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Message</label>
                            <textarea class="form-control" rows="5"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary w-100 rounded-pill">Submit Ticket</button>
                    </div>
                </div>

                <div class="col-md-7">
                    <h4 class="mt-4 mt-md-0 mb-3">Your Tickets</h4>
                    <asp:Repeater ID="TicketRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3 border">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="fw-bold">
                                            <%# Eval("Subject") %>
                                        </h6>
                                        <small class="text-muted">
                                            <%# Eval("Date", "{0:d}" ) %>
                                        </small>
                                    </div>
                                    <p class="mb-2">
                                        <%# Eval("Message") %>
                                    </p>
                                    <span
                                        class='badge <%# (bool)Eval("IsResolved") ? "bg-success" : "bg-warning text-dark" %>'>
                                        <%# (bool)Eval("IsResolved") ? "Resolved" : "Pending" %>
                                    </span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </asp:Content>