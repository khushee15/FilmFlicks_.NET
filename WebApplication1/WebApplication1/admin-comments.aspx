<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-comments.aspx.cs" Inherits="WebApplication1.admin_comments" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Messages - Admin</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        body { background-color: #0b0f19; color: #ffffff; }
        .sidebar { background-color: #000000; min-height: 100vh; }
        .card-custom { background-color: #111827; border: 1px solid #1f2937; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar p-3">
                    <h4 class="text-primary fw-bold mb-4"><i class="bi bi-film me-2"></i>FilmFlicks</h4>
                    <ul class="nav nav-pills flex-column gap-2">
                        <li class="nav-item">
                            <a href="admin-dashboard.aspx" class="nav-link text-white"><i class="bi bi-speedometer2 me-2"></i>Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-movies.aspx" class="nav-link text-white"><i class="bi bi-collection-play me-2"></i>Manage Movies</a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-categories.aspx" class="nav-link text-white"><i class="bi bi-tags me-2"></i>Categories</a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-users.aspx" class="nav-link text-white"><i class="bi bi-people me-2"></i>Users</a>
                        </li>
                        <li class="nav-item">
                            <a href="admin-comments.aspx" class="nav-link active"><i class="bi bi-envelope-paper me-2"></i>Contact Messages</a>
                        </li>
                    </ul>
                </div>

                <!-- Main Content Area -->
                <div class="col-md-10 p-4">
                    <h2 class="fw-bold mb-1">Contact Messages & Inquiries</h2>
                    <p class="text-secondary mb-4">View and delete user inquiries sent from the contact page.</p>

                    <div class="card card-custom p-4 rounded-3 shadow-sm">
                        <div class="table-responsive">
                            <asp:GridView ID="gvComments" runat="server" AutoGenerateColumns="False" 
                                CssClass="table table-dark table-striped table-hover align-middle mb-0" 
                                EmptyDataText="No contact messages found in the database." OnRowCommand="gvComments_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="60px" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                    <asp:BoundField DataField="Message" HeaderText="Message" />
                                    <asp:BoundField DataField="CreatedAt" HeaderText="Date & Time" DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" 
                                                CommandName="DeleteMessage" CommandArgument='<%# Eval("Id") %>' 
                                                OnClientClick="return confirm('Are you sure you want to delete this message?');" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>