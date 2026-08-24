<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content9" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>FilmFlicks - Unlimited Movies & Web Series Download</title>

                    <!-- Bootstrap 5 CSS CDN -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                    <!-- Bootstrap Icons CDN -->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

                    <!-- Custom Modular CSS Files -->
                    <link rel="stylesheet" href="css/main.css">
                    <link rel="stylesheet" href="css/home.css">
                </head>
                <body>

                    <!-- ==========================================================================
       STICKY GLASSMORPHISM NAVBAR
       ========================================================================== -->
                    <nav class="navbar navbar-expand-lg fixed-top glass-nav navbar-dark">
                        <div class="container">
                            <a class="navbar-brand fw-bold fs-3" href="index." style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;"><i class="bi bi-film me-2 text-primary"></i>FilmFlicks </a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0 fw-semibold ms-lg-4">
                                    <li class="nav-item"><a class="nav-link text-white active" href="index.aspx">Home</a></li>
                               <%--     <li class="nav-item"><a class="nav-link text-white-50" href="about.aspx">about Us</a></li>
                                    <li class="nav-item"><a class="nav-link text-white-50" href="movie-details.aspx">Movies</a></li>--%>
                                    <li class="nav-item"><a class="nav-link text-white-50" href="webseries.aspx">Web Series</a></li>
                                    <li class="nav-item"><a class="nav-link text-white-50" href="bollywood.aspx">Bollywood</a></li>
                                    <li class="nav-item"><a class="nav-link text-white-50" href="contact.aspx">Contact Us</a></li>
                                </ul>
                                <div class="d-flex align-items-center gap-3">
                                    <form class="input-group" style="max-width: 240px;" action="browse.aspx">
                                        <input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Search movies...">
                                        <button class="btn btn-outline-secondary" type="submit">
                                            <i class="bi bi-search"></i>
                                        </button>
                                    </form>
                                    <a href="login.aspx" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a> <a href="register.aspx" class="btn btn-crimson btn-sm px-3">Register</a>

                                    <!-- Pure CSS Profile Dropdown -->
                                    <div class="profile-dropdown-container">
                                        <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100" class="rounded-circle border border-primary p-1" width="42" height="42" alt="Profile Avatar">
                                        <div class="profile-dropdown-menu">
                                            <a href="myprofile.aspx"><i class="bi bi-person me-2"></i>My Profile</a> <a href="mywatchlist.aspx"><i class="bi bi-bookmark me-2"></i>My Watchlist</a> <a href="requestmovie.aspx"><i class="bi bi-plus-circle me-2"></i>Request Movie</a> <a href="admin-login.aspx"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</a>
                                            <hr class="dropdown-divider bg-secondary my-1"><a href="login.aspx" class="text-danger"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
</asp:Content>
<asp:Content ID="Content10" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <!-- ==========================================================================
       MULTI-COLUMN FOOTER
       ========================================================================== -->
                <footer class="glass-card mt-5 rounded-0 border-start-0 border-end-0 border-bottom-0 py-5">
                    <div class="container">
                        <div class="row g-4 mb-4">
                            <div class="col-lg-4">
                                <a href="index.aspx" class="fw-bold fs-3 text-decoration-none" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;"><i class="bi bi-film me-2"></i>FilmFlicks </a>
                                <p class="text-white-50 mt-3 small">
                                    FilmFlicks is a premier platform for high-quality movie downloads, dual audio films, and web series. Enjoy fast, secure, and hassle-free movie access in 480p, 720p, 1080p, and 4K Ultra HD.</p>
                            </div>
                            <div class="col-6 col-lg-2">
                                <h6 class="fw-bold text-white mb-3">Quick Links</h6>
                                <ul class="list-unstyled text-white-50 small">
                                    <li class="mb-2"><a href="index.aspx" class="text-white-50 text-decoration-none">Home</a></li>
                                  <%--  <li class="mb-2"><a href="about.aspx" class="text-white-50 text-decoration-none">About Us</a></li>
                                    <li class="mb-2"><a href="movie-details.aspx" class="text-white-50 text-decoration-none">Movies</a></li>--%>
                                    <li class="mb-2"><a href="webseries.aspx" class="text-white-50 text-decoration-none">Web Series</a></li>
                                    <li class="mb-2"><a href="bollywood.aspx" class="text-white-50 text-decoration-none">Bollywood</a></li>
                                    <li class="mb-2"><a href="contact.aspx" class="text-white-50 text-decoration-none">Contact Us</a></li>
                                    <li class="mb-2"><a href="login.aspx" class="text-white-50 text-decoration-none">Login</a></li>
                                    <li class="mb-2"><a href="register.aspx" class="text-white-50 text-decoration-none">Register</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-4">
                                <h6 class="fw-bold text-white mb-3">Disclaimer & Info</h6>
                                <p class="text-white-50 small">
                                    We do not host any files on our server. All content is provided by non-affiliated third parties. Designed for educational and UI showcase purposes.</p>
                                <div class="d-flex gap-3 fs-5 text-white-50 mt-3">
                                    <a href="#" class="text-white-50"><i class="bi bi-telegram"></i></a><a href="#" class="text-white-50"><i class="bi bi-twitter-x"></i></a><a href="#" class="text-white-50"><i class="bi bi-youtube"></i></a>
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
<asp:Content ID="Content11" runat="server" contentplaceholderid="ContentPlaceHolder2">
                <!-- ==========================================================================
       HERO BANNER SECTION
       ========================================================================== -->
                <main class="container" style="padding-top: 100px;">
    <section class="hero-banner p-4 p-md-5 mb-5 glass-card">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <span class="badge bg-warning text-dark fw-bold px-3 py-2"><i class="bi bi-star-fill me-1"></i>IMDb 8.7</span> <span class="badge bg-secondary text-white px-3 py-2">Sci-Fi / Adventure</span> <span class="badge bg-danger text-white px-3 py-2">4K Ultra HD</span>
                </div>
                <h1 class="display-3 fw-bold text-white mb-3">Interstellar</h1>
                <p class="lead text-light mb-4">
                    When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.</p>
                <div class="d-flex gap-3 flex-wrap">
                    <a href="movie-details.html" class="btn btn-crimson btn-lg fs-6"><i class="bi bi-download me-2"></i>Download Movie</a> <a href="movie-details.html" class="btn btn-outline-light btn-lg fs-6"><i class="bi bi-play-circle me-2"></i>Watch Trailer</a>
                </div>
            </div>
        </div>
    </section>

                    <!-- ==========================================================================
         GRID 1: TRENDING MOVIES (4 COLUMNS)
         ========================================================================== -->
                    <section class="mb-5">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-bold m-0 border-start border-4 border-danger ps-3">Trending Movies</h3>
                            <a href="browse.aspx" class="text-white-50 text-decoration-none small">View All <i class="bi bi-arrow-right"></i></a>
                        </div>
                        <div class="row g-4">
                            <!-- Movie 1 -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>8.8</span> <span class="quality-badge">4K</span>
                                    <img src="https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=500" class="movie-poster" alt="Inception">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">Inception</h5>
                                        <p class="text-white-50 small mb-2">
                                            2010 • Sci-Fi / Action</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Details</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Movie 2 -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>8.5</span> <span class="quality-badge">1080p</span>
                                    <img src="https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=500" class="movie-poster" alt="Dune 2">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">Dune: Part Two</h5>
                                        <p class="text-white-50 small mb-2">
                                            2024 • Adventure / Sci-Fi</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Details</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Movie 3 -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>8.9</span> <span class="quality-badge">4K</span>
                                    <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500" class="movie-poster" alt="Oppenheimer">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">Oppenheimer</h5>
                                        <p class="text-white-50 small mb-2">
                                            2023 • Biography / History</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Details</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Movie 4 -->
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>9.0</span> <span class="quality-badge">1080p</span>
                                    <img src="https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=500" class="movie-poster" alt="Dark Knight">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">The Dark Knight</h5>
                                        <p class="text-white-50 small mb-2">
                                            2008 • Action / Crime</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-play-fill me-1"></i>View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
    </section>

                    <!-- ==========================================================================
         GRID 2: RECENTLY ADDED
         ========================================================================== -->
                    <section class="mb-5">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-bold m-0 border-start border-4 border-primary ps-3">Recently Added</h3>
                            <a href="browse.aspx" class="text-white-50 text-decoration-none small">View All <i class="bi bi-arrow-right"></i></a>
                        </div>
                        <div class="row g-4">
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>7.9</span> <span class="quality-badge">720p</span>
                                    <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500" class="movie-poster" alt="Avatar">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">Avatar: The Way of Water</h5>
                                        <p class="text-white-50 small mb-2">
                                            2022 • Action / Fantasy</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>8.0</span> <span class="quality-badge">1080p</span>
                                    <img src="https://images.unsplash.com/photo-1579783902614-a3fb3927b675?w=500" class="movie-poster" alt="The Batman">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">The Batman</h5>
                                        <p class="text-white-50 small mb-2">
                                            2022 • Action / Mystery</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>8.4</span> <span class="quality-badge">4K</span>
                                    <img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500" class="movie-poster" alt="Spider-Man">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">Spider-Man: Across Spider-Verse</h5>
                                        <p class="text-white-50 small mb-2">
                                            2023 • Animation / Action</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="movie-card">
                                    <span class="rating-badge"><i class="bi bi-star-fill"></i>7.8</span> <span class="quality-badge">1080p</span>
                                    <img src="https://images.unsplash.com/photo-1568876694728-451bbf694b83?w=500" class="movie-poster" alt="Top Gun">
                                    <div class="movie-overlay">
                                        <h5 class="fw-bold text-white mb-1">Top Gun: Maverick</h5>
                                        <p class="text-white-50 small mb-2">
                                            2022 • Action / Drama</p>
                                        <a href="movie-details.aspx" class="btn btn-crimson btn-sm w-100"><i class="bi bi-download me-1"></i>Download</a>
                                    </div>
                                </div>
                            </div>
                        </div>
    </section>

                    <!-- ==========================================================================
         GRID 3: CATEGORY HIGHLIGHTS
         ========================================================================== -->
                    <section class="mb-5">
                        <h3 class="fw-bold mb-4 border-start border-4 border-purple ps-3" style="border-color: var(--accent-purple) !important;">Popular Categories</h3>
                        <div class="d-flex gap-3 flex-wrap">
                            <a href="index.aspx" class="category-pill"><i class="bi bi-fire text-danger"></i>Action Movies</a> <a href="index.aspx" class="category-pill"><i class="bi bi-rocket-takeoff text-primary"></i>Sci-Fi & Fantasy</a> <a href="index.aspx" class="category-pill"><i class="bi bi-emoji-laughing text-warning"></i>Comedy Express</a> <a href="index.aspx" class="category-pill"><i class="bi bi-ghost text-info"></i>Horror / Thriller</a> <a href="index.aspx" class="category-pill"><i class="bi bi-heart text-danger"></i>Romantic Drama</a> <a href="index.aspx" class="category-pill"><i class="bi bi-film text-success"></i>South Dual Audio</a>
                        </div>
    </section>
    </main>
</asp:Content>

