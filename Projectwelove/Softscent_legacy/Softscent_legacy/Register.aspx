<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row justify-content-center pt-5">
            <div class="col-md-5">
                <div class="card shadow border-0 p-4">
                    <h2 class="text-center mb-4">Create Account</h2>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email">
                        </asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password">
                        </asp:TextBox>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password">
                        </asp:TextBox>
                    </div>
                    <asp:Button ID="btnRegister" runat="server" Text="Register"
                        CssClass="btn btn-primary btn-lg w-100 rounded-pill mb-3" OnClick="btnRegister_Click" />
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3"
                        Visible="false"></asp:Label>
                    <div class="text-center">
                        <a href="Login.aspx" class="text-decoration-none">Already have an account? Login</a>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>