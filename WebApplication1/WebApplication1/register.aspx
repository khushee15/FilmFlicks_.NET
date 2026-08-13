<%@ Page Title="Register - FilmFlicks" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS Files -->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/register.css">
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- STICKY NAVBAR -->
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

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- REGISTER FORM SECTION -->
    <main class="container auth-wrapper" style="padding-top: 100px;">
        <div class="auth-card-wide">
            <div class="text-center mb-4">
                <h2 class="auth-title mb-1">Create an Account</h2>
                <p class="text-white-50 small">Join FilmFlicks to request movies and build your watchlist</p>
            </div>

            <!-- Quick Social SignUp -->
            <div class="d-grid gap-2 mb-3">
                <a href="#" class="btn-social">
                    <i class="bi bi-google text-danger fs-5"></i> Sign up with Google
                </a>
            </div>

            <div class="divider-text">
                <span>OR FILL YOUR DETAILS</span>
            </div>

            <!-- Registration Form Controls -->
            <div class="row g-3">
                <!-- Full Name Input -->
                <div class="col-12 col-md-6">
                    <div class="form-floating">
                        <asp:TextBox ID="floatingName" runat="server" CssClass="form-control" placeholder="John Doe" ClientIDMode="Static"></asp:TextBox>
                        <label for="floatingName"><i class="bi bi-person me-2"></i>Full Name</label>
                    </div>
                </div>

                <!-- Username Input -->
                <div class="col-12 col-md-6">
                    <div class="form-floating">
                        <asp:TextBox ID="floatingUsername" runat="server" CssClass="form-control" placeholder="johndoe123" ClientIDMode="Static"></asp:TextBox>
                        <label for="floatingUsername"><i class="bi bi-at me-2"></i>Username</label>
                    </div>
                </div>

                <!-- Email Input -->
                <div class="col-12">
                    <div class="form-floating">
                        <asp:TextBox ID="floatingEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="name@example.com" ClientIDMode="Static"></asp:TextBox>
                        <label for="floatingEmail"><i class="bi bi-envelope me-2"></i>Email Address</label>
                    </div>
                </div>

                <!-- Password Input -->
                <div class="col-12 col-md-6">
                    <div class="form-floating">
                        <asp:TextBox ID="floatingPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" ClientIDMode="Static"></asp:TextBox>
                        <label for="floatingPassword"><i class="bi bi-lock me-2"></i>Password</label>
                    </div>
                </div>

                <!-- Confirm Password Input -->
                <div class="col-12 col-md-6">
                    <div class="form-floating">
                        <asp:TextBox ID="floatingConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" ClientIDMode="Static"></asp:TextBox>
                        <label for="floatingConfirmPassword"><i class="bi bi-shield-lock me-2"></i>Confirm Password</label>
                    </div>
                </div>
            </div>

            <!-- Terms & Conditions Checkbox -->
            <div class="form-check mt-3 mb-4">
                <asp:CheckBox ID="termsCheck" runat="server" CssClass="form-check-input bg-dark border-secondary" ClientIDMode="Static" />
                <label class="form-check-label text-white-50 small" for="termsCheck">
                    I agree to the <a href="#" class="text-decoration-none" style="color: var(--accent-purple);">Terms of Service</a> and <a href="#" class="text-decoration-none" style="color: var(--accent-purple);">Privacy Policy</a>.
                </label>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn btn-crimson w-100 py-2 fs-6 fw-bold" OnClick="btnRegister_Click" />

            <!-- Feedback Label -->
            <div class="text-center">
                <asp:Label ID="lblRegisterFeedback" runat="server"></asp:Label>
            </div>

            <!-- Login Link -->
            <div class="text-center mt-4 small text-white-50">
                Already have an account? <a href="login.aspx" class="fw-bold text-decoration-none" style="color: var(--accent-purple);">Login Here</a>
            </div>
        </div>
    </main>
</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- FOOTER -->
    <footer class="text-center text-white-50 py-3 small">
        © 2026 FilmFlicks. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</asp:Content>