<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication1.contact" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - FilmFlicks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/contact.css">
</head>
<body>
    <form id="form1" runat="server">
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
                        <li class="nav-item"><a class="nav-link text-white-50" href="webseries.aspx">Web Series</a></li>
                        <li class="nav-item"><a class="nav-link text-white-50" href="bollywood.aspx">Bollywood</a></li>
                        <li class="nav-item"><a class="nav-link text-white active" href="contact.aspx">Contact Us</a></li>
                    </ul>
                    <div class="d-flex align-items-center gap-3">
                        <div class="input-group" style="max-width: 240px;">
                            <input type="text" class="form-control bg-dark text-white border-secondary" placeholder="Search movies...">
                            <button class="btn btn-outline-secondary" type="button"><i class="bi bi-search"></i></button>
                        </div>
                        <a href="login.html" class="btn btn-outline-light btn-sm px-3 fw-semibold">Login</a>
                        <a href="register.html" class="btn btn-crimson btn-sm px-3">Register</a>
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

        <header class="contact-header" style="padding-top: 110px;">
            <div class="container text-center">
                <h2 class="fw-bold text-white mb-2"><i class="bi bi-envelope-paper-fill me-2 text-primary"></i>Get in Touch with Us</h2>
                <p class="text-white-50 mb-4">Have questions, feedback, or DMCA inquiries? We are here to help!</p>
            </div>
        </header>

        <main class="container my-5">
            <div class="row g-4 mb-5">
                <div class="col-12 col-md-4">
                    <div class="contact-info-card">
                        <div class="contact-icon-wrapper"><i class="bi bi-envelope-at-fill"></i></div>
                        <h5 class="fw-bold text-white mb-2">Email Support</h5>
                        <p class="text-white-50 small mb-2">Send us an email for general or technical queries.</p>
                        <a href="mailto:support@filmflicks.com" class="text-decoration-none fw-semibold style-link" style="color: var(--accent-purple);">support@filmflicks.com</a>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="contact-info-card">
                        <div class="contact-icon-wrapper"><i class="bi bi-telegram"></i></div>
                        <h5 class="fw-bold text-white mb-2">Telegram Channel</h5>
                        <p class="text-white-50 small mb-2">Join our Telegram channel for instant updates & links.</p>
                        <a href="#" class="text-decoration-none fw-semibold style-link" style="color: var(--accent-purple);">@FilmFlicksOfficial</a>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="contact-info-card">
                        <div class="contact-icon-wrapper"><i class="bi bi-shield-check"></i></div>
                        <h5 class="fw-bold text-white mb-2">DMCA & Copyright</h5>
                        <p class="text-white-50 small mb-2">For copyright removal requests and notice.</p>
                        <a href="mailto:dmca@filmflicks.com" class="text-decoration-none fw-semibold style-link" style="color: var(--accent-purple);">dmca@filmflicks.com</a>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-12 col-lg-7">
                    <div class="contact-form-card">
                        <h4 class="text-white fw-bold mb-4 border-bottom border-secondary pb-3">Send Us a Message</h4>

                        <asp:Label ID="lblMsg" runat="server" EnableViewState="false"></asp:Label>

                        <div class="row g-3">
                            <div class="col-12 col-md-6">
                                <label for="txtSenderName" class="form-label">Your Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtSenderName" runat="server" CssClass="form-control" placeholder="John Doe"></asp:TextBox>
                            </div>
                            <div class="col-12 col-md-6">
                                <label for="txtSenderEmail" class="form-label">Email Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtSenderEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="john@example.com"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label for="ddlSubject" class="form-label">Subject <span class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Choose a Subject" Value="" Selected="True" Disabled="True" />
                                    <asp:ListItem Text="General Inquiry" Value="general" />
                                    <asp:ListItem Text="Report Broken Link" Value="broken" />
                                    <asp:ListItem Text="DMCA / Copyright Notice" Value="dmca" />
                                    <asp:ListItem Text="Advertisement / Partnership" Value="ads" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-12">
                                <label for="txtMessageContent" class="form-label">Your Message <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtMessageContent" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Type your message here..."></asp:TextBox>
                            </div>
                            <div class="col-12 mt-4">
                                <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-crimson w-100 py-2 fw-semibold" OnClick="btnSubmit_Click">
                                    <i class="bi bi-send-fill me-2"></i>Send Message
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-5">
                    <h4 class="text-white fw-bold mb-4">Frequently Asked Questions</h4>
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                    How do I download movies from FilmFlicks?
                                </button>
                            </h2>
                            <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Simply click on any movie card, choose your preferred quality (4K, 1080p, or 720p), and click the download button to start instant downloading.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                    What if a download link is broken or not working?
                                </button>
                            </h2>
                            <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    If you encounter a broken link, select "Report Broken Link" in the contact form on this page or post a comment on the movie page. We usually fix links within 6 hours.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                    Are all movies available in Dual Audio?
                                </button>
                            </h2>
                            <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Yes, most Hollywood and South Indian movies on FilmFlicks are provided with Hindi Dual Audio unless specified otherwise.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>