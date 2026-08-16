<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requestmovie.aspx.cs" Inherits="WebApplication1.requestmovie" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Movie - FilmFlicks</title>

    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Custom CSS Files -->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/requestmovie.css">
</head>
<body>
    <form id="form1" runat="server">
        
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
                   
<%--                        <li class="nav-item"><a class="nav-link text-white-50" href="movie-details.aspx">Movies</a></li>--%>
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

        <!-- HEADER SECTION -->
        <header class="request-header" style="padding-top: 110px;">
            <div class="container text-center">
                <h2 class="fw-bold text-white mb-2">
                    <i class="bi bi-send-plus-fill me-2 text-danger"></i>Request a Movie or Web Series
                </h2>
                <p class="text-white-50 mb-4">Can't find what you are looking for? Let us know and we'll upload it for you!</p>
            </div>
        </header>

        <!-- REQUEST FORM & RULES SECTION -->
        <main class="container my-5">
            <div class="row g-4">

                <!-- Left Column: The Form -->
                <div class="col-12 col-lg-8">
                    <div class="request-card">
                        <h4 class="text-white fw-bold mb-4 border-bottom border-secondary pb-3">Submit Your Request</h4>

                        <!-- Alert Message -->
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>

                        <div class="row g-4">

                            <!-- Movie / Series Title -->
                            <div class="col-12">
                                <label for="txtTitle" class="form-label">Movie / Web Series Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="e.g., Avengers: Endgame"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                                    ErrorMessage="Please enter the movie or series title." CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <!-- Content Type -->
                            <div class="col-12 col-md-6">
                                <label for="ddlContentType" class="form-label">Type <span class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlContentType" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Select Type</asp:ListItem>
                                    <asp:ListItem Value="Movie">Movie</asp:ListItem>
                                    <asp:ListItem Value="Web Series">Web Series</asp:ListItem>
                                    <asp:ListItem Value="Anime">Anime</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvContentType" runat="server" ControlToValidate="ddlContentType"
                                    InitialValue="" ErrorMessage="Please select a content type." CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <!-- Release Year -->
                            <div class="col-12 col-md-6">
                                <label for="txtYear" class="form-label">Release Year <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtYear" runat="server" TextMode="Number" CssClass="form-control" Placeholder="e.g., 2024"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtYear"
                                    ErrorMessage="Please enter release year." CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvYear" runat="server" ControlToValidate="txtYear" Type="Integer"
                                    MinimumValue="1900" MaximumValue="2026" ErrorMessage="Year must be between 1900 and 2026."
                                    CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RangeValidator>
                            </div>

                            <!-- Preferred Language -->
                            <div class="col-12 col-md-6">
                                <label for="ddlLanguage" class="form-label">Preferred Language <span class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Select Language</asp:ListItem>
                                    <asp:ListItem Value="Hindi (Dual Audio)">Hindi (Dual Audio)</asp:ListItem>
                                    <asp:ListItem Value="English">English</asp:ListItem>
                                    <asp:ListItem Value="Gujarati">Gujarati</asp:ListItem>
                                    <asp:ListItem Value="South Indian (Hindi Dubbed)">South Indian (Hindi Dubbed)</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvLanguage" runat="server" ControlToValidate="ddlLanguage"
                                    InitialValue="" ErrorMessage="Please select a preferred language." CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <!-- Preferred Quality -->
                            <div class="col-12 col-md-6">
                                <label for="ddlQuality" class="form-label">Preferred Quality <span class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlQuality" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Select Quality</asp:ListItem>
                                    <asp:ListItem Value="Any Quality">Any Quality</asp:ListItem>
                                    <asp:ListItem Value="4K Ultra HD">4K Ultra HD</asp:ListItem>
                                    <asp:ListItem Value="1080p FHD">1080p FHD</asp:ListItem>
                                    <asp:ListItem Value="720p HD">720p HD</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvQuality" runat="server" ControlToValidate="ddlQuality"
                                    InitialValue="" ErrorMessage="Please select preferred video quality." CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <!-- Extra Message / Description -->
                            <div class="col-12">
                                <label for="txtMessage" class="form-label">Additional Details <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"
                                    Placeholder="Specify season, episode or details..."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                                    ErrorMessage="Please fill out additional details." CssClass="text-danger small mt-1" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <!-- Submit Button -->
                            <div class="col-12 text-end mt-4">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send Request" CssClass="btn btn-crimson px-5 py-2 fw-bold w-100 w-md-auto" OnClick="btnSubmit_Click" />
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Right Column: Rules & Info -->
                <div class="col-12 col-lg-4">
                    <div class="rules-panel">
                        <h5 class="text-white fw-bold mb-4">Request Guidelines</h5>

                        <div class="rule-item">
                            <div class="rule-icon"><i class="bi bi-search"></i></div>
                            <div class="rule-text">
                                <h6>Search First</h6>
                                <p>Please use our search bar to ensure the movie isn't already available on FilmFlicks before requesting.</p>
                            </div>
                        </div>

                        <div class="rule-item">
                            <div class="rule-icon"><i class="bi bi-spellcheck"></i></div>
                            <div class="rule-text">
                                <h6>Correct Spelling</h6>
                                <p>Ensure the title and release year are accurate so our team can find the exact movie or series you want.</p>
                            </div>
                        </div>

                        <div class="rule-item">
                            <div class="rule-icon"><i class="bi bi-clock-history"></i></div>
                            <div class="rule-text">
                                <h6>Processing Time</h6>
                                <p>We usually fulfill requests within 24 to 48 hours depending on availability in high quality.</p>
                            </div>
                        </div>

                        <div class="rule-item">
                            <div class="rule-icon"><i class="bi bi-bell-fill"></i></div>
                            <div class="rule-text">
                                <h6>Notification</h6>
                                <p>Keep an eye on our "Latest Added" section on the Home page. Your request will appear there once uploaded.</p>
                            </div>
                        </div>

                        <hr class="border-secondary my-4">

                        <div class="text-center">
                            <p class="text-white-50 small mb-2">Need direct support?</p>
                            <a href="contact.aspx" class="btn btn-outline-light btn-sm w-100">Contact Admin</a>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <!-- FOOTER -->
        <footer class="glass-card mt-5 rounded-0 border-start-0 border-end-0 border-bottom-0 py-5">
            <div class="container">
                <div class="row g-4 mb-4">
                    <div class="col-lg-4">
                        <a href="index.aspx" class="fw-bold fs-3 text-decoration-none" style="background: var(--accent-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                            <i class="bi bi-film me-2"></i>FilmFlicks
                        </a>
                        <p class="text-white-50 mt-3 small">FilmFlicks is a premier platform for high-quality movie downloads, dual audio films, and web series. Enjoy fast, secure, and hassle-free movie access in 480p, 720p, 1080p, and 4K Ultra HD.</p>
                    </div>
                    <div class="col-6 col-lg-2">
                        <h6 class="fw-bold text-white mb-3">Quick Links</h6>
                        <ul class="list-unstyled text-white-50 small">
                            <li class="mb-2"><a href="index.aspx" class="text-white-50 text-decoration-none">Home</a></li>
                      
                <%--            <li class="mb-2"><a href="movie-details.aspx" class="text-white-50 text-decoration-none">Movies</a></li>--%>
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
                    © 2026 FilmFlicks. All rights reserved.
                </div>
            </div>
        </footer>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>