using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["msg"] == "login_please")
                {
                    lblLoginFeedback.Text = "Login please! You need to be logged in to continue.";
                    lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-warning";
                }
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void clear()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            chkRemember.Checked = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                lblLoginFeedback.Text = "Please enter Username or Email!";
                lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-danger";
            }
            else if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblLoginFeedback.Text = "Please enter Password!";
                lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-danger";
            }
            else
            {
                getcon();

                string inputUser = txtUsername.Text.Trim();
                string inputPass = txtPassword.Text.Trim();

                string query = "SELECT * FROM users_tbl WHERE (Username = @username OR Email = @email) AND Password = @password";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", inputUser);
                cmd.Parameters.AddWithValue("@email", inputUser);
                cmd.Parameters.AddWithValue("@password", inputPass);

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();

                    Session["UserId"] = dr["UserId"].ToString();
                    Session["username"] = dr["Username"].ToString();
                    Session["UserEmail"] = dr["Email"].ToString();
                    Session["FullName"] = dr["FullName"] != DBNull.Value && !string.IsNullOrWhiteSpace(dr["FullName"].ToString())
                        ? dr["FullName"].ToString()
                        : dr["Username"].ToString();

                    if (dr["ImagePath"] != DBNull.Value && !string.IsNullOrEmpty(dr["ImagePath"].ToString()))
                    {
                        Session["UserProfilePic"] = dr["ImagePath"].ToString();
                    }

                    lblLoginFeedback.Text = "Login Successful! Redirecting...";
                    lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-success";

                    clear();

                    dr.Close();
                    con.Close();

                    Response.Redirect("myprofile.aspx");
                }
                else
                {
                    lblLoginFeedback.Text = "Invalid Username/Email or Password! Please register first if you haven't.";
                    lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-danger";

                    dr.Close();
                    con.Close();
                }
            }
        }
    }
}
