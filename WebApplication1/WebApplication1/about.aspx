<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="WebApplication1.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - FilmFlicks</title>
  
  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <!-- Custom CSS Files -->
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/about.css">
</head>
<body>

  <!-- ==========================================================================
       STICKY NAVBAR
       ========================================================================== -->
  <nav class="navbar navbar-expand-lg fixed-top glass-nav navbar-dark">
    <div class="container">
      <a class="navbar-brand fw-bold fs-3" href="index.html" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
        <i class="bi bi-film me-2 text-primary"></i>FilmFlicks
      </a>
      
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 fw-semibold ms-lg-4">
           <li class="nav-item"><a class="nav-link text-white-50" href="index.html">Home</a></li>
           <li class="nav-item"><a class="nav-link text-white active" href="about.html">about Us</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="movie-details.html">Movies</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="webseries.html">Web Series</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="bollywood.html">Bollywood</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="contact.html">Contact Us</a></li>
        </ul>

        <div class="d-flex align-items-center gap-3">
          <a href="login.html" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
          <a href="register.html" class="btn btn-crimson btn-sm px-3">Register</a>
        </div>
      </div>
    </div>
  </nav>

  <!-- ==========================================================================
       HEADER SECTION
       ========================================================================== -->
  <header class="about-header" style="padding-top: 110px;">
    <div class="container text-center">
      <h2 class="fw-bold text-white mb-2"><i class="bi bi-info-circle-fill me-2 text-primary"></i>About FilmFlicks</h2>
      <p class="text-white-50 mb-4" style="max-width: 600px; margin: 0 auto;">Your ultimate destination for high-quality Movies, Web Series, and Dual Audio entertainment.</p>
    </div>
  </header>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- ==========================================================================
     MAIN CONTENT
     ========================================================================== -->
<main class="container my-5">

  <!-- About Story Section -->
  <div class="about-card mb-5">
    <div class="row align-items-center g-4">
      <div class="col-12 col-lg-7">
        <h3 class="fw-bold text-white mb-3">Redefining Your Cinema Experience</h3>
        <p class="text-white-50 lead fs-6 mb-3">
          At <strong>FilmFlicks</strong>, we aim to provide movie lovers with a seamless, fast, and high-definition movie browsing and downloading experience.
        </p>
        <p class="text-white-50 small mb-0" style="line-height: 1.7;">
          Whether you are looking for the latest Bollywood blockbusters, English Hollywood thrillers, South Indian Dual Audio movies, or trending Web Series — we categorize everything neatly so you can find and download content in just a few clicks.
        </p>
      </div>
      <div class="col-12 col-lg-5 text-center">
        <img src="https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=600" alt="Cinema Hall" class="img-fluid rounded-4 shadow-lg border border-secondary">
      </div>
    </div>
  </div>

  <!-- Platform Stats -->
  <div class="row g-3 mb-5">
    <div class="col-6 col-md-3">
      <div class="stat-item">
        <div class="stat-number">10,000+</div>
        <div class="text-white-50 small">Movies & Shows</div>
      </div>
    </div>
    <div class="col-6 col-md-3">
      <div class="stat-item">
        <div class="stat-number">4K / 1080p</div>
        <div class="text-white-50 small">Ultra HD Quality</div>
      </div>
    </div>
    <div class="col-6 col-md-3">
      <div class="stat-item">
        <div class="stat-number">24/7</div>
        <div class="text-white-50 small">Daily Updates</div>
      </div>
    </div>
    <div class="col-6 col-md-3">
      <div class="stat-item">
        <div class="stat-number">100%</div>
        <div class="text-white-50 small">Direct Links</div>
      </div>
    </div>
  </div>

  <!-- Features Grid -->
  <h4 class="fw-bold text-white mb-4 text-center">Why Choose FilmFlicks?</h4>
  <div class="row g-4">
    
    <!-- Feature 1 -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="feature-box">
        <div class="feature-icon-box"><i class="bi bi-badge-hd-fill"></i></div>
        <h5 class="fw-bold text-white mb-2">Multiple Qualities</h5>
        <p class="text-white-50 small mb-0">Choose from 480p, 720p, 1080p FHD, up to 4K Ultra HD formats based on your device and internet speed.</p>
      </div>
    </div>

    <!-- Feature 2 -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="feature-box">
        <div class="feature-icon-box"><i class="bi bi-translate"></i></div>
        <h5 class="fw-bold text-white mb-2">Dual Audio Support</h5>
        <p class="text-white-50 small mb-0">Enjoy Hollywood and South Indian cinema in original language as well as Hindi dubbed options.</p>
      </div>
    </div>

    <!-- Feature 3 -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="feature-box">
        <div class="feature-icon-box"><i class="bi bi-lightning-charge-fill"></i></div>
        <h5 class="fw-bold text-white mb-2">Fast Servers</h5>
        <p class="text-white-50 small mb-0">Direct Google Drive and high-speed cloud download links without annoying ad popups.</p>
      </div>
    </div>

    <!-- Feature 4 -->
    <div class="col-12 col-md-6 col-lg-3">
      <div class="feature-box">
        <div class="feature-icon-box"><i class="bi bi-phone-vibrate"></i></div>
        <h5 class="fw-bold text-white mb-2">Fully Responsive</h5>
        <p class="text-white-50 small mb-0">Designed perfectly to work seamlessly across Mobile, Tablet, Laptop, and Smart TVs.</p>
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
          <a href="index.html" class="fw-bold fs-3 text-decoration-none" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
            <i class="bi bi-film me-2"></i>FilmFlicks
          </a>
          <p class="text-white-50 mt-3 small">FilmFlicks is a premier platform for high-quality movie downloads, dual audio films, and web series. Enjoy fast, secure, and hassle-free movie access in 480p, 720p, 1080p, and 4K Ultra HD.</p>
        </div>
        <div class="col-6 col-lg-2">
          <h6 class="fw-bold text-white mb-3">Quick Links</h6>
          <ul class="list-unstyled text-white-50 small">
            <li class="mb-2"><a href="index.html" class="text-white-50 text-decoration-none">Home</a></li>
            <li class="mb-2"><a href="about.html" class="text-white-50 text-decoration-none">About Us</a></li>
            <li class="mb-2"><a href="movie-details.html" class="text-white-50 text-decoration-none">Movies</a></li>
            <li class="mb-2"><a href="webseries.html" class="text-white-50 text-decoration-none">Web Series</a></li>
            <li class="mb-2"><a href="bollywood.html" class="text-white-50 text-decoration-none">Bollywood</a></li>
            <li class="mb-2"><a href="contact.html" class="text-white-50 text-decoration-none">Contact Us</a></li>
              <li class="mb-2"><a href="login.html" class="text-white-50 text-decoration-none">Login</a></li>
                <li class="mb-2"><a href="register.html" class="text-white-50 text-decoration-none">Register</a></li>
          </ul>
        </div>
    
        <div class="col-lg-4">
          <h6 class="fw-bold text-white mb-3">Disclaimer & Info</h6>
          <p class="text-white-50 small">We do not host any files on our server. All content is provided by non-affiliated third parties. Designed for educational and UI showcase purposes.</p>
          <div class="d-flex gap-3 fs-5 text-white-50 mt-3">
            <a href="#" class="text-white-50"><i class="bi bi-telegram"></i></a>
            <a href="#" class="text-white-50"><i class="bi bi-twitter-x"></i></a>
            <a href="#" class="text-white-50"><i class="bi bi-youtube"></i></a>
          </div>
        </div>
      </div>
      <hr class="border-secondary my-4">
      <div class="text-center text-white-50 small">
        © 2026 FilmFlicks. All rights reserved. Crafted with pure HTML, CSS, and Bootstrap.
      </div>
    </div>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>
</asp:Content>
