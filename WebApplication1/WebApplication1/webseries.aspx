<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="webseries.aspx.cs" Inherits="WebApplication1.webseries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Web Series - FilmFlicks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/webseries.css">
    </head>
    <body>

        <!-- NAVBAR -->
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
                        <li class="nav-item"><a class="nav-link text-white active" href="webseries.aspx">Web Series</a></li>
                        <li class="nav-item"><a class="nav-link text-white-50 " href="Cartoon.aspx">Cartoon</a></li>
                        <li class="nav-item"><a class="nav-link text-white-50" href="contact.aspx">Contact Us</a></li>
                    </ul>

                    <div class="d-flex align-items-center gap-3">
                        <div class="input-group" style="max-width: 240px;">
                            <input type="text" id="navSearchQuery_cart" class="form-control bg-dark text-white border-secondary" placeholder="Search cartoons..." onkeydown="if(event.key === 'Enter'){ performNavSearch_cart(); return false; }">
                            <button class="btn btn-outline-secondary" type="button" onclick="performNavSearch_cart()"><i class="bi bi-search"></i></button>
                        </div>
                        
                        <a href="admin-login.aspx" class="btn btn-outline-warning btn-sm px-3 fw-semibold"><i class="bi bi-shield-lock me-1"></i>Admin</a>

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
    <main class="container" style="padding-top: 100px;">
        
        <!-- Dynamic Web Series Section -->
        <section class="mb-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold m-0 border-start border-4 border-danger ps-3">Popular Web Series</h3>
            </div>
            
            <div class="row g-4">
                <asp:Repeater ID="rptWebSeries" runat="server" OnItemCommand="rptWebSeries_ItemCommand">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-lg-3">
                            <div class="movie-card">
                                <span class="rating-badge"><i class="bi bi-star-fill"></i> <%# Eval("ImdbID") %></span>
                                <span class="quality-badge"><%# Eval("QualityTag") %></span>
                                
                                <img src='<%# ResolveUrl(Eval("PosterUrl").ToString()) %>' class="movie-poster" alt='<%# Eval("Title") %>'>
                                
                                <div class="movie-overlay">
                                    <h5 class="fw-bold text-white mb-2"><%# Eval("Title") %></h5>
                                    <a href='<%# "webseries_details.aspx?id=" + Eval("SeriesID") %>' class="btn btn-crimson btn-sm w-100 mt-2">
                                        <i class="bi bi-play-fill me-1"></i>View Series
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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
                    <a href="index.aspx" class="fw-bold fs-3 text-decoration-none" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                        <i class="bi bi-film me-2"></i>FilmFlicks
                    </a>
                    <p class="text-white-50 mt-3 small">FilmFlicks is a premier platform for high-quality web series and movie downloads.</p>
                </div>
            </div>
            <hr class="border-secondary my-4">
            <div class="text-center text-white-50 small">
                © 2026 FilmFlicks. All rights reserved.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>
</asp:Content>