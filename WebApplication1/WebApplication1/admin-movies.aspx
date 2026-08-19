<%@ Page Title="Manage Movies - FilmFlicks Admin" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin-movies.aspx.cs" Inherits="WebApplication1.admin_movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- INTERNAL CUSTOM CSS (Matching Admin Theme) -->
    <style>
        body {
            background-color: #12151e !important;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .admin-wrapper {
            display: flex;
            min-height: 100vh;
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
        }

        .admin-card {
            background-color: #1a1d2d;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            border: 1px solid rgba(255, 255, 255, 0.05);
            margin-bottom: 30px;
        }

        .card-header-title {
            font-size: 1.15rem;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Form Controls Styling */
        .form-label {
            color: #cbd5e1;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
        }

        .form-control, .form-select {
            background-color: #121522 !important;
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            color: #ffffff !important;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

        .form-select {
            cursor: pointer;
        }

        .form-control::placeholder {
            color: #475569;
        }

        .form-control:focus, .form-select:focus {
            border-color: #6366f1 !important;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25) !important;
            outline: none;
        }

        /* Action Buttons */
        .btn-primary-purple {
            background-color: #6366f1;
            color: #ffffff;
            border: none;
            padding: 10px 22px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

        .btn-primary-purple:hover {
            background-color: #4f46e5;
            color: #ffffff;
        }

        .btn-secondary-dark {
            background-color: #1e293b;
            color: #94a3b8;
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

        .btn-secondary-dark:hover {
            background-color: #334155;
            color: #ffffff;
        }

        /* Custom Table Styling */
        .table-dark-custom {
            --bs-table-bg: transparent;
            --bs-table-color: #cbd5e1;
            border-color: rgba(255, 255, 255, 0.05);
        }

        .table-dark-custom th {
            color: #64748b;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            padding-bottom: 15px;
        }

        .table-dark-custom td {
            padding: 16px 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .action-btn-danger, .action-btn-warning {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
            text-decoration: none;
        }

        .action-btn-danger {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .action-btn-danger:hover {
            background-color: #ef4444;
            color: #ffffff;
        }

        .action-btn-warning {
            background-color: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
            border: 1px solid rgba(245, 158, 11, 0.2);
        }

        .action-btn-warning:hover {
            background-color: #f59e0b;
            color: #ffffff;
        }

        @media (max-width: 768px) {
            .admin-sidebar {
                display: none;
            }
            .admin-main-content {
                margin-left: 0;
                padding: 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- SIDEBAR -->
    <nav class="admin-sidebar">
        <a href="admin-dashboard.aspx" class="sidebar-brand">
            <i class="bi bi-film"></i>
            <span>FilmFlicks</span>
        </a>

        <ul class="sidebar-menu">
            <li><a href="admin-dashboard.aspx"><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
            <li><a href="admin-movies.aspx" class="active"><i class="bi bi-collection-play-fill"></i> <span>Manage Movies</span></a></li>
            <li><a href="admin-movierequest.aspx"><i class="bi bi-tags-fill"></i> <span>Movierequest</span></a></li>
            <li><a href="admin-users.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
            <li><a href="admin-comments.aspx"><i class="bi bi-chat-left-text-fill"></i> <span>Comments</span></a></li>
            <li><a href="admin-settings.aspx"><i class="bi bi-gear-fill"></i> <span>Settings</span></a></li>
        </ul>

        <div class="pt-3 border-top border-secondary border-opacity-25 mt-auto">
            <a href="index.aspx" class="text-danger d-flex align-items-center gap-2 p-2 text-decoration-none fw-semibold rounded-3">
                <i class="bi bi-box-arrow-left"></i> <span>Logout</span>
            </a>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- MAIN CONTENT AREA -->
    <main class="admin-main-content">
        
        <!-- Header Title -->
        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom border-secondary border-opacity-25">
            <div>
                <h3 class="fw-bold text-white mb-1">Movie Catalog Management</h3>
                <p class="text-white-50 small mb-0">Add new movies, update download links, media URLs and manage movie library.</p>
            </div>
        </div>

        <!-- Notification Message -->
        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold d-block mb-3"></asp:Label>

        <!-- ADD/EDIT MOVIE FORM CARD -->
        <div class="admin-card">
            <div class="card-header-title">
                <span>Add / Edit Movie Details</span>
            </div>
            
            <asp:HiddenField ID="hfMovieID" runat="server" Value="0" />

            <div class="row g-3">
                <!-- Basic Info -->
                <div class="col-md-6">
                    <label class="form-label">Movie Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="e.g. Oppenheimer"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">IMDb ID / Rating</label>
                    <asp:TextBox ID="txtImdbID" runat="server" CssClass="form-control" placeholder="e.g. tt15398776"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Hollywood" Value="Hollywood"></asp:ListItem>
                        <asp:ListItem Text="Bollywood" Value="Bollywood"></asp:ListItem>
                        <asp:ListItem Text="Web Series" Value="Web Series"></asp:ListItem>
                        <asp:ListItem Text="Anime" Value="Anime"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Quality Tag</label>
                    <asp:DropDownList ID="ddlQuality" runat="server" CssClass="form-select">
                        <asp:ListItem Text="4K Ultra HD" Value="4K Ultra HD"></asp:ListItem>
                        <asp:ListItem Text="1080p Full HD" Value="1080p Full HD"></asp:ListItem>
                        <asp:ListItem Text="720p HD" Value="720p HD"></asp:ListItem>
                        <asp:ListItem Text="480p SD" Value="480p SD"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Director</label>
                    <asp:TextBox ID="txtDirector" runat="server" CssClass="form-control" placeholder="e.g. Christopher Nolan"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Cast</label>
                    <asp:TextBox ID="txtCast" runat="server" CssClass="form-control" placeholder="e.g. Cillian Murphy, Robert Downey Jr."></asp:TextBox>
                </div>

                <!-- Media URLs -->
                <div class="col-md-6">
                    <label class="form-label">Poster Image URL</label>
                    <asp:TextBox ID="txtPosterUrl" runat="server" CssClass="form-control" placeholder="https://image-link.jpg"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Trailer Embed URL (YouTube Embed)</label>
                    <asp:TextBox ID="txtTrailerUrl" runat="server" CssClass="form-control" placeholder="https://www.youtube.com/embed/XXXXXX"></asp:TextBox>
                </div>

                <!-- Screenshots -->
                <div class="col-md-3">
                    <label class="form-label">Screenshot 1 URL</label>
                    <asp:TextBox ID="txtSS1" runat="server" CssClass="form-control" placeholder="https://img1.jpg"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Screenshot 2 URL</label>
                    <asp:TextBox ID="txtSS2" runat="server" CssClass="form-control" placeholder="https://img2.jpg"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Screenshot 3 URL</label>
                    <asp:TextBox ID="txtSS3" runat="server" CssClass="form-control" placeholder="https://img3.jpg"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Screenshot 4 URL</label>
                    <asp:TextBox ID="txtSS4" runat="server" CssClass="form-control" placeholder="https://img4.jpg"></asp:TextBox>
                </div>

                <!-- Download Links -->
                <div class="col-md-6">
                    <label class="form-label">Download Link 1 (Primary Server)</label>
                    <asp:TextBox ID="txtLink1" runat="server" CssClass="form-control" placeholder="https://download-link-1.com"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Download Link 2 (Mirror Server)</label>
                    <asp:TextBox ID="txtLink2" runat="server" CssClass="form-control" placeholder="https://download-link-2.com"></asp:TextBox>
                </div>

                <!-- Description -->
                <div class="col-12">
                    <label class="form-label">Movie Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Write plot summary..."></asp:TextBox>
                </div>

                <!-- Action Buttons -->
                <div class="col-12 mt-4">
                    <asp:Button ID="btnSave" runat="server" Text="Save Movie" CssClass="btn btn-primary-purple me-2" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel / Reset" CssClass="btn btn-secondary-dark" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>

        <!-- MOVIES LIST TABLE CARD -->
        <div class="admin-card">
            <div class="card-header-title">
                <span>Existing Movies Directory</span>
            </div>
            <div class="table-responsive">
                <asp:Repeater ID="rptAdminMovies" runat="server" OnItemCommand="rptAdminMovies_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-dark-custom align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>POSTER</th>
                                    <th>TITLE</th>
                                    <th>CATEGORY</th>
                                    <th>QUALITY</th>
                                    <th class="text-end">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="fw-bold text-white-50">#<%# Eval("MovieID") %></td>
                            <td>
                                <img src='<%# Eval("PosterUrl") %>' width="40" height="52" class="rounded" style="object-fit: cover; border: 1px solid rgba(255,255,255,0.1);" />
                            </td>
                            <td class="fw-semibold text-white"><%# Eval("Title") %></td>
                            <td><span class="badge bg-secondary text-light px-2 py-1"><%# Eval("Category") %></span></td>
                            <td><span class="badge bg-primary px-2 py-1"><%# Eval("QualityTag") %></span></td>
                            <td class="text-end">
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("MovieID") %>' CssClass="action-btn-warning me-1" ToolTip="Edit Movie">
                                    <i class="bi bi-pencil"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("MovieID") %>' CssClass="action-btn-danger" OnClientClick="return confirm('Are you sure you want to delete this movie?');" ToolTip="Delete Movie">
                                    <i class="bi bi-trash"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>

    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>