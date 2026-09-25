<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="movie-details.aspx.cs" Inherits="WebApplication1.movie_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 CSS & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS Files -->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/movie-details.css">
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
                    <li class="nav-item"><a class="nav-link text-white-50" href="webseries.aspx">Web Series</a></li>
                    <li class="nav-item"><a class="nav-link text-white-50" href="Cartoon.aspx">Cartoon</a></li>
                    <li class="nav-item"><a class="nav-link text-white-50" href="contact.aspx">Contact Us</a></li>
                </ul>

                <div class="d-flex align-items-center gap-3">
                    <div class="input-group" style="max-width: 240px;">
                        <input type="text" id="navSearchQuery_md" class="form-control bg-dark text-white border-secondary" placeholder="Search movies, series..." onkeydown="if(event.key === 'Enter'){ performNavSearch_md(); return false; }">
                        <button class="btn btn-outline-secondary" type="button" onclick="performNavSearch_md()"><i class="bi bi-search"></i></button>
                    </div>
                   
                    <% if (Session["username"] == null) { %>
                        <a href="login.aspx" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
                        <a href="register.aspx" class="btn btn-crimson btn-sm px-3">Register</a>
                    <% } else { %>
                        <div class="profile-dropdown-container">
                            <div class="d-flex align-items-center gap-2" style="cursor: pointer;">
                                <span class="text-white fw-semibold small d-none d-md-inline"><%= Session["username"] %></span>
                            </div>
                            <div class="profile-dropdown-menu">
                                <div class="px-3 py-2 text-white border-bottom border-secondary mb-1">
                                    <div class="fw-bold"><%= Session["username"] %></div>
                                    <% if (Session["UserEmail"] != null) { %><div class="small text-white-50"><%= Session["UserEmail"] %></div><% } %>
                                </div>
                                <a href="myprofile.aspx"><i class="bi bi-person me-2"></i>My Profile</a>
                                <a href="requestmovie.aspx"><i class="bi bi-plus-circle me-2"></i>Request Movie</a>
                                <hr class="dropdown-divider bg-secondary my-1">
                                <a href="logout.aspx" class="text-danger"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- MAIN MOVIE DETAILS CONTENT -->
    <main class="container" style="padding-top: 100px;">
        
        <!-- DYNAMIC MOVIE DATA REPEATER -->
        <asp:Repeater ID="rptMovieDetails" runat="server" OnItemCommand="rptMovieDetails_ItemCommand">
            <ItemTemplate>
                <!-- Hero Banner Section -->
                <section class="movie-details-hero p-4 p-md-5 mb-5 glass-card">
                    <div class="row g-4 align-items-center">
                        <div class="col-12 col-md-4 col-lg-3">
                            <div class="poster-box">
                                <img src='<%# ResolveUrl(Eval("PosterUrl").ToString()) %>' class="poster-img img-fluid rounded" alt='<%# Eval("Title") %>'>
                            </div>
                        </div>

                        <div class="col-12 col-md-8 col-lg-9">
                            <div class="d-flex flex-wrap gap-2 mb-3">
                                <span class="meta-tag text-warning border-warning"><i class="bi bi-star-fill me-1"></i>IMDb 8.5</span>
                                <span class="meta-tag"><i class="bi bi-clock me-1"></i>2h 45m</span>
                                <span class="meta-tag"><i class="bi bi-translate me-1"></i>Dual Audio</span>
                            </div>

                            <h1 class="display-4 fw-bold text-white mb-3"><%# Eval("Title") %></h1>
                            
                            <div class="d-flex flex-wrap gap-2 mb-4">
                                <span class="badge bg-danger"><%# Eval("Category") %></span>
                                <span class="badge bg-primary"><%# Eval("QualityTag") %></span>
                            </div>

                            <p class="lead text-light mb-4"><%# Eval("Description") %></p>

                            <div class="row g-3 text-white-50 mb-4 small">
                                <div class="col-sm-6">
                                    <p class="mb-1"><strong class="text-white"><i class="bi bi-person-video2 me-2"></i>Director:</strong> <%# Eval("Director") %></p>
                                    <p class="mb-1"><strong class="text-white"><i class="bi bi-people me-2"></i>Cast:</strong> <%# Eval("Cast") %></p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="mb-1"><strong class="text-white"><i class="bi bi-award me-2"></i>Category:</strong> <%# Eval("Category") %></p>
                                    <p class="mb-1"><strong class="text-white"><i class="bi bi-disc me-2"></i>Quality Available:</strong> <%# Eval("QualityTag") %></p>
                                </div>
                            </div>

                            <div class="d-flex gap-3 flex-wrap">
                                <a href="#download-section" class="btn btn-crimson btn-lg fs-6"><i class="bi bi-download me-2"></i>Go To Downloads</a>
                                <a href="#trailer-section" class="btn btn-outline-light btn-lg fs-6"><i class="bi bi-play-btn me-2"></i>Watch Trailer</a>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Dynamic Official Trailer Section -->
                <section id="trailer-section" class="mb-5">
                    <h3 class="fw-bold mb-4 border-start border-4 border-danger ps-3">Official Trailer</h3>
                    <div class="player-wrapper p-2 glass-card">
                        <div class="ratio ratio-16x9">
                            <iframe src='<%# Eval("TrailerUrl") %>' title="Official Trailer" allowfullscreen class="rounded"></iframe>
                        </div>
                    </div>
                </section>

                <!-- Dynamic Screenshots Gallery Grid -->
                <section class="mb-5">
                    <h3 class="fw-bold mb-4 border-start border-4 border-primary ps-3">Movie Screenshots & Preview</h3>
                    <div class="row g-3">
                        <div class="col-6 col-md-3">
                            <img src='<%# ResolveUrl(Eval("Screenshot1").ToString()) %>' class="img-fluid rounded w-100" style="height: 160px; object-fit: cover;" alt="Screenshot 1">
                        </div>
                        <div class="col-6 col-md-3">
                            <img src='<%# ResolveUrl(Eval("Screenshot2").ToString()) %>' class="img-fluid rounded w-100" style="height: 160px; object-fit: cover;" alt="Screenshot 2">
                        </div>
                        <div class="col-6 col-md-3">
                            <img src='<%# ResolveUrl(Eval("Screenshot3").ToString()) %>' class="img-fluid rounded w-100" style="height: 160px; object-fit: cover;" alt="Screenshot 3">
                        </div>
                        <div class="col-6 col-md-3">
                            <img src='<%# ResolveUrl(Eval("Screenshot4").ToString()) %>' class="img-fluid rounded w-100" style="height: 160px; object-fit: cover;" alt="Screenshot 4">
                        </div>
                    </div>
                </section>

                <!-- Dynamic Download Links Table -->
                <section id="download-section" class="mb-5">
                    <h3 class="fw-bold mb-4 border-start border-4 border-success ps-3">High-Speed Download Links</h3>
                    <div class="glass-card table-responsive p-3">
                        <table class="table align-middle text-white mb-0">
                            <thead>
                                <tr class="text-white-50">
                                    <th>Server</th>
                                    <th>Quality</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="badge bg-success">Primary Server 1</span></td>
                                    <td><%# Eval("QualityTag") %></td>
                                    <td><a href='<%# Eval("DownloadLink1") %>' target="_blank" class="btn btn-crimson btn-sm"><i class="bi bi-cloud-arrow-down me-1"></i>Server 1 Download</a></td>
                                </tr>
                                <tr>
                                    <td><span class="badge bg-primary">Mirror Server 2</span></td>
                                    <td><%# Eval("QualityTag") %></td>
                                    <td><a href='<%# Eval("DownloadLink2") %>' target="_blank" class="btn btn-crimson btn-sm"><i class="bi bi-cloud-arrow-down me-1"></i>Server 2 Download</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Dynamic Comments & Reviews Section -->
        <section class="mb-5">
            <h3 class="fw-bold mb-4 border-start border-4 border-purple ps-3">User Reviews & Comments</h3>
            
            <div class="glass-card p-4">
                <!-- Add Comment Form -->
                <div class="mb-5">
                    <h5 class="fw-bold text-white mb-3"><i class="bi bi-chat-square-text me-2"></i>Leave a Review</h5>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control bg-dark text-white border-secondary mb-2" Placeholder="Your Name"></asp:TextBox>
                        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control bg-dark text-white border-secondary" Placeholder="Write your review here..."></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmitComment" runat="server" Text="Post Comment" CssClass="btn btn-crimson btn-sm" OnClick="btnSubmitComment_Click" />
                </div>

                <!-- Comment List Repeater -->
                <div class="review-list">
                    <asp:Repeater ID="rptComments" runat="server" OnItemCommand="rptComments_ItemCommand">
                        <ItemTemplate>
                            <div class="review-card mb-3 pb-3 border-bottom border-secondary">
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <h6 class="fw-bold text-white m-0"><%# Eval("UserName") %></h6>
                                    <span class="text-warning small"><i class="bi bi-star-fill me-1"></i><%# Eval("Rating") %></span>
                                </div>
                                <p class="text-white-50 small mb-1"><%# Eval("CommentText") %></p>
                                <span class="text-muted" style="font-size: 0.75rem;"><%# Eval("CommentDate", "{0:dd MMM yyyy}") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- FOOTER -->
    <footer class="glass-card mt-5 rounded-0 border-start-0 border-end-0 border-bottom-0 py-5">
        <div class="container text-center text-white-50 small">
            © 2026 FilmFlicks. All rights reserved.
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</asp:Content>