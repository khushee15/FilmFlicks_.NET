<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-login.aspx.cs" Inherits="WebApplication1.admin_login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Authorization - FilmFlicks</title>
    
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/admin-login.css" />
</head>
<body class="bg-dark">
    <form id="form1" runat="server">
        <div id="admin-login" class="admin-login-wrapper bg-dark">
            <!-- High-Contrast Security Card -->
            <div class="security-card">
                
                <!-- Security Badge Header -->
                <div class="text-center mb-4">
                    <div class="security-badge">
                        <i class="bi bi-shield-lock-fill"></i>
                    </div>
                    <h4 class="fw-bold text-white mb-1">Admin Portal</h4>
                    <p class="text-white-50 small mb-0">Authorized Personnel Only</p>
                </div>

                <!-- Error Message Label -->
                <asp:Label ID="lblError" runat="server" CssClass="text-danger small d-block mb-3 text-center fw-bold" EnableViewState="false"></asp:Label>

                <!-- Field 1: Admin Username -->
                <div class="mb-4">
                    <label for="adminUsername" class="form-label text-white">Admin Username</label>
                    <div class="input-icon-wrapper">
                        <asp:TextBox ID="adminUsername" runat="server" CssClass="form-control" Placeholder="Enter admin username" AutoCompleteType="Disabled" Required="true"></asp:TextBox>
                        <i class="bi bi-person-badge-fill"></i>
                    </div>
                </div>

                <!-- Field 2: Master Key Authorization Code -->
                <div class="mb-4">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <label for="masterKey" class="form-label mb-0 text-white">Master Key Authorization</label>
                        <span class="badge bg-danger-subtle text-danger border border-danger-subtle rounded-pill small" style="font-size: 0.7rem;">Secured</span>
                    </div>
                    <div class="input-icon-wrapper">
                        <asp:TextBox ID="masterKey" runat="server" CssClass="form-control master-key-input" TextMode="Password" Placeholder="••••••••••••" Required="true"></asp:TextBox>
                        <i class="bi bi-key-fill"></i>
                    </div>
                </div>

                <!-- Submit Action Button -->
                <div class="d-grid mt-4">
                    <asp:LinkButton ID="btnAdminLogin" runat="server" CssClass="btn btn-admin-login btn-danger" OnClick="btnAdminLogin_Click">
                        <i class="bi bi-unlock-fill me-2"></i>Authorize Access
                    </asp:LinkButton>
                </div>

                <!-- Security Notice Footer -->
                <div class="mt-4 pt-3 border-top border-secondary border-opacity-25 text-center">
                    <a href="index.aspx" class="text-white-50 text-decoration-none small hover-white">
                        <i class="bi bi-arrow-left me-1"></i> Return to Main Website
                    </a>
                </div>

            </div>
        </div>
    </form>
</body>
</html>