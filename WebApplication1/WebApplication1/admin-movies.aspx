<%@ Page Title="Manage Movies - FilmFlicks Admin" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin-movies.aspx.cs" Inherits="WebApplication1.admin_movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Admin Dashboard Matching UI CSS -->
<style>
    :root {
        --sidebar-width: 250px;
        --bg-dark: #0a0e17;
        --card-bg: #111625;
        --input-bg: #181f32;
        --border-color: #232d42;
        --accent-purple: #6366f1;
        --accent-purple-active: #4f46e5;
        --text-muted: #8e9bb0;
        --text-light: #f1f5f9;
    }

    body {
        background-color: var(--bg-dark) !important;
        color: var(--text-light) !important;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        margin-right: -12px;
        margin-left: -12px;
    }

    .row > [class*="col-"] {
        padding-right: 12px;
        padding-left: 12px;
        box-sizing: border-box;
    }

    /* Column Widths */
    .col-12 { flex: 0 0 100%; max-width: 100%; }
    @media (min-width: 768px) {
        .col-md-3 { flex: 0 0 25%; max-width: 25%; }
        .col-md-4 { flex: 0 0 33.333333%; max-width: 33.333333%; }
        .col-md-6 { flex: 0 0 50%; max-width: 50%; }
    }

    .g-3 { margin-top: -12px; }
    .g-3 > [class*="col-"] { margin-top: 12px; }

    /* Sidebar Styling */
    .admin-sidebar {
        width: var(--sidebar-width);
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #0d121d;
        border-right: 1px solid var(--border-color);
        padding: 24px 16px;
        z-index: 1000;
        display: flex;
        flex-direction: column;
        box-sizing: border-box;
    }

    .admin-sidebar .brand-title {
        font-size: 1.35rem;
        font-weight: 700;
        color: #6366f1;
        display: flex;
        align-items: center;
        gap: 10px;
        padding-bottom: 24px;
        border-bottom: 1px solid var(--border-color);
        margin-bottom: 20px;
    }

    .admin-sidebar .nav-list {
        list-style: none;
        padding: 0;
        margin: 0;
        flex-grow: 1;
    }

    .admin-sidebar .nav-link-item {
        color: var(--text-muted);
        padding: 12px 16px;
        display: flex;
        align-items: center;
        gap: 14px;
        font-weight: 500;
        font-size: 0.95rem;
        border-radius: 8px;
        transition: all 0.2s ease;
        text-decoration: none;
        margin-bottom: 6px;
    }

    .admin-sidebar .nav-link-item:hover {
        color: #ffffff;
        background-color: rgba(255, 255, 255, 0.05);
    }

    .admin-sidebar .nav-link-item.active {
        color: #ffffff;
        background-color: #242848;
        border-left: 3px solid #6366f1;
    }

    .admin-sidebar .logout-link {
        color: #ef4444;
        margin-top: auto;
    }

    /* Main Content Wrapper */
    .admin-content {
        margin-left: var(--sidebar-width);
        padding: 35px 40px;
        min-height: 100vh;
        background-color: var(--bg-dark);
        box-sizing: border-box;
    }

    /* Page Title */
    .page-header {
        margin-bottom: 30px;
    }

    .page-header h2 {
        font-size: 1.65rem;
        font-weight: 700;
        color: #ffffff;
        margin: 0 0 6px 0;
    }

    .page-header p {
        color: var(--text-muted);
        font-size: 0.9rem;
        margin: 0;
    }

    /* Card Container Styling */
    .admin-card {
        background: var(--card-bg);
        border: 1px solid var(--border-color);
        border-radius: 12px;
        padding: 28px;
        margin-bottom: 32px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
    }

    .card-header-title {
        font-size: 1.15rem;
        font-weight: 600;
        color: #ffffff;
        margin-bottom: 24px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    /* Perfect Form Controls */
    .form-label {
        color: #cbd5e1;
        font-size: 0.85rem;
        font-weight: 600;
        margin-bottom: 8px;
        display: block;
    }

    .form-control, .form-select {
        width: 100%;
        background-color: var(--input-bg) !important;
        border: 1px solid var(--border-color) !important;
        color: #ffffff !important;
        border-radius: 8px;
        padding: 10px 14px;
        font-size: 0.9rem;
        transition: all 0.2s ease;
        box-sizing: border-box;
    }

    .form-select {
        cursor: pointer;
        appearance: none;
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%3c8e9bb0' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 12px center;
        background-size: 16px 12px;
        padding-right: 36px;
    }

    .form-control::placeholder {
        color: #475569;
    }

    .form-control:focus, .form-select:focus {
        border-color: var(--accent-purple) !important;
        box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2) !important;
        outline: none;
    }

    /* Custom Buttons */
    .btn-primary-purple {
        background-color: var(--accent-purple);
        color: #ffffff;
        border: none;
        padding: 11px 24px;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.9rem;
        cursor: pointer;
        transition: background 0.2s ease;
    }

    .btn-primary-purple:hover {
        background-color: var(--accent-purple-active);
        color: #ffffff;
    }

    .btn-secondary-dark {
        background-color: #1e293b;
        color: #94a3b8;
        border: 1px solid var(--border-color);
        padding: 11px 20px;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.9rem;
        cursor: pointer;
    }

    .btn-secondary-dark:hover {
        background-color: #334155;
        color: #ffffff;
    }

    /* Table Styling */
    .table-responsive {
        width: 100%;
        overflow-x: auto;
    }

    .admin-table {
        width: 100%;
        color: #f8fafc;
        border-collapse: separate;
        border-spacing: 0;
    }

    .admin-table thead th {
        background-color: rgba(255, 255, 255, 0.02);
        color: var(--text-muted);
        border-bottom: 1px solid var(--border-color);
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.8px;
        padding: 14px 16px;
        text-align: left;
    }

    .admin-table tbody td {
        border-bottom: 1px solid var(--border-color);
        vertical-align: middle;
        padding: 16px;
        font-size: 0.9rem;
    }

    .admin-table tbody tr:hover {
        background-color: rgba(255, 255, 255, 0.02);
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
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Left Sidebar Dashboard Navigation -->
    <div class="admin-sidebar d-none d-md-flex">
        <div class="brand-title">
            <i class="bi bi-grid-fill"></i> FilmFlicks
        </div>
        <ul class="nav-list">
            <li>
                <a href="admin-dashboard.aspx" class="nav-link-item">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="admin-movies.aspx" class="nav-link-item active">
                    <i class="bi bi-collection-play"></i> Manage Movies
                </a>
            </li>
            <li>
                <a href="admin-categories.aspx" class="nav-link-item">
                    <i class="bi bi-tags"></i> Categories
                </a>
            </li>
            <li>
                <a href="admin-users.aspx" class="nav-link-item">
                    <i class="bi bi-people"></i> Users
                </a>
            </li>
            <li>
                <a href="admin-comments.aspx" class="nav-link-item">
                    <i class="bi bi-chat-left-text"></i> Comments
                </a>
            </li>
            <li>
                <a href="admin-settings.aspx" class="nav-link-item">
                    <i class="bi bi-gear"></i> Settings
                </a>
            </li>
        </ul>
        <a href="index.aspx" class="nav-link-item logout-link">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Main Right Panel Content -->
    <div class="admin-content">
        
        <!-- Header Title -->
        <div class="page-header">
            <h2>Movie Catalog Management</h2>
            <p>Add new movies, update download links, media URLs and manage movie library.</p>
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
                        <table class="table admin-table align-middle mb-0">
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
                            <td>#<%# Eval("MovieID") %></td>
                            <td>
                                <img src='<%# Eval("PosterUrl") %>' width="40" height="52" class="rounded" style="object-fit: cover; border: 1px solid var(--border-color);" />
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

    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>