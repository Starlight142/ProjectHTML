<%@ Page Title="Latest News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="News.aspx.cs"
    Inherits="News" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5">
            <h1 class="text-center mb-5">Latest News & Announcements</h1>

            <div class="row">
                <asp:Repeater ID="NewsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-8 offset-md-2 mb-5 border-bottom pb-4">
                            <div class="d-flex align-items-center mb-2">
                                <small class="text-muted"><i class="far fa-calendar-alt me-2"></i>
                                    <%# Eval("Date", "{0:D}" ) %>
                                </small>
                            </div>
                            <h2 class="mb-3">
                                <%# Eval("Title") %>
                            </h2>
                            <img src='<%# Eval("ImageUrl") %>' class="img-fluid rounded mb-3 shadow-sm w-100"
                                style="max-height: 400px; object-fit: cover;" alt="News Image" />
                            <p class="lead" style="white-space: pre-line;">
                                <%# Eval("Content") %>
                            </p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </asp:Content>