<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mywatchlist.aspx.cs" Inherits="WebApplication1.mywatchlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Watchlist - FilmFlicks</title>
  
  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <!-- Custom CSS Files -->
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/mywatchlist.css">
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
          <li class="nav-item"><a class="nav-link text-white active" href="index.aspx">Home</a></li>
           <li class="nav-item"><a class="nav-link text-white-50" href="about.aspx">about Us</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="movie-details.aspx">Movies</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="webseries.aspx">Web Series</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="bollywood.aspx">Bollywood</a></li>
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

  <!-- ==========================================================================
       HEADER SECTION
       ========================================================================== -->
  <header class="watchlist-header" style="padding-top: 110px;">
    <div class="container text-center">
      <h2 class="fw-bold text-white mb-2"><i class="bi bi-bookmark-heart me-2 text-danger"></i>My Saved Watchlist</h2>
      <p class="text-white-50 mb-4">Manage movies and web series you saved to watch or download later</p>

      <!-- Category Filter Pills -->
      <div class="d-flex justify-content-center flex-wrap gap-2">
        <button class="watchlist-filter-btn active"><i class="bi bi-grid-fill me-1"></i>All (6)</button>
        <button class="watchlist-filter-btn"><i class="bi bi-film me-1"></i>Movies (4)</button>
        <button class="watchlist-filter-btn"><i class="bi bi-tv me-1"></i>Web Series (2)</button>
      </div>
    </div>
  </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!-- ==========================================================================
      WATCHLIST CARDS GRID
      ========================================================================== -->
 <main class="container my-5">
   
   <div class="row g-4">
     
     <!-- Card 1 -->
     <div class="col-12 col-sm-6 col-md-4 col-lg-3">
       <div class="watchlist-card movie-card">
         <button class="remove-btn" title="Remove from Watchlist"><i class="bi bi-trash3-fill"></i></button>
         <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.4</span>
         <span class="quality-badge">4K HDR</span>
         <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500" class="movie-poster" alt="Interstellar">
         <div class="movie-overlay">
           <h5 class="fw-bold text-white mb-1">Interstellar</h5>
           <p class="text-white-50 small mb-2">2014 • Sci-Fi / Drama</p>
           <div class="d-flex gap-2">
             <a href="movie-details.aspx" class="btn btn-crimson btn-sm flex-grow-1"><i class="bi bi-download me-1"></i>Download</a>
           </div>
         </div>
       </div>
     </div>

     <!-- Card 2 -->
     <div class="col-12 col-sm-6 col-md-4 col-lg-3">
       <div class="watchlist-card movie-card">
         <button class="remove-btn" title="Remove from Watchlist"><i class="bi bi-trash3-fill"></i></button>
         <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.7</span>
         <span class="quality-badge">1080p</span>
         <img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500" class="movie-poster" alt="Stranger Things">
         <div class="movie-overlay">
           <h5 class="fw-bold text-white mb-1">Stranger Things</h5>
           <p class="text-white-50 small mb-2">Season 4 • Sci-Fi</p>
           <div class="d-flex gap-2">
             <a href="webseries.aspx" class="btn btn-crimson btn-sm flex-grow-1"><i class="bi bi-play-fill me-1"></i>View Series</a>
           </div>
         </div>
       </div>
     </div>

     <!-- Card 3 -->
     <div class="col-12 col-sm-6 col-md-4 col-lg-3">
       <div class="watchlist-card movie-card">
         <button class="remove-btn" title="Remove from Watchlist"><i class="bi bi-trash3-fill"></i></button>
         <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.4</span>
         <span class="quality-badge">1080p</span>
         <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=500" class="movie-poster" alt="Jawan">
         <div class="movie-overlay">
           <h5 class="fw-bold text-white mb-1">Jawan</h5>
           <p class="text-white-50 small mb-2">2023 • Action / Thriller</p>
           <div class="d-flex gap-2">
             <a href="movie-details.aspx" class="btn btn-crimson btn-sm flex-grow-1"><i class="bi bi-download me-1"></i>Download</a>
           </div>
         </div>
       </div>
     </div>

     <!-- Card 4 -->
     <div class="col-12 col-sm-6 col-md-4 col-lg-3">
       <div class="watchlist-card movie-card">
         <button class="remove-btn" title="Remove from Watchlist"><i class="bi bi-trash3-fill"></i></button>
         <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.8</span>
         <span class="quality-badge">1080p</span>
         <img src="https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=500" class="movie-poster" alt="Money Heist">
         <div class="movie-overlay">
           <h5 class="fw-bold text-white mb-1">Money Heist</h5>
           <p class="text-white-50 small mb-2">Season 5 • Crime / Drama</p>
           <div class="d-flex gap-2">
             <a href="webseries.aspx" class="btn btn-crimson btn-sm flex-grow-1"><i class="bi bi-play-fill me-1"></i>View Series</a>
           </div>
         </div>
       </div>
     </div>

     <!-- Card 5 -->
     <div class="col-12 col-sm-6 col-md-4 col-lg-3">
       <div class="watchlist-card movie-card">
         <button class="remove-btn" title="Remove from Watchlist"><i class="bi bi-trash3-fill"></i></button>
         <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.1</span>
         <span class="quality-badge">4K</span>
         <img src="https://images.unsplash.com/photo-1579783902614-a3fb3927b675?w=500" class="movie-poster" alt="Stree 2">
         <div class="movie-overlay">
           <h5 class="fw-bold text-white mb-1">Stree 2</h5>
           <p class="text-white-50 small mb-2">2024 • Horror / Comedy</p>
           <div class="d-flex gap-2">
             <a href="movie-details.aspx" class="btn btn-crimson btn-sm flex-grow-1"><i class="bi bi-download me-1"></i>Download</a>
           </div>
         </div>
       </div>
     </div>

     <!-- Card 6 -->
     <div class="col-12 col-sm-6 col-md-4 col-lg-3">
       <div class="watchlist-card movie-card">
         <button class="remove-btn" title="Remove from Watchlist"><i class="bi bi-trash3-fill"></i></button>
         <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.3</span>
         <span class="quality-badge">4K</span>
         <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500" class="movie-poster" alt="Chhava">
         <div class="movie-overlay">
           <h5 class="fw-bold text-white mb-1">Chhava</h5>
           <p class="text-white-50 small mb-2">2025 • Action / History</p>
           <div class="d-flex gap-2">
             <a href="movie-details.aspx" class="btn btn-crimson btn-sm flex-grow-1"><i class="bi bi-download me-1"></i>Download</a>
           </div>
         </div>
       </div>
     </div>

   </div>

   <!-- Empty Watchlist UI (Hidden by default, can be shown when watchlist is empty) -->
   <!--
   <div class="empty-watchlist my-5">
     <i class="bi bi-bookmark-plus fs-1 text-white-50 mb-3 d-block"></i>
     <h4 class="fw-bold text-white mb-2">Your Watchlist is Empty</h4>
     <p class="text-white-50 mb-4">You haven't added any movies or series to your watchlist yet.</p>
     <a href="browse.html" class="btn btn-crimson px-4"><i class="bi bi-search me-1"></i>Explore Movies</a>
   </div>
   -->

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
</html>
</asp:Content>
