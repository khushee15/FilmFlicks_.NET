<%@ Page Title="My Profile - FilmFlicks" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="WebApplication1.myprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS Files -->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/myprofile.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- STICKY NAVBAR -->
    <nav class="navbar navbar-expand-lg fixed-top glass-nav navbar-dark">
      <div class="container">
        <a class="navbar-brand fw-bold fs-3" href="index.aspx" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
           <i class="bi bi-film me-2 text-primary"></i>FilmFlicks
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 fw-semibold ms-lg-4">
            <li class="nav-item"><a class="nav-link text-white-50" href="index.aspx">Home</a></li>
            <li class="nav-item"><a class="nav-link text-white-50" href="about.aspx">About Us</a></li>
            <li class="nav-item"><a class="nav-link text-white-50" href="movie-details.aspx">Movies</a></li>
            <li class="nav-item"><a class="nav-link text-white-50" href="webseries.aspx">Web Series</a></li>
            <li class="nav-item"><a class="nav-link text-white-50" href="bollywood.aspx">Bollywood</a></li>
            <li class="nav-item"><a class="nav-link text-white-50" href="contact.aspx">Contact Us</a></li>
          </ul>

          <div class="d-flex align-items-center gap-3">
            <div class="input-group" style="max-width: 240px;">
              <input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Search movies...">
              <button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
            </div>

            <a href="login.aspx" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
            <a href="register.aspx" class="btn btn-crimson btn-sm px-3">Register</a>

            <!-- Profile Dropdown -->
            <div class="profile-dropdown-container">
              <asp:Image ID="imgNavAvatar" runat="server" CssClass="rounded-circle border border-primary p-1" Width="42" Height="42" AlternateText="Profile Avatar" ImageUrl="~/Images/default-avatar.png" />
              <div class="profile-dropdown-menu">
                <a href="myprofile.aspx"><i class="bi bi-person me-2"></i>My Profile</a>
                <a href="mywatchlist.aspx"><i class="bi bi-bookmark me-2"></i>My Watchlist</a>
                <a href="requestmovie.aspx"><i class="bi bi-plus-circle me-2"></i>Request Movie</a>
                <a href="admin-login.aspx"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</a>
                <hr class="dropdown-divider bg-secondary my-1">
                <a href="login.aspx" class="text-danger"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- MAIN PROFILE CONTENT -->
    <main class="container" style="padding-top: 110px; padding-bottom: 60px;">
      
      <!-- Alert Feedback Message -->
      <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>

      <div class="row g-4">
        
        <!-- Left Column: User Profile Summary Card -->
        <div class="col-12 col-lg-4">
          <div class="profile-card text-center mb-4 p-4 rounded bg-dark text-white border border-secondary">
            <div class="profile-avatar-wrapper mb-3 position-relative d-inline-block">
              <asp:Image ID="imgLeftProfile" runat="server" CssClass="profile-avatar rounded-circle border border-2 border-primary" Width="130" Height="130" ImageUrl="~/Images/default-avatar.png" AlternateText="Profile Picture" />
            </div>
            <h4 class="fw-bold text-white mb-1"><asp:Label ID="lblLeftFullName" runat="server">Alex Morgan</asp:Label></h4>
            <p class="text-white-50 small mb-2">@<asp:Label ID="lblLeftUsername" runat="server">alex_flicks</asp:Label></p>
            <p class="text-info small mb-3"><i class="bi bi-telephone me-1"></i><asp:Label ID="lblLeftPhone" runat="server">Not Provided</asp:Label></p>
            
            <div class="bg-secondary bg-opacity-25 p-3 rounded mb-3 text-start">
                <small class="text-white-50 d-block mb-1 fw-bold"><i class="bi bi-chat-left-text me-1"></i>About / Bio:</small>
                <p class="text-white small mb-0"><asp:Label ID="lblLeftBio" runat="server">No bio added yet.</asp:Label></p>
            </div>
          </div>
        </div>

        <!-- Right Column: Edit Profile Form -->
        <div class="col-12 col-lg-8">
          <div class="profile-card p-4 rounded bg-dark text-white border border-secondary">
            
            <h4 class="fw-bold mb-4 border-bottom border-secondary pb-2"><i class="bi bi-person-gear me-2"></i>Edit Profile</h4>

            <div class="row g-3">
              <!-- Upload Avatar Section -->
              <div class="col-12 mb-2">
                <label for="fileUploadAvatar" class="form-label"><i class="bi bi-image me-1"></i>Profile Picture</label>
                <asp:FileUpload ID="fileUploadAvatar" runat="server" CssClass="form-control bg-dark text-white border-secondary" />
                <small class="text-white-50">Allowed formats: .jpg, .jpeg, .png</small>
              </div>

              <div class="col-12 col-md-6">
                <label for="txtFullName" class="form-label"><i class="bi bi-person me-1"></i>Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control bg-dark text-white border-secondary" ClientIDMode="Static" required="required"></asp:TextBox>
              </div>

              <div class="col-12 col-md-6">
                <label for="txtUsername" class="form-label"><i class="bi bi-at me-1"></i>Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control bg-dark text-white border-secondary" ClientIDMode="Static" required="required" ReadOnly="true"></asp:TextBox>
              </div>

              <div class="col-12 col-md-6">
                <label for="txtEmail" class="form-label"><i class="bi bi-envelope me-1"></i>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control bg-dark text-white border-secondary" ClientIDMode="Static" required="required"></asp:TextBox>
              </div>

              <div class="col-12 col-md-6">
                <label for="txtPhone" class="form-label"><i class="bi bi-telephone me-1"></i>Phone Number</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control bg-dark text-white border-secondary" ClientIDMode="Static"></asp:TextBox>
              </div>

              <div class="col-12">
                <label for="txtBio" class="form-label"><i class="bi bi-chat-left-text me-1"></i>About / Bio</label>
                <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control bg-dark text-white border-secondary" ClientIDMode="Static" placeholder="Tell us about your favorite movie genres..."></asp:TextBox>
              </div>
            </div>

            <div class="mt-4 text-end">
              <asp:Button ID="btnSaveChanges" runat="server" CssClass="btn btn-crimson px-4 fw-bold" Text="Save Changes" OnClick="btnSaveChanges_Click" />
            </div>

          </div>
        </div>

      </div>

    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- FOOTER -->
    <footer class="glass-card mt-5 rounded-0 border-start-0 border-end-0 border-bottom-0 py-5">
      <div class="container">
        <div class="row g-4 mb-4">
          <div class="col-lg-4">
            <a href="index.aspx" class="fw-bold fs-3 text-decoration-none" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
              <i class="bi bi-film me-2"></i>FilmFlicks
            </a>
            <p class="text-white-50 mt-3 small">FilmFlicks is a premier platform for high-quality movie downloads, dual audio films, and web series.</p>
          </div>
          <div class="col-6 col-lg-2">
            <h6 class="fw-bold text-white mb-3">Quick Links</h6>
            <ul class="list-unstyled text-white-50 small">
              <li class="mb-2"><a href="index.aspx" class="text-white-50 text-decoration-none">Home</a></li>
              <li class="mb-2"><a href="about.aspx" class="text-white-50 text-decoration-none">About Us</a></li>
              <li class="mb-2"><a href="movie-details.aspx" class="text-white-50 text-decoration-none">Movies</a></li>
              <li class="mb-2"><a href="webseries.aspx" class="text-white-50 text-decoration-none">Web Series</a></li>
            </ul>
          </div>
          <div class="col-lg-4">
            <h6 class="fw-bold text-white mb-3">Disclaimer & Info</h6>
            <p class="text-white-50 small">We do not host any files on our server. All content is provided by non-affiliated third parties.</p>
          </div>
        </div>
        <hr class="border-secondary my-4">
        <div class="text-center text-white-50 small">
          © 2026 FilmFlicks. All rights reserved.
        </div>
      </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</asp:Content>