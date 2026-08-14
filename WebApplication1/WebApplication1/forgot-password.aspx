<%@ Page Title="Forgot Password - FilmFlicks" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="WebApplication1.forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS Files -->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/forgot-password.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ==========================================================================
         STICKY NAVBAR
         ========================================================================== -->
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
        FORGOT PASSWORD FORM SECTION
        ========================================================================== -->
    <main class="container auth-wrapper" style="padding-top: 100px;">
      <div class="auth-card text-center">

        <div class="auth-icon-wrapper">
          <i class="bi bi-key"></i>
        </div>

        <h2 class="auth-title mb-2">Forgot Password?</h2>
        <p class="text-white-50 small mb-4">No worries! Enter your registered email address and we will fetch your password details.</p>

        
        <div class="form-floating mb-4 text-start">
          <asp:TextBox ID="floatingResetEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
          <label for="<%= floatingResetEmail.ClientID %>"><i class="bi bi-envelope me-2"></i>Email Address</label>
        </div>

    
        <asp:Button ID="btnReset" runat="server" Text="Get Password" CssClass="btn btn-crimson w-100 py-2 fs-6 fw-bold mb-3" OnClick="btnReset_Click" />

      
        <asp:Label ID="lblResetFeedback" runat="server" CssClass="d-block mb-3 text-center fw-semibold"></asp:Label>

        <div class="mt-3 small">
          <a href="login.aspx" class="text-decoration-none text-white-50 hover-purple">
            <i class="bi bi-arrow-left me-1"></i>Back to Login
          </a>
        </div>
      </div>
    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
   
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</asp:Content>