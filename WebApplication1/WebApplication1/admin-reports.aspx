<%@ Page Title="Reports - FilmFlicks Admin" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin-reports.aspx.cs" Inherits="WebApplication1.admin_reports" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body, html {
            background-color: #12151e !important;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0 !important;
            padding: 0 !important;
            height: 100%;
        }

        .admin-wrapper {
            display: flex;
            min-height: 100vh;
            width: 100%;
        }

        /* Sidebar Styling */
        .admin-sidebar {
            width: 260px;
            background-color: #161925;
            padding: 20px 15px;
            display: flex;
            flex-direction: column;
            border-right: 1px solid rgba(255, 255, 255, 0.05);
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 1000;
        }

        .sidebar-brand {
            font-size: 1.5rem;
            font-weight: 700;
            color: #6366f1;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 30px;
            padding-left: 10px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
        }

        .sidebar-menu li {
            margin-bottom: 8px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 15px;
            color: #94a3b8;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background-color: rgba(99, 102, 241, 0.15);
            color: #ffffff;
        }

        /* Main Content Styling */
        .admin-main-content {
            flex-grow: 1;
            margin-left: 260px;
            padding: 30px;
            background-color: #12151e;
            min-height: 100vh;
            width: calc(100% - 260px);
        }

        /* Card Component */
        .admin-card {
            background-color: #1a1d2d;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            border: 1px solid rgba(255, 255, 255, 0.05);
            margin-bottom: 20px;
            transition: transform 0.2s ease;
        }

        .admin-card:hover {
            border-color: rgba(99, 102, 241, 0.3);
        }

        .card-icon-box {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            background-color: rgba(99, 102, 241, 0.15);
            color: #6366f1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .btn-download {
            background-color: #6366f1;
            color: #ffffff;
            border: none;
            padding: 9px 18px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.88rem;
            transition: all 0.2s ease;
        }

        .btn-download:hover {
            background-color: #4f46e5;
            color: #ffffff;
        }

        @media (max-width: 768px) {
            .admin-sidebar { display: none; }
            .admin-main-content { margin-left: 0; width: 100%; padding: 15px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- SIDEBAR NAVIGATION -->
    <nav class="admin-sidebar">
        <a href="admin-dashboard.aspx" class="sidebar-brand">
            <i class="bi bi-film"></i>
            <span>FilmFlicks</span>
        </a>

        <ul class="sidebar-menu">
            <li><a href="admin-webseries.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Webseries</span></a></li>
            <li><a href="admin-movies.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Movies</span></a></li>
            <li><a href="admin-Cartoon.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Cartoon</span></a></li>
            <li><a href="admin-movierequest.aspx"><i class="bi bi-send-fill"></i> <span>Movie Requests</span></a></li>
            <li><a href="admin-users.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
            <li><a href="admin-comments.aspx"><i class="bi bi-chat-left-text-fill"></i> <span>Comments</span></a></li>
            <!-- Comments ni niche Reports tab (Active) -->
            <li><a href="admin-reports.aspx" class="active"><i class="bi bi-file-earmark-bar-graph-fill"></i> <span>Reports</span></a></li>
        </ul>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
        <div class="pt-3 border-top border-secondary border-opacity-25 mt-auto">
            <a href="logout.aspx" class="text-danger d-flex align-items-center gap-2 p-2 text-decoration-none fw-semibold rounded-3">
                <i class="bi bi-box-arrow-left"></i> <span>Logout</span>
            </a>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- MAIN CONTENT AREA -->
    <main class="admin-main-content">
        
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 mb-4 pb-3 border-bottom border-secondary border-opacity-25">
            <div>
                <h3 class="fw-bold text-white mb-1">Reports Center</h3>
                <p class="text-white-50 small mb-0">Download system database reports in PDF format using Crystal Reports.</p>
            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold d-block mb-3"></asp:Label>

        <!-- REPORTS CARDS GRID -->
        <div class="row g-4">

            <!-- 1. Movies Report -->
            <div class="col-md-6 col-lg-4">
                <div class="admin-card d-flex flex-column h-100 justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="card-icon-box"><i class="bi bi-film"></i></div>
                            <div>
                                <h5 class="fw-bold text-white mb-0">Movies Report</h5>
                                <span class="text-white-50 small">Catalog Summary</span>
                            </div>
                        </div>
                        <p class="text-white-50 small mb-4">Export complete movies list with quality tags, director and links.</p>
                    </div>
                    <asp:Button ID="btnMoviesReport" runat="server" Text="Download PDF" CssClass="btn btn-download w-100" OnClick="btnMoviesReport_Click" />
                </div>
            </div>

            <!-- 2. Web Series Report -->
            <div class="col-md-6 col-lg-4">
                <div class="admin-card d-flex flex-column h-100 justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="card-icon-box"><i class="bi bi-collection-play"></i></div>
                            <div>
                                <h5 class="fw-bold text-white mb-0">Web Series Report</h5>
                                <span class="text-white-50 small">Show Listings</span>
                            </div>
                        </div>
                        <p class="text-white-50 small mb-4">Download all registered web series details and season info.</p>
                    </div>
                    <asp:Button ID="btnWebSeriesReport" runat="server" Text="Download PDF" CssClass="btn btn-download w-100" OnClick="btnWebSeriesReport_Click" />
                </div>
            </div>

            <!-- 3. Cartoons Report -->
            <div class="col-md-6 col-lg-4">
                <div class="admin-card d-flex flex-column h-100 justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="card-icon-box"><i class="bi bi-controller"></i></div>
                            <div>
                                <h5 class="fw-bold text-white mb-0">Cartoon Report</h5>
                                <span class="text-white-50 small">Animated Shows</span>
                            </div>
                        </div>
                        <p class="text-white-50 small mb-4">Export list of animated movies and cartoon series.</p>
                    </div>
                    <asp:Button ID="btnCartoonReport" runat="server" Text="Download PDF" CssClass="btn btn-download w-100" OnClick="btnCartoonReport_Click" />
                </div>
            </div>

            <!-- 4. Users Report -->
            <div class="col-md-6 col-lg-4">
                <div class="admin-card d-flex flex-column h-100 justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="card-icon-box"><i class="bi bi-people"></i></div>
                            <div>
                                <h5 class="fw-bold text-white mb-0">Users Report</h5>
                                <span class="text-white-50 small">User Accounts</span>
                            </div>
                        </div>
                        <p class="text-white-50 small mb-4">Download list of registered users and account status.</p>
                    </div>
                    <asp:Button ID="btnUsersReport" runat="server" Text="Download PDF" CssClass="btn btn-download w-100" OnClick="btnUsersReport_Click" />
                </div>
            </div>

            <!-- 5. Comments Report -->
            <div class="col-md-6 col-lg-4">
                <div class="admin-card d-flex flex-column h-100 justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="card-icon-box"><i class="bi bi-chat-left-text"></i></div>
                            <div>
                                <h5 class="fw-bold text-white mb-0">Comments Report</h5>
                                <span class="text-white-50 small">User Feedback</span>
                            </div>
                        </div>
                        <p class="text-white-50 small mb-4">Export all user comments and posted reviews.</p>
                    </div>
                    <asp:Button ID="btnCommentsReport" runat="server" Text="Download PDF" CssClass="btn btn-download w-100" OnClick="btnCommentsReport_Click" />
                </div>
            </div>

            <!-- 6. Movie Requests Report -->
            <div class="col-md-6 col-lg-4">
                <div class="admin-card d-flex flex-column h-100 justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="card-icon-box"><i class="bi bi-send"></i></div>
                            <div>
                                <h5 class="fw-bold text-white mb-0">Requests Report</h5>
                                <span class="text-white-50 small">Pending & Resolved</span>
                            </div>
                        </div>
                        <p class="text-white-50 small mb-4">Download list of requested movies submitted by users.</p>
                    </div>
                    <asp:Button ID="btnRequestsReport" runat="server" Text="Download PDF" CssClass="btn btn-download w-100" OnClick="btnRequestsReport_Click" />
                </div>
            </div>

        </div>

    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</asp:Content>