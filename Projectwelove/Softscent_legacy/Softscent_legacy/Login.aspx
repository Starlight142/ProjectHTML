<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs"
    Inherits="Login" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row justify-content-center pt-5">
            <div class="col-md-4">
                <div class="card shadow border-0 p-4 mt-5">
                    <h2 class="text-center mb-4">Welcome Back</h2>
                    <div class="mb-3">
                        <label class="form-label">Email address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="name@example.com"
                            TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password">
                        </asp:TextBox>
                    </div>
                    <div class="form-check mb-4">
                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                        <label class="form-check-label" for="chkRememberMe">Remember me</label>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Log in"
                        CssClass="btn btn-primary btn-lg w-100 rounded-pill mb-3" OnClick="btnLogin_Click" />
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3"
                        Visible="false"></asp:Label>
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