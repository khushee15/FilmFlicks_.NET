<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bollywood.aspx.cs" Inherits="WebApplication1.bollywood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bollywood Movies Collection - FilmFlicks</title>
  
  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <!-- Custom CSS Files -->
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/bollywood.css">
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
          <li class="nav-item"><a class="nav-link text-white-50" href="index.aspx">Home</a></li>
           <li class="nav-item"><a class="nav-link text-white-50" href="about.aspx">about Us</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="movie-details.aspx">Movies</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="webseries.aspx">Web Series</a></li>
          <li class="nav-item"><a class="nav-link text-white active" href="bollywood.aspx">Bollywood</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="contact.aspx">Contact Us</a></li>
         
       
        </ul>

        <div class="d-flex align-items-center gap-3">
          <form class="input-group" style="max-width: 240px;" action="browse.html">
            <input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Search movies...">
            <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
          </form>

          <a href="login.html" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
          <a href="register.html" class="btn btn-crimson btn-sm px-3">Register</a>

          <!-- Pure CSS Profile Dropdown -->
          <div class="profile-dropdown-container">
            <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100" class="rounded-circle border border-primary p-1" width="42" height="42" alt="Profile Avatar">
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
    <!-- ==========================================================================
     BOLLYWOOD HERO SHOWCASE
     ========================================================================== -->
<main class="container" style="padding-top: 100px;">
  
  <section class="bollywood-hero p-4 p-md-5 mb-5 glass-card">
    <div class="row align-items-center">
      <div class="col-lg-8">
        <span class="badge bg-danger px-3 py-2 mb-3 fs-6"><i class="bi bi-fire me-1"></i>BOLLYWOOD BLOCKBUSTERS</span>
        <h1 class="display-4 fw-bold text-white mb-3">Hindi Cinema & Original Releases</h1>
        <p class="lead text-light mb-4">Download latest Hindi movies, classic Bollywood hits, web originals, and high-definition 1080p & 4K remastered films with fast single-click download servers.</p>
        <div class="d-flex gap-3 flex-wrap">
          <a href="#bollywood-grid" class="btn btn-crimson btn-lg fs-6"><i class="bi bi-camera-reels me-2"></i>Browse Collection</a>
          <a href="request-movie.aspx" class="btn btn-outline-light btn-lg fs-6"><i class="bi bi-plus-circle me-2"></i>Request Hindi Movie</a>
        </div>
      </div>
    </div>
  </section>

  <!-- ==========================================================================
       FILTER & SEARCH BAR
       ========================================================================== -->
  <section class="mb-5">
    <div class="filter-card">
      <form class="row g-3">
        <!-- Search Field -->
        <div class="col-12 col-md-4">
          <label class="form-label text-white-50 small fw-bold">Search Bollywood</label>
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Movie title, cast name...">
            <button class="btn btn-crimson" type="button"><i class="bi bi-search"></i></button>
          </div>
        </div>

        <!-- Genre Filter -->
        <div class="col-6 col-md-2">
          <label class="form-label text-white-50 small fw-bold">Genre</label>
          <select class="form-select">
            <option selected>All Genres</option>
            <option>Action</option>
            <option>Comedy</option>
            <option>Drama</option>
            <option>Romance</option>
            <option>Thriller</option>
          </select>
        </div>

        <!-- Release Year Filter -->
        <div class="col-6 col-md-2">
          <label class="form-label text-white-50 small fw-bold">Year</label>
          <select class="form-select">
            <option selected>All Years</option>
            <option>2026</option>
            <option>2025</option>
            <option>2024</option>
            <option>2023</option>
          </select>
        </div>

        <!-- Quality Filter -->
        <div class="col-6 col-md-2">
          <label class="form-label text-white-50 small fw-bold">Quality</label>
          <select class="form-select">
            <option selected>All Quality</option>
            <option>4K Ultra HD</option>
            <option>1080p FHD</option>
            <option>720p HD</option>
            <option>480p SD</option>
          </select>
        </div>

        <!-- Sort Filter -->
        <div class="col-6 col-md-2">
          <label class="form-label text-white-50 small fw-bold">Sort By</label>
          <select class="form-select">
            <option selected>Latest Release</option>
            <option>IMDb Rating</option>
            <option>Most Downloaded</option>
          </select>
        </div>
      </form>
    </div>
  </section>

  <!-- ==========================================================================
       BOLLYWOOD MOVIES GRID (8 MOVIES)
       ========================================================================== -->
  <section id="bollywood-grid" class="mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h3 class="fw-bold m-0 border-start border-4 border-danger ps-3">Latest Hindi Movies</h3>
      <span class="text-white-50 small">Showing 1-8 of 240 Movies</span>
    </div>

    <div class="row g-4">
      <!-- Movie 1 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.4</span>
          <span class="quality-badge">1080p</span>
          <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500" class="bolly-poster" alt="Jawan">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Jawan</h5>
            <p class="text-white-50 small mb-2">2023 • Action / Thriller</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 2 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.0</span>
          <span class="quality-badge">4K</span>
          <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=500" class="bolly-poster" alt="Pathaan">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Pathaan</h5>
            <p class="text-white-50 small mb-2">2023 • Action / Spy</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 3 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.2</span>
          <span class="quality-badge">1080p</span>
          <img src="https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500" class="bolly-poster" alt="12th Fail">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">12th Fail</h5>
            <p class="text-white-50 small mb-2">2023 • Biography / Drama</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 4 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 7.5</span>
          <span class="quality-badge">720p</span>
          <img src="https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=500" class="bolly-poster" alt="Animal">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Animal</h5>
            <p class="text-white-50 small mb-2">2023 • Action / Crime</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 5 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.1</span>
          <span class="quality-badge">4K</span>
          <img src="https://images.unsplash.com/photo-1579783902614-a3fb3927b675?w=500" class="bolly-poster" alt="Stree 2">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Stree 2</h5>
            <p class="text-white-50 small mb-2">2024 • Horror / Comedy</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 6 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 7.8</span>
          <span class="quality-badge">1080p</span>
          <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500" class="bolly-poster" alt="Dunki">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Dunki</h5>
            <p class="text-white-50 small mb-2">2023 • Comedy / Drama</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 7 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 7.9</span>
          <span class="quality-badge">1080p</span>
          <img src="https://images.unsplash.com/photo-1568876694728-451bbf694b83?w=500" class="bolly-poster" alt="Article 370">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Article 370</h5>
            <p class="text-white-50 small mb-2">2024 • Action / Drama</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>

      <!-- Movie 8 -->
      <div class="col-12 col-sm-6 col-md-4 col-lg-3">
        <div class="bolly-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.3</span>
          <span class="quality-badge">4K</span>
          <img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500" class="bolly-poster" alt="Chhava">
          <div class="bolly-overlay">
            <h5 class="fw-bold text-white mb-1">Chhava</h5>
            <p class="text-white-50 small mb-2">2025 • Action / History</p>
            <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Pagination -->
    <nav class="mt-5 d-flex justify-content-center">
      <ul class="pagination pagination-custom">
        <li class="page-item disabled"><a class="page-link" href="#"><i class="bi bi-chevron-left"></i></a></li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#"><i class="bi bi-chevron-right"></i></a></li>
      </ul>
    </nav>
  </section>

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
            <li class="mb-2"><a href="index.aspx" class="text-white-50 text-decoration-none">Home</a></li>
            <li class="mb-2"><a href="about.aspx" class="text-white-50 text-decoration-none">About Us</a></li>
            <li class="mb-2"><a href="movie-details.aspx" class="text-white-50 text-decoration-none">Movies</a></li>
            <li class="mb-2"><a href="webseries.aspx" class="text-white-50 text-decoration-none">Web Series</a></li>
            <li class="mb-2"><a href="bollywood.aspx" class="text-white-50 text-decoration-none">Bollywood</a></li>
            <li class="mb-2"><a href="contact.aspx" class="text-white-50 text-decoration-none">Contact Us</a></li>
              <li class="mb-2"><a href="login.aspx" class="text-white-50 text-decoration-none">Login</a></li>
                <li class="mb-2"><a href="register.aspx" class="text-white-50 text-decoration-none">Register</a></li>
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
</haspx
</asp:Content>
