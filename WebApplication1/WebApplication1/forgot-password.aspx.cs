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
    public partial class forgot_password : System.Web.UI.Page
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
        protected void btnReset_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(floatingResetEmail.Text))
            {
                lblResetFeedback.Text = "Please enter your registered Email address!";
                lblResetFeedback.CssClass = "d-block mb-3 text-center fw-semibold text-danger";
            }
            else
            {
                getcon();

                string query = "SELECT Password, Username FROM users_tbl WHERE Email = @Email";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", floatingResetEmail.Text.Trim());

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    string userPass = dr["Password"].ToString();
                    string userName = dr["Username"].ToString();

                    lblResetFeedback.Text = $"Hello {userName}, your Password is: <strong>{userPass}</strong>";
                    lblResetFeedback.CssClass = "d-block mb-3 text-center fw-semibold text-success";

                    floatingResetEmail.Text = "";
                }
                else
                {
                    lblResetFeedback.Text = "Email address not found! Please check or register first.";
                    lblResetFeedback.CssClass = "d-block mb-3 text-center fw-semibold text-danger";
                }

                dr.Close();
                con.Close();
            }
        }
        
    }
}