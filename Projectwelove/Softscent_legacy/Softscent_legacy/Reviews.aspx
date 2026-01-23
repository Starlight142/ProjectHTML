<%@ Page Title="Review Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Reviews.aspx.cs" Inherits="Reviews" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-5 mt-5">
            <h1 class="mb-4">Submit a Review</h1>
            <div class="card shadow-sm border-0 p-4">
                <div class="mb-3">
                    <label class="form-label">Rating</label>
                    <div class="fs-3 text-warning">
                        <i class="fas fa-star" style="cursor:pointer"></i>
                        <i class="fas fa-star" style="cursor:pointer"></i>
                        <i class="fas fa-star" style="cursor:pointer"></i>
                        <i class="fas fa-star" style="cursor:pointer"></i>
                        <i class="fas fa-star" style="cursor:pointer"></i>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Comment</label>
                    <textarea class="form-control" rows="4" placeholder="How was the scent?"></textarea>
                </div>
                <button type="button" class="btn btn-primary rounded-pill px-5">Submit Review</button>
            </div>
        </div>
    </asp:Content>