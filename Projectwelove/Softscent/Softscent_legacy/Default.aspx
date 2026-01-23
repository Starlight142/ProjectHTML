<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 text-start">
                    <h1 class="hero-title">Breathe Nature, Feel Relaxed</h1>
                    <p class="hero-subtitle">Premium herbal inhalers customized just for you.</p>
                    <div class="d-flex gap-3">
                        <a href="Custom.aspx" class="btn btn-primary btn-lg">Create Your Own Scent</a>
                        <a href="Products.aspx" class="btn btn-outline-secondary btn-lg">Shop Collection</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="Images/herbs-bundle.png" alt="Fresh Herbs" class="img-fluid rounded-3 shadow-lg fade-in-up" style="border: 4px solid white;">
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-4 text-center">
            <div class="card p-4">
                <i class="fas fa-leaf feature-icon"></i>
                <h3>100% Natural</h3>
                <p>Made from pure essential oils and organic herbs.</p>
            </div>
        </div>
        <div class="col-md-4 text-center">
            <div class="card p-4">
                <i class="fas fa-flask feature-icon"></i>
                <h3>Custom Blends</h3>
                <p>Choose your ingredients to match your mood.</p>
            </div>
        </div>
        <div class="col-md-4 text-center">
            <div class="card p-4">
                <i class="fas fa-shipping-fast feature-icon"></i>
                <h3>Fast Delivery</h3>
                <p>Freshly mixed and shipped to your door.</p>
            </div>
        </div>
    </div>

    <section class="py-5">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="mb-3">Best Sellers</h2>
                <p class="text-muted">Discover our most loved scents.</p>
            </div>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm text-center">
                    <img src="Images/products/thai_jar.png" class="card-img-top mx-auto mt-3" style="width: 80%; object-fit: contain; max-height: 200px;" alt="Thai Herbal Jar">
                    <div class="card-body">
                        <h5 class="card-title">Traditional Thai Jar</h5>
                        <p class="card-text text-muted">Authentic blend of fermented herbs.</p>
                        <a href="Products.aspx" class="btn btn-outline-primary btn-sm rounded-pill px-4">View</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm text-center">
                    <img src="Images/products/peppermint.png" class="card-img-top mx-auto mt-3" style="width: 80%; object-fit: contain; max-height: 200px;" alt="Peppermint Inhaler">
                    <div class="card-body">
                        <h5 class="card-title">Peppermint Fresh</h5>
                        <p class="card-text text-muted">Instant cooling and headache relief.</p>
                        <a href="Products.aspx" class="btn btn-outline-primary btn-sm rounded-pill px-4">View</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm text-center">
                    <img src="Images/products/lavender.png" class="card-img-top mx-auto mt-3" style="width: 80%; object-fit: contain; max-height: 200px;" alt="Lavender Sleep">
                    <div class="card-body">
                        <h5 class="card-title">Lavender Sleep</h5>
                        <p class="card-text text-muted">Relax and drift into deep sleep.</p>
                        <a href="Products.aspx" class="btn btn-outline-primary btn-sm rounded-pill px-4">View</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
