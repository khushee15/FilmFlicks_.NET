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
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
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
            floatingName.Text = "";
            floatingUsername.Text = "";
            floatingEmail.Text = "";
            floatingPassword.Text = "";
            floatingConfirmPassword.Text = "";
            termsCheck.Checked = false;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(floatingName.Text))
            {
                lblRegisterFeedback.Text = "Please enter Full Name!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else if (string.IsNullOrWhiteSpace(floatingUsername.Text))
            {
                lblRegisterFeedback.Text = "Please enter Username!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else if (string.IsNullOrWhiteSpace(floatingEmail.Text))
            {
                lblRegisterFeedback.Text = "Please enter Email Address!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else if (string.IsNullOrWhiteSpace(floatingPassword.Text))
            {
                lblRegisterFeedback.Text = "Please enter Password!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else if (string.IsNullOrWhiteSpace(floatingConfirmPassword.Text))
            {
                lblRegisterFeedback.Text = "Please confirm your Password!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else if (floatingPassword.Text != floatingConfirmPassword.Text)
            {
                lblRegisterFeedback.Text = "Password and Confirm Password do not match!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else if (!termsCheck.Checked)
            {
                lblRegisterFeedback.Text = "Please accept the Terms of Service & Privacy Policy!";
                lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
            }
            else
            {
                getcon();

                da = new SqlDataAdapter("SELECT * FROM users_tbl WHERE Username='" + floatingUsername.Text.Trim() + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                   
                    lblRegisterFeedback.Text = "Username is already taken! Please choose another.";
                    lblRegisterFeedback.CssClass = "d-block mt-2 text-danger";
                    con.Close();
                }
                else
                {
                 
                    string query = "INSERT INTO users_tbl (FullName, Username, Email, Password) VALUES ('" + floatingName.Text.Trim() + "', '" + floatingUsername.Text.Trim() + "', '" + floatingEmail.Text.Trim() + "', '" + floatingPassword.Text.Trim() + "')";
                    cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblRegisterFeedback.Text = "Registration Successful!";
                    lblRegisterFeedback.CssClass = "d-block mt-2 text-success";

                    clear();
                }

            }
        }
    }
}