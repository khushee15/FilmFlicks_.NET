using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adminUsername_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string username = adminUsername.Text.Trim();
            string key = masterKey.Text.Trim();

            if (username == "admin" && key == "admin123")
            {
            
                Session["AdminUser"] = username;

                Response.Redirect("admin-webseries.aspx");
            }
            else
            {
                lblError.Text = "Invalid Admin Credentials or Master Key!";
            }
        }
    }
}