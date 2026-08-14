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
            // Validation: Check if fields are empty
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

            
                string query = "SELECT * FROM users_tbl WHERE (Username = @User OR Email = @User) AND Password = @Password";
                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@User", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();

              
                    Session["username"] = dr["Username"].ToString();
                    Session["email"] = dr["Email"].ToString();

                    lblLoginFeedback.Text = "Login Successful! Redirecting...";
                    lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-success";

                    clear();

                 
                    Response.Redirect("index.aspx");
                }
                else
                {
               
                    lblLoginFeedback.Text = "Invalid Username/Email or Password! Please register first if you haven't.";
                    lblLoginFeedback.CssClass = "d-block mt-3 text-center fw-semibold text-danger";
                }

                dr.Close();
                con.Close();
            }
        }
    }
}