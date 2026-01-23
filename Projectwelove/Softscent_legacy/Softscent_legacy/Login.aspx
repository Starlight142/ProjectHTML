<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs"
    Inherits="Login" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row justify-content-center pt-5">
            <div class="col-md-4">
                <div class="card shadow border-0 p-4 mt-5">
                    <h2 class="text-center mb-4">Welcome Back</h2>
                    <div class="mb-3">
                        <label class="form-label">Email address</label>
                        <input type="email" class="form-control" placeholder="name@example.com" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" />
                    </div>
                    <div class="form-check mb-4">
                        <input class="form-check-input" type="checkbox" id="rem" />
                        <label class="form-check-label" for="rem">Remember me</label>
                    </div>
                    <button type="button" class="btn btn-primary btn-lg w-100 rounded-pill mb-3">Log in</button>
                    <div class="text-center">
                        <a href="Register.aspx" class="text-decoration-none">Create a new account</a>
                    </div>
                    <hr />
                    <p class="text-muted small text-center">Use <b>admin@softscent.com</b> / <b>Admin123!</b> for
                        testing.</p>
                </div>
            </div>
        </div>
    </asp:Content>