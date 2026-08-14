<%@ Page Title="FilmFlicks - Unlimited Movies & Web Series Download" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <!-- Custom Modular CSS Files -->
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/main.css") %>' />
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/home.css") %>' />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <nav class="navbar navbar-expand-lg fixed-top glass-nav navbar-dark">
        <div class="container">
            <a class="navbar-brand fw-bold fs-3" href="index.aspx" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                <i class="bi bi-film me-2 text-primary"></i>FilmFlicks
            </a>
            
            <div class="ms-auto d-flex gap-2">
                <a href="index.aspx" class="btn btn-outline-light btn-sm px-3 fw-semibold"><i class="bi bi-house me-1"></i>Home</a>
                <a href="login.aspx" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
            </div>
        </div>
    </nav>   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- ==========================================================================
         LOGIN CONTAINER SECTION
         ========================================================================== -->
    <main class="container d-flex align-items-center justify-content-center min-vh-100" style="padding-top: 100px; padding-bottom: 50px;">
        <div class="glass-card p-4 p-md-5 rounded-4 shadow-lg" style="max-width: 450px; width: 100%; background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.1);">
            
            <div class="text-center mb-4">
                <a href="index.aspx" class="fw-bold fs-3 text-decoration-none d-inline-block mb-2" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                    <i class="bi bi-film me-2 text-primary"></i>FilmFlicks
                </a>
                <h3 class="fw-bold text-white mt-2">Welcome Back</h3>
                <p class="text-white-50 small">Enter your credentials to access your account</p>
            </div>

            <!-- Username or Email Field -->
            <div class="mb-3">
                <label for="txtUsername" class="form-label text-white-50 small">Username or Email</label>
                <div class="input-group">
                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-person"></i></span>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control bg-dark text-white border-secondary" placeholder="Username or Email"></asp:TextBox>
                </div>
            </div>

            <!-- Password Field -->
            <div class="mb-3">
                <label for="txtPassword" class="form-label text-white-50 small">Password</label>
                <div class="input-group">
                    <span class="input-group-text bg-dark border-secondary text-white-50"><i class="bi bi-lock"></i></span>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control bg-dark text-white border-secondary" placeholder="Password"></asp:TextBox>
                </div>
            </div>

            <!-- Remember Checkbox & Forgot Link -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="form-check">
                    <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label text-white-50 small ms-1" for="chkRemember">Remember me</label>
                </div>
                <a href="forgot-password.aspx" class="text-danger small text-decoration-none">Forgot Password?</a>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-crimson w-100 py-2 fw-semibold" OnClick="btnLogin_Click" />

            <!-- Dynamic Error / Success Label -->
            <asp:Label ID="lblLoginFeedback" runat="server" CssClass="d-block mt-3 text-center fw-semibold"></asp:Label>

            <!-- Register Link -->
            <div class="text-center mt-4">
                <p class="text-white-50 small mb-0">Don't have an account? <a href="register.aspx" class="text-primary text-decoration-none fw-semibold">Register here</a></p>
            </div>

        </div>
    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</asp:Content>