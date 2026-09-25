<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-comments.aspx.cs" Inherits="WebApplication1.admin_comments" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Messages - FilmFlicks Admin</title>

    <!-- Bootstrap 5 & Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- INTERNAL CUSTOM CSS (Same Theme as Admin Users) -->
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

        /* Action Buttons */
        .btn-delete-custom {
            color: #f87171;
            border: 1px solid rgba(239, 68, 68, 0.3);
            background-color: rgba(239, 68, 68, 0.1);
            padding: 5px 10px;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .btn-delete-custom:hover {
            background-color: #ef4444;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="admin-comments" class="admin-wrapper">

            <!-- SIDEBAR -->
            <nav class="admin-sidebar">
                <a href="admin-dashboard.aspx" class="sidebar-brand">
                    <i class="bi bi-film"></i>
                    <span>FilmFlicks</span>
                </a>

                <ul class="sidebar-menu">
                   <li><a href="admin-webseries.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage webseries</span></a></li>
<li><a href="admin-movies.aspx" ><i class="bi bi-collection-play-fill"></i> <span>Manage Movies</span></a></li>
 <li><a href="admin-Cartoon.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Cartoon</span></a></li>
<li><a href="admin-movierequest.aspx"><i class="bi bi-send-fill"></i> <span>Movie Requests</span></a></li>
<li><a href="admin-users.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
<li><a href="admin-comments.aspx" class="active"><i class="bi bi-chat-left-text-fill"></i> <span>Comments</span></a></li>
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
                        <h3 class="fw-bold text-white mb-1">Contact Messages & Inquiries</h3>
                        <p class="text-white-50 small mb-0">View and delete user inquiries sent from the contact page.</p>
                    </div>
                </div>

                <!-- DATA TABLE CARD -->
                <div class="admin-card">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="fw-bold text-white mb-0">User Messages</h5>
                    </div>

                    <div class="table-responsive">
                        <asp:GridView ID="gvComments" runat="server" AutoGenerateColumns="False" 
                            CssClass="table table-dark-custom align-middle mb-0" 
                            GridLines="None"
                            EmptyDataText="No contact messages found in the database." OnRowCommand="gvComments_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="60px" ItemStyle-CssClass="fw-bold text-white-50" />
                                <asp:BoundField DataField="Name" HeaderText="NAME" ItemStyle-CssClass="fw-semibold text-white" />
                                <asp:BoundField DataField="Email" HeaderText="EMAIL ADDRESS" ItemStyle-CssClass="text-white-50" />
                                <asp:BoundField DataField="Subject" HeaderText="SUBJECT" ItemStyle-CssClass="text-white-50" />
                                <asp:BoundField DataField="Message" HeaderText="MESSAGE" ItemStyle-CssClass="text-white-50" />
                                <asp:BoundField DataField="CreatedAt" HeaderText="DATE & TIME" DataFormatString="{0:dd MMM yyyy, hh:mm tt}" ItemStyle-CssClass="text-white-50" />
                                
                                <asp:TemplateField HeaderText="ACTION" ItemStyle-CssClass="text-end" HeaderStyle-CssClass="text-end">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn-delete-custom text-decoration-none" 
                                            CommandName="DeleteMessage" CommandArgument='<%# Eval("Id") %>' 
                                            OnClientClick="return confirm('Are you sure you want to delete this message?');">
                                            <i class="bi bi-trash-fill"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </main>
        </div>
    </form>
</body>
</html>