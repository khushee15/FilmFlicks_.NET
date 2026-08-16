<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-users.aspx.cs" Inherits="WebApplication1.admin_users" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - FilmFlicks Admin</title>

    <!-- Bootstrap 5 & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- INTERNAL CUSTOM CSS -->
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
            padding: 30px;
            background-color: #12151e;
        }

        .admin-card {
            background-color: #1a1d2d;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            border: 1px solid rgba(255, 255, 255, 0.05);
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

        /* User Avatar Circle */
        .user-avatar-circle {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #ec4899, #8b5cf6);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 0.9rem;
        }

        /* Badge Custom */
        .badge-total-users {
            background-color: rgba(239, 68, 68, 0.15);
            color: #f87171;
            border: 1px solid rgba(239, 68, 68, 0.3);
            font-weight: 600;
            padding: 6px 14px;
            border-radius: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="admin-users" class="admin-wrapper">

            <!-- SIDEBAR -->
            <nav class="admin-sidebar">
                <a href="admin-dashboard.aspx" class="sidebar-brand">
                    <i class="bi bi-film"></i>
                    <span>FilmFlicks</span>
                </a>

                <ul class="sidebar-menu">
                    <li><a href="admin-dashboard.aspx"><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
                    <li><a href="admin-movies.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Movies</span></a></li>
                    <li><a href="admin-categories.aspx"><i class="bi bi-send-fill"></i> <span>Categories</span></a></li>
                    <li><a href="admin-users.aspx" class="active"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
                    <li><a href="admin-comments.aspx"><i class="bi bi-graph-up-arrow"></i> <span>Comments</span></a></li>
                    <li><a href="admin-settings.aspx"><i class="bi bi-gear-fill"></i> <span>Settings</span></a></li>
                </ul>

                <div class="pt-3 border-top border-secondary border-opacity-25 mt-auto">
                    <a href="admin-login.aspx" class="text-danger d-flex align-items-center gap-2 p-2 text-decoration-none fw-semibold rounded-3">
                        <i class="bi bi-box-arrow-left"></i> <span>Logout</span>
                    </a>
                </div>
            </nav>

            <!-- MAIN CONTENT AREA -->
            <main class="admin-main-content">
                
                <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom border-secondary border-opacity-25">
                    <div>
                        <h3 class="fw-bold text-white mb-1">User Account Management</h3>
                        <p class="text-white-50 small mb-0">Manage registered users and remove accounts.</p>
                    </div>
                    <div class="d-flex gap-2">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm bg-dark text-white border-secondary" placeholder="Search user..." Style="width: 220px;" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    </div>
                </div>

                <!-- DATA TABLE CARD -->
                <div class="admin-card">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="fw-bold text-white mb-0">Registered Users Directory</h5>
                        <asp:Label ID="lblTotalUsers" runat="server" CssClass="badge badge-total-users"></asp:Label>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-dark-custom align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>USER PROFILE</th>
                                    <th>EMAIL ADDRESS</th>
                                    <th>JOINED DATE</th>
                                    <th class="text-end">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center gap-3">
                                                    <div class="user-avatar-circle" style='<%# GetAvatarStyle(Container.ItemIndex) %>'>
                                                        <%# GetInitials(Eval("FullName").ToString()) %>
                                                    </div>
                                                    <div>
                                                        <div class="fw-bold text-white"><%# Eval("FullName") %></div>
                                                        <small class="text-white-50">ID: #USR-<%# Eval("UserId") %></small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-white-50"><%# Eval("Email") %></td>
                                            <td class="text-white-50">
                                                <%# Eval("CreatedDate") != DBNull.Value ? Convert.ToDateTime(Eval("CreatedDate")).ToString("dd MMM yyyy") : "14 Jan 2026" %>
                                            </td>
                                            <td class="text-end">
                                                <!-- DELETE BUTTON -->
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_delete" CommandArgument='<%# Eval("UserId") %>' CssClass="btn btn-sm btn-outline-danger py-1 px-2" Title="Delete User" OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                                    <i class="bi bi-trash-fill"></i>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>
    </form>
</body>
</html>