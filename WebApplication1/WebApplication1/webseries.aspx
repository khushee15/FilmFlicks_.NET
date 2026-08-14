<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="webseries.aspx.cs" Inherits="WebApplication1.webseries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Stranger Things (All Seasons) - Download & Watch | FilmFlicks</title>
  
  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <!-- Custom CSS Files -->
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/webseries.css">
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
          <li class="nav-item"><a class="nav-link text-white active" href="webseries.aspx">Web Series</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="bollywood.aspx">Bollywood</a></li>
          <li class="nav-item"><a class="nav-link text-white-50" href="contact.aspx">Contact Us</a></li>
         
       
        </ul>

        <div class="d-flex align-items-center gap-3">
          <form class="input-group" style="max-width: 240px;" action="browse.html">
            <input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Search movies...">
            <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
          </form>

          <a href="login.aspx" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
          <a href="register.aspx" class="btn btn-crimson btn-sm px-3">Register</a>

          <!-- Pure CSS Profile Dropdown -->
          <div class="profile-dropdown-container">
            <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100" class="rounded-circle border border-primary p-1" width="42" height="42" alt="Profile Avatar">
            <div class="profile-dropdown-menu">
              <a href="myprofile.html"><i class="bi bi-person me-2"></i>My Profile</a>
              <a href="mywatchlist.html"><i class="bi bi-bookmark me-2"></i>My Watchlist</a>
              <a href="requestmovie.html"><i class="bi bi-plus-circle me-2"></i>Request Movie</a>
              <a href="admin-login.html"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</a>
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
     MAIN WEB SERIES SHOWCASE
     ========================================================================== -->
<main class="container" style="padding-top: 100px;">
  
  <!-- Series Hero Banner -->
  <section class="series-hero p-4 p-md-5 mb-5 glass-card">
    <div class="row g-4 align-items-center">
      <!-- Series Poster Image -->
      <div class="col-12 col-md-4 col-lg-3">
        <div class="series-poster-box">
          <img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=600" class="series-poster-img" alt="Stranger Things Poster">
        </div>
      </div>

      <!-- Series Details -->
      <div class="col-12 col-md-8 col-lg-9">
        <div class="d-flex flex-wrap gap-2 mb-3">
          <span class="badge bg-warning text-dark fw-bold px-3 py-2"><i class="bi bi-star-fill me-1"></i>IMDb 8.7</span>
          <span class="badge bg-danger px-3 py-2">Netflix Original</span>
          <span class="badge bg-primary px-3 py-2">Sci-Fi / Horror / Drama</span>
          <span class="badge bg-secondary px-3 py-2">Dual Audio (Hindi - English)</span>
        </div>

        <h1 class="display-4 fw-bold text-white mb-2">Stranger Things</h1>
        <p class="text-white-50 mb-3 fs-5"><i class="bi bi-tv me-2"></i>Seasons: 4 | Total Episodes: 34 | Status: Completed</p>

        <p class="lead text-light mb-4">When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl with telekinetic powers.</p>

        <div class="row g-3 text-white-50 mb-4 small">
          <div class="col-sm-6">
            <p class="mb-1"><strong class="text-white"><i class="bi bi-person-video2 me-2"></i>Creators:</strong> The Duffer Brothers</p>
            <p class="mb-1"><strong class="text-white"><i class="bi bi-people me-2"></i>Cast:</strong> Millie Bobby Brown, Finn Wolfhard, Winona Ryder, David Harbour</p>
          </div>
          <div class="col-sm-6">
            <p class="mb-1"><strong class="text-white"><i class="bi bi-disc me-2"></i>Quality Available:</strong> 480p, 720p, 1080p, 4K HDR</p>
            <p class="mb-1"><strong class="text-white"><i class="bi bi-subtitles me-2"></i>Subtitles:</strong> English & Hindi ESubs Included</p>
          </div>
        </div>

        <div class="d-flex gap-3 flex-wrap">
          <a href="#episodes-section" class="btn btn-crimson btn-lg fs-6"><i class="bi bi-download me-2"></i>Download Episodes</a>
          <a href="#trailer-modal" class="btn btn-outline-light btn-lg fs-6"><i class="bi bi-play-btn me-2"></i>Watch Trailer</a>
          <button class="btn btn-outline-secondary btn-lg fs-6"><i class="bi bi-bookmark-plus me-2"></i>Bookmark Series</button>
        </div>
      </div>
    </div>
  </section>

  <!-- ==========================================================================
       SEASON SELECTOR PILLS
       ========================================================================== -->
  <section class="mb-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="fw-bold m-0 border-start border-4 border-danger ps-3">Select Season</h4>
      <span class="text-white-50 small"><i class="bi bi-info-circle me-1"></i>All episodes zipped & single links available</span>
    </div>

    <div class="d-flex gap-2 flex-wrap">
      <a href="#season4" class="season-pill active"><i class="bi bi-collection-play-fill"></i> Season 4 (2022)</a>
      <a href="#season3" class="season-pill"><i class="bi bi-collection-play"></i> Season 3 (2019)</a>
      <a href="#season2" class="season-pill"><i class="bi bi-collection-play"></i> Season 2 (2017)</a>
      <a href="#season1" class="season-pill"><i class="bi bi-collection-play"></i> Season 1 (2016)</a>
    </div>
  </section>

  <!-- ==========================================================================
       EPISODES LIST & DOWNLOAD LINKS
       ========================================================================== -->
  <section id="episodes-section" class="mb-5">
    <!-- Full Season Zip Pack Banner -->
    <div class="glass-card p-4 mb-4 border-primary">
      <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
        <div>
          <span class="badge bg-success mb-2">COMPLETE SEASON ZIP PACK</span>
          <h5 class="fw-bold text-white mb-1">Stranger Things Season 4 [Episode 01 to 09] Batch Download</h5>
          <p class="text-white-50 small mb-0">Dual Audio (Hindi ORG 5.1 + English) | 720p HD Zip [3.8 GB] & 1080p FHD Zip [8.5 GB]</p>
        </div>
        <div class="d-flex gap-2">
          <a href="#" class="btn btn-outline-light btn-sm"><i class="bi bi-file-zip me-1"></i>720p Zip</a>
          <a href="#" class="btn btn-crimson btn-sm"><i class="bi bi-file-zip-fill me-1"></i>1080p Zip</a>
        </div>
      </div>
    </div>

    <!-- Single Episode Cards -->
    <h5 class="fw-bold text-white mb-3"><i class="bi bi-list-nested me-2"></i>Season 4 Single Episodes</h5>
    <div class="d-flex flex-column gap-3">
      
      <!-- Episode 1 -->
      <div class="episode-card">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
          <div class="d-flex align-items-center gap-3">
            <img src="https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=300" class="episode-thumb d-none d-sm-block" alt="Ep 1">
            <div>
              <h6 class="fw-bold text-white mb-1">E01: Chapter One: The Hellfire Club</h6>
              <p class="text-white-50 small mb-0">El struggles to fit in at school in California. In Hawkins, a new D&D campaign gets under way.</p>
              <span class="badge bg-secondary mt-1">Runtime: 1h 16m</span>
            </div>
          </div>
          <div class="d-flex gap-2 flex-wrap align-items-center">
            <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-download me-1"></i>480p [300MB]</a>
            <a href="#" class="btn btn-outline-primary btn-sm"><i class="bi bi-download me-1"></i>720p [600MB]</a>
            <a href="#" class="btn btn-crimson btn-sm"><i class="bi bi-cloud-arrow-down-fill me-1"></i>1080p [1.2GB]</a>
          </div>
        </div>
      </div>

      <!-- Episode 2 -->
      <div class="episode-card">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
          <div class="d-flex align-items-center gap-3">
            <img src="https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=300" class="episode-thumb d-none d-sm-block" alt="Ep 2">
            <div>
              <h6 class="fw-bold text-white mb-1">E02: Chapter Two: Vecna's Curse</h6>
              <p class="text-white-50 small mb-0">A plane brings Mike to California, and a dead body brings Hawkins to a halt. Nancy starts looking for answers.</p>
              <span class="badge bg-secondary mt-1">Runtime: 1h 17m</span>
            </div>
          </div>
          <div class="d-flex gap-2 flex-wrap align-items-center">
            <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-download me-1"></i>480p [310MB]</a>
            <a href="#" class="btn btn-outline-primary btn-sm"><i class="bi bi-download me-1"></i>720p [620MB]</a>
            <a href="#" class="btn btn-crimson btn-sm"><i class="bi bi-cloud-arrow-down-fill me-1"></i>1080p [1.3GB]</a>
          </div>
        </div>
      </div>

      <!-- Episode 3 -->
      <div class="episode-card">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
          <div class="d-flex align-items-center gap-3">
            <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?w=300" class="episode-thumb d-none d-sm-block" alt="Ep 3">
            <div>
              <h6 class="fw-bold text-white mb-1">E03: Chapter Three: The Monster and the Superhero</h6>
              <p class="text-white-50 small mb-0">Murray and Joyce fly to Alaska, and El faces serious consequences. Robin and Nancy dig into Hawkins' secrets.</p>
              <span class="badge bg-secondary mt-1">Runtime: 1h 03m</span>
            </div>
          </div>
          <div class="d-flex gap-2 flex-wrap align-items-center">
            <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-download me-1"></i>480p [280MB]</a>
            <a href="#" class="btn btn-outline-primary btn-sm"><i class="bi bi-download me-1"></i>720p [550MB]</a>
            <a href="#" class="btn btn-crimson btn-sm"><i class="bi bi-cloud-arrow-down-fill me-1"></i>1080p [1.1GB]</a>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- ==========================================================================
       SERIES SCREENSHOTS GALLERY
       ========================================================================== -->
  <section class="mb-5">
    <h4 class="fw-bold mb-4 border-start border-4 border-primary ps-3">Series Screenshots & Quality Preview</h4>
    <div class="row g-3">
      <div class="col-6 col-md-3">
        <div class="screenshot-item">
          <img src="https://images.unsplash.com/photo-1579783902614-a3fb3927b675?w=600" class="screenshot-img" alt="Screenshot 1">
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="screenshot-item">
          <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=600" class="screenshot-img" alt="Screenshot 2">
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="screenshot-item">
          <img src="https://images.unsplash.com/photo-1568876694728-451bbf694b83?w=600" class="screenshot-img" alt="Screenshot 3">
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="screenshot-item">
          <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=600" class="screenshot-img" alt="Screenshot 4">
        </div>
      </div>
    </div>
  </section>

  <!-- ==========================================================================
       MORE POPULAR WEB SERIES (RECOMMENDATIONS)
       ========================================================================== -->
  <section class="mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h4 class="fw-bold m-0 border-start border-4 border-purple ps-3" style="border-color: var(--accent-purple) !important;">You Might Also Like</h4>
      <a href="browse.html" class="text-white-50 text-decoration-none small">View All Series <i class="bi bi-arrow-right"></i></a>
    </div>

    <div class="row g-4">
      <div class="col-12 col-sm-6 col-lg-3">
        <div class="movie-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.8</span>
          <span class="quality-badge">1080p</span>
          <img src="https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=500" class="movie-poster" alt="Money Heist">
          <div class="movie-overlay">
            <h5 class="fw-bold text-white mb-1">Money Heist</h5>
            <p class="text-white-50 small mb-2">5 Seasons • Action / Crime</p>
            <a href="webseries.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Episodes</a>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-lg-3">
        <div class="movie-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.5</span>
          <span class="quality-badge">4K</span>
          <img src="https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500" class="movie-poster" alt="Wednesday">
          <div class="movie-overlay">
            <h5 class="fw-bold text-white mb-1">Wednesday</h5>
            <p class="text-white-50 small mb-2">1 Season • Fantasy / Mystery</p>
            <a href="webseries.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Episodes</a>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-lg-3">
        <div class="movie-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.9</span>
          <span class="quality-badge">1080p</span>
          <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500" class="movie-poster" alt="The Boys">
          <div class="movie-overlay">
            <h5 class="fw-bold text-white mb-1">The Boys</h5>
            <p class="text-white-50 small mb-2">4 Seasons • Action / Sci-Fi</p>
            <a href="webseries.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Episodes</a>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-lg-3">
        <div class="movie-card">
          <span class="rating-badge"><i class="bi bi-star-fill"></i> 8.7</span>
          <span class="quality-badge">4K</span>
          <img src="https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=500" class="movie-poster" alt="Loki">
          <div class="movie-overlay">
            <h5 class="fw-bold text-white mb-1">Loki</h5>
            <p class="text-white-50 small mb-2">2 Seasons • Sci-Fi / Action</p>
            <a href="webseries.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Episodes</a>
          </div>
        </div>
      </div>
    </div>
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
</html>
</asp:Content>
