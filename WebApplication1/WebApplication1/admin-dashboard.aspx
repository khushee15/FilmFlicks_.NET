<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin-dashboard.aspx.cs" Inherits="WebApplication1.admin_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - FilmFlicks</title>
  
  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  
  <!-- Custom CSS Files -->
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/admin-dashboard.css">
</head>
<body class="bg-dark">

  <!-- ==========================================================================
       ADMIN DASHBOARD CONTAINER (#admin-dashboard)
       ========================================================================== -->
  <div id="admin-dashboard" class="admin-wrapper">

    <!-- SIDEBAR -->
    <nav class="admin-sidebar">
      <a href="admin-dashboard.html" class="sidebar-brand">
        <i class="bi bi-film"></i>
        <span>FilmFlicks</span>
      </a>

      <ul class="sidebar-menu">
        <li><a href="admin-dashboard.aspx" class="active"><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
        <li><a href="admin-movies.aspx"><i class="bi bi-collection-play-fill"></i> <span>Manage Movies</span></a></li>
        <li><a href="admin-movierequest.aspx"><i class="bi bi-send-fill"></i> <span>Movierequest</span></a></li>
        <li><a href="admin-users.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
        <li><a href="admin-comments.aspx"><i class="bi bi-graph-up-arrow"></i> <span>Comments</span></a></li>
        <li><a href="admin-settings.aspx"><i class="bi bi-gear-fill"></i> <span>Settings</span></a></li>
      </ul>

      <div class="pt-3 border-top border-secondary border-opacity-25">
        <a href="admin-login.aspx" class="text-danger d-flex align-items-center gap-2 p-2 text-decoration-none fw-semibold rounded-3 hover-bg-danger">
          <i class="bi bi-box-arrow-left"></i> <span>Logout</span>
        </a>
      </div>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!-- MAIN CONTENT AREA -->
 <main class="admin-main-content">
   
   <!-- Top Header Bar -->
   <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom border-secondary border-opacity-25">
     <div>
       <h3 class="fw-bold text-white mb-1">Dashboard Overview</h3>
       <p class="text-white-50 small mb-0">Welcome back, Master Admin! Here is what's happening today.</p>
     </div>
     <div class="d-flex align-items-center gap-3">
       <div class="dropdown">
         <button class="btn btn-outline-light btn-sm dropdown-toggle d-flex align-items-center gap-2" type="button" data-bs-toggle="dropdown">
           <i class="bi bi-person-circle text-danger"></i> Admin
         </button>
         <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
           <li><a class="dropdown-item" href="#">Profile Settings</a></li>
           <li><hr class="dropdown-divider"></li>
           <li><a class="dropdown-item text-danger" href="admin-login.aspx">Log Out</a></li>
         </ul>
       </div>
     </div>
   </div>

   <!-- ==========================================================================
        4 METRIC STAT CARDS
        ========================================================================== -->
   <div class="row g-4 mb-4">
     
     <!-- Card 1: Total Users -->
     <div class="col-12 col-sm-6 col-xl-3">
       <div class="stat-card-admin">
         <div class="d-flex justify-content-between align-items-center">
           <div>
             <div class="stat-label">Total Users</div>
             <div class="stat-value">12,450</div>
           </div>
           <div class="stat-icon-box">
             <i class="bi bi-people-fill"></i>
           </div>
         </div>
         <div class="mt-3 text-success small fw-semibold">
           <i class="bi bi-arrow-up-right me-1"></i>+12% this month
         </div>
       </div>
     </div>

     <!-- Card 2: Total Movies -->
     <div class="col-12 col-sm-6 col-xl-3">
       <div class="stat-card-admin">
         <div class="d-flex justify-content-between align-items-center">
           <div>
             <div class="stat-label">Total Movies</div>
             <div class="stat-value">3,820</div>
           </div>
           <div class="stat-icon-box" style="background: rgba(139, 92, 246, 0.15); color: var(--accent-purple);">
             <i class="bi bi-film"></i>
           </div>
         </div>
         <div class="mt-3 text-success small fw-semibold">
           <i class="bi bi-arrow-up-right me-1"></i>+48 added today
         </div>
       </div>
     </div>

     <!-- Card 3: Daily Downloads -->
     <div class="col-12 col-sm-6 col-xl-3">
       <div class="stat-card-admin">
         <div class="d-flex justify-content-between align-items-center">
           <div>
             <div class="stat-label">Daily Downloads</div>
             <div class="stat-value">45,210</div>
           </div>
           <div class="stat-icon-box" style="background: rgba(59, 130, 246, 0.15); color: #3b82f6;">
             <i class="bi bi-download"></i>
           </div>
         </div>
         <div class="mt-3 text-success small fw-semibold">
           <i class="bi bi-arrow-up-right me-1"></i>+8.4% vs yesterday
         </div>
       </div>
     </div>

     <!-- Card 4: Total Revenue -->
     <div class="col-12 col-sm-6 col-xl-3">
       <div class="stat-card-admin">
         <div class="d-flex justify-content-between align-items-center">
           <div>
             <div class="stat-label">Total Revenue</div>
             <div class="stat-value">$14,250</div>
           </div>
           <div class="stat-icon-box" style="background: rgba(16, 185, 129, 0.15); color: #10b981;">
             <i class="bi bi-currency-dollar"></i>
           </div>
         </div>
         <div class="mt-3 text-success small fw-semibold">
           <i class="bi bi-arrow-up-right me-1"></i>+15.2% target met
         </div>
       </div>
     </div>

   </div>

   <!-- ==========================================================================
        TABLES SECTION
        ========================================================================== -->
   <div class="row g-4">
     
     <!-- Left: Recent Uploads Table -->
     <div class="col-12 col-lg-7">
       <div class="admin-card">
         <div class="d-flex justify-content-between align-items-center mb-3">
           <h5 class="fw-bold text-white mb-0">Recent Uploads</h5>
           <a href="admin-dashboard.aspx" class="text-decoration-none text-danger small fw-semibold">View All</a>
         </div>

         <div class="table-responsive">
           <table class="table table-dark-custom align-middle mb-0">
             <thead>
               <tr>
                 <th>Movie Title</th>
                 <th>Category</th>
                 <th>Quality</th>
                 <th>Date</th>
                 <th class="text-end">Action</th>
               </tr>
             </thead>
             <tbody>
               <tr>
                 <td>
                   <div class="fw-semibold text-white">Avengers: Endgame</div>
                   <small class="text-white-50">Hindi Dual Audio</small>
                 </td>
                 <td><span class="badge bg-danger-subtle text-danger border border-danger-subtle">Movie</span></td>
                 <td><span class="text-warning small fw-bold">4K UHD</span></td>
                 <td class="text-white-50 small">Today, 2:40 PM</td>
                 <td class="text-end">
                   <button class="btn btn-sm btn-outline-light py-1 px-2"><i class="bi bi-pencil-fill"></i></button>
                   <button class="btn btn-sm btn-outline-danger py-1 px-2"><i class="bi bi-trash-fill"></i></button>
                 </td>
               </tr>
               <tr>
                 <td>
                   <div class="fw-semibold text-white">Stranger Things S04</div>
                   <small class="text-white-50">Complete Season</small>
                 </td>
                 <td><span class="badge bg-purple-subtle text-info border border-info-subtle">Web Series</span></td>
                 <td><span class="text-info small fw-bold">1080p FHD</span></td>
                 <td class="text-white-50 small">Yesterday</td>
                 <td class="text-end">
                   <button class="btn btn-sm btn-outline-light py-1 px-2"><i class="bi bi-pencil-fill"></i></button>
                   <button class="btn btn-sm btn-outline-danger py-1 px-2"><i class="bi bi-trash-fill"></i></button>
                 </td>
               </tr>
               <tr>
                 <td>
                   <div class="fw-semibold text-white">Jawan</div>
                   <small class="text-white-50">Original Hindi</small>
                 </td>
                 <td><span class="badge bg-danger-subtle text-danger border border-danger-subtle">Movie</span></td>
                 <td><span class="text-warning small fw-bold">4K UHD</span></td>
                 <td class="text-white-50 small">12 Aug 2026</td>
                 <td class="text-end">
                   <button class="btn btn-sm btn-outline-light py-1 px-2"><i class="bi bi-pencil-fill"></i></button>
                   <button class="btn btn-sm btn-outline-danger py-1 px-2"><i class="bi bi-trash-fill"></i></button>
                 </td>
               </tr>
             </tbody>
           </table>
         </div>
       </div>
     </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
            <!-- Right: Top Downloaded Movies List -->
        <div class="col-12 col-lg-5">
          <div class="admin-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
              <h5 class="fw-bold text-white mb-0">Top Downloaded Movies</h5>
              <span class="badge bg-secondary">This Week</span>
            </div>

            <div class="d-flex flex-column gap-3">
              
              <!-- Item 1 -->
              <div class="d-flex align-items-center justify-content-between p-2 rounded-3 bg-dark bg-opacity-50 border border-secondary border-opacity-25">
                <div class="d-flex align-items-center gap-3">
                  <span class="badge bg-danger rounded-circle p-2 fw-bold" style="width: 28px; height: 28px; display: flex; align-items: center; justify-content: center;">1</span>
                  <div>
                    <h6 class="text-white mb-0 fw-semibold">Interstellar</h6>
                    <small class="text-white-50">Sci-Fi / Adventure</small>
                  </div>
                </div>
                <div class="text-end">
                  <div class="text-success fw-bold small">14.2K DLs</div>
                  <small class="text-warning"><i class="bi bi-star-fill"></i> 4.9</small>
                </div>
              </div>

              <!-- Item 2 -->
              <div class="d-flex align-items-center justify-content-between p-2 rounded-3 bg-dark bg-opacity-50 border border-secondary border-opacity-25">
                <div class="d-flex align-items-center gap-3">
                  <span class="badge bg-secondary rounded-circle p-2 fw-bold" style="width: 28px; height: 28px; display: flex; align-items: center; justify-content: center;">2</span>
                  <div>
                    <h6 class="text-white mb-0 fw-semibold">The Dark Knight</h6>
                    <small class="text-white-50">Action / Thriller</small>
                  </div>
                </div>
                <div class="text-end">
                  <div class="text-success fw-bold small">11.8K DLs</div>
                  <small class="text-warning"><i class="bi bi-star-fill"></i> 4.8</small>
                </div>
              </div>

              <!-- Item 3 -->
              <div class="d-flex align-items-center justify-content-between p-2 rounded-3 bg-dark bg-opacity-50 border border-secondary border-opacity-25">
                <div class="d-flex align-items-center gap-3">
                  <span class="badge bg-secondary rounded-circle p-2 fw-bold" style="width: 28px; height: 28px; display: flex; align-items: center; justify-content: center;">3</span>
                  <div>
                    <h6 class="text-white mb-0 fw-semibold">Avatar: The Way of Water</h6>
                    <small class="text-white-50">Sci-Fi / Fantasy</small>
                  </div>
                </div>
                <div class="text-end">
                  <div class="text-success fw-bold small">9.5K DLs</div>
                  <small class="text-warning"><i class="bi bi-star-fill"></i> 4.7</small>
                </div>
              </div>

              <!-- Item 4 -->
              <div class="d-flex align-items-center justify-content-between p-2 rounded-3 bg-dark bg-opacity-50 border border-secondary border-opacity-25">
                <div class="d-flex align-items-center gap-3">
                  <span class="badge bg-secondary rounded-circle p-2 fw-bold" style="width: 28px; height: 28px; display: flex; align-items: center; justify-content: center;">4</span>
                  <div>
                    <h6 class="text-white mb-0 fw-semibold">Pushpa 2: The Rule</h6>
                    <small class="text-white-50">Action / Drama</small>
                  </div>
                </div>
                <div class="text-end">
                  <div class="text-success fw-bold small">8.1K DLs</div>
                  <small class="text-warning"><i class="bi bi-star-fill"></i> 4.6</small>
                </div>
              </div>

            </div>
          </div>
        </div>

      </div>

    </main>

  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>
</asp:Content>
