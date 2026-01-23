<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row justify-content-center pt-5">
            <div class="col-md-5">
                <div class="card shadow border-0 p-4">
                    <h2 class="text-center mb-4">Create Account</h2>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" />
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" />
                    </div>
                    <button type="button" class="btn btn-primary btn-lg w-100 rounded-pill mb-3">Register</button>
                    <div class="text-center">
                        <a href="Login.aspx" class="text-decoration-none">Already have an account? Login</a>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>