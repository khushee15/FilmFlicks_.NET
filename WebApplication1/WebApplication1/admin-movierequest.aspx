<%@ Page Title="Movie Requests - Admin" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin-movierequest.aspx.cs" Inherits="WebApplication1.admin_movierequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        body { background-color: #12151e !important; color: #fff; font-family: 'Segoe UI', sans-serif; margin: 0; }
        .admin-sidebar { width: 260px; background-color: #161925; padding: 20px 15px; display: flex; flex-direction: column; border-right: 1px solid rgba(255, 255, 255, 0.05); position: fixed; top: 0; bottom: 0; left: 0; z-index: 1000; }
        .sidebar-brand { font-size: 1.5rem; font-weight: 700; color: #6366f1; text-decoration: none; display: flex; align-items: center; gap: 10px; margin-bottom: 30px; padding-left: 10px; }
        .sidebar-menu { list-style: none; padding: 0; margin: 0; flex-grow: 1; }
        .sidebar-menu a { display: flex; align-items: center; gap: 12px; padding: 12px 15px; color: #94a3b8; text-decoration: none; border-radius: 8px; font-weight: 500; transition: all 0.3s ease; margin-bottom: 8px; }
        .sidebar-menu a:hover, .sidebar-menu a.active { background-color: rgba(99, 102, 241, 0.15); color: #ffffff; }
       
        .admin-main-content { margin-left: 260px; padding: 30px; background-color: #12151e; min-height: 100vh; }
        .admin-card { background-color: #1a1d2d; border-radius: 12px; padding: 24px; box-shadow: 0 4px 20px rgba(0,0,0,0.2); border: 1px solid rgba(255, 255, 255, 0.05); margin-bottom: 30px; }
        .card-header-title { font-size: 1.15rem; font-weight: 600; color: #ffffff; margin-bottom: 20px; }
       
        .table-dark-custom { --bs-table-bg: transparent; --bs-table-color: #cbd5e1; border-color: rgba(255, 255, 255, 0.05); }
        .table-dark-custom th { color: #64748b; font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.8px; border-bottom: 1px solid rgba(255, 255, 255, 0.08); padding-bottom: 15px; }
        .table-dark-custom td { padding: 16px 12px; border-bottom: 1px solid rgba(255, 255, 255, 0.05); vertical-align: middle; }
       
        .action-btn { width: 34px; height: 34px; border-radius: 8px; display: inline-flex; align-items: center; justify-content: center; transition: all 0.2s ease; text-decoration: none; margin-right: 5px; }
        .action-btn-success { background-color: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2); }
        .action-btn-success:hover { background-color: #10b981; color: #ffffff; }
        .action-btn-danger { background-color: rgba(239, 68, 68, 0.1); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.2); }
        .action-btn-danger:hover { background-color: #ef4444; color: #ffffff; }

        @media (max-width: 768px) {
            .admin-sidebar { display: none; }
            .admin-main-content { margin-left: 0; padding: 15px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="admin-sidebar">
        <a href="admin-dashboard.aspx" class="sidebar-brand">
            <i class="bi bi-film"></i>
            <span>FilmFlicks</span>
        </a>
        <ul class="sidebar-menu">
     <li><a href="admin-dashboard.aspx"><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
     <li><a href="admin-movies.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Movies</span></a></li>
     <li><a href="admin-movierequest.aspx" class="active"><i class="bi bi-send-fill"></i> <span>Movierequest</span></a></li>
     <li><a href="admin-users.aspx" ><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
     <li><a href="admin-comments.aspx"><i class="bi bi-graph-up-arrow"></i> <span>Comments</span></a></li>
     <li><a href="admin-settings.aspx"><i class="bi bi-gear-fill"></i> <span>Settings</span></a></li>
 </ul>
        <div class="pt-3 border-top border-secondary border-opacity-25 mt-auto">
            <a href="index.aspx" class="text-danger d-flex align-items-center gap-2 p-2 text-decoration-none fw-semibold">
                <i class="bi bi-box-arrow-left"></i> <span>Logout</span>
            </a>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="admin-main-content">
       
        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom border-secondary border-opacity-25">
            <div>
                <h3 class="fw-bold text-white mb-1">User Movie Requests</h3>
                <p class="text-white-50 small mb-0">Manage and approve movie requests submitted by users.</p>
            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>

        <div class="admin-card">
            <div class="card-header-title">Submitted Movie Requests</div>
           
            <div class="table-responsive">
                <asp:Repeater ID="rptRequests" runat="server" OnItemCommand="rptRequests_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-dark-custom align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>TITLE</th>
                                    <th>TYPE / YEAR</th>
                                    <th>LANGUAGE</th>
                                    <th>QUALITY</th>
                                    <th>DATE</th>
                                    <th>STATUS</th>
                                    <th class="text-end">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="text-white-50">#<%# Eval("RequestId") %></td>
                            <td class="fw-semibold text-white">
                                <%# Eval("Title") %>
                                <div class="text-white-50 small text-truncate" style="max-width: 200px;" title='<%# Eval("AdditionalDetails") %>'>
                                    <%# Eval("AdditionalDetails") %>
                                </div>
                            </td>
                            <td>
                                <span class="badge bg-secondary"><%# Eval("ContentType") %></span>
                                <span class="text-white-50 small ms-1">(<%# Eval("ReleaseYear") %>)</span>
                            </td>
                            <td><%# Eval("PreferredLanguage") %></td>
                            <td><%# Eval("PreferredQuality") %></td>
                            <td class="small text-white-50"><%# Eval("RequestDate", "{0:dd MMM yyyy}") %></td>
                            <td>
                                <span class='badge <%# Eval("Status").ToString() == "Approved" ? "bg-success" : "bg-warning text-dark" %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td class="text-end">
                                <asp:LinkButton ID="btnApprove" runat="server" CommandName="Approve" CommandArgument='<%# Eval("RequestId") %>'
                                    CssClass="action-btn action-btn-success" ToolTip="Approve Request"
                                    Visible='<%# Eval("Status").ToString() == "Pending" %>'>
                                    <i class="bi bi-check-lg"></i>
                                </asp:LinkButton>
                               
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteReq" CommandArgument='<%# Eval("RequestId") %>'
                                    CssClass="action-btn action-btn-danger" ToolTip="Delete Request"
                                    OnClientClick="return confirm('Are you sure you want to delete this request?');">
                                    <i class="bi bi-trash"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                        <asp:Label ID="lblEmpty" runat="server" Visible='<%# rptRequests.Items.Count == 0 %>'
                                   Text="No movie requests found." CssClass="text-center text-white-50 d-block py-3"></asp:Label>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </main>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>