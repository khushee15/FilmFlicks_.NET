using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class requestmovie : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null)
                {
                    txtRequesterEmail.Text = Session["UserEmail"].ToString();

                    if (Session["FullName"] != null && !string.IsNullOrWhiteSpace(Session["FullName"].ToString()))
                    {
                        txtRequesterName.Text = Session["FullName"].ToString();
                    }
                    else if (Session["username"] != null)
                    {
                        txtRequesterName.Text = Session["username"].ToString();
                    }

                    lblMessage.CssClass = "alert alert-info d-block mb-4";
                    lblMessage.Text = "<i class='bi bi-person-check-fill me-2'></i>Requesting as <strong>" + Server.HtmlEncode(txtRequesterName.Text) + "</strong> (" + Server.HtmlEncode(txtRequesterEmail.Text) + ")";
                }
                else
                {
                    lblMessage.CssClass = "alert alert-warning d-block mb-4";
                    lblMessage.Text = "<i class='bi bi-exclamation-triangle-fill me-2'></i><strong>Login please!</strong> Please <a href='login.aspx?msg=login_please' class='alert-link text-decoration-underline fw-bold'>login</a> to request a movie or web series.";
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                lblMessage.CssClass = "alert alert-danger d-block mb-4";
                lblMessage.Text = "<i class='bi bi-lock-fill me-2'></i><strong>Login please!</strong> You must be logged in to request a movie. <a href='login.aspx?msg=login_please' class='text-white text-decoration-underline fw-bold'>Click here to Login</a>";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrEmpty(ddlContentType.SelectedValue) || string.IsNullOrWhiteSpace(txtYear.Text) || string.IsNullOrEmpty(ddlLanguage.SelectedValue) || string.IsNullOrEmpty(ddlQuality.SelectedValue) || string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblMessage.CssClass = "alert alert-danger d-block mb-4";
                lblMessage.Text = "Please fill all required fields.";
                return;
            }

            string userId = (Session["UserId"] != null) ? Session["UserId"].ToString() : "0";

            getcon();

            string query = "INSERT INTO MovieRequests (UserId, RequesterName, RequesterEmail, Title, ContentType, ReleaseYear, PreferredLanguage, PreferredQuality, AdditionalDetails, RequestDate, Status) VALUES (" + userId + ", '" + txtRequesterName.Text.Trim() + "', '" + txtRequesterEmail.Text.Trim() + "', '" + txtTitle.Text.Trim() + "', '" + ddlContentType.SelectedValue + "', '" + txtYear.Text.Trim() + "', '" + ddlLanguage.SelectedValue + "', '" + ddlQuality.SelectedValue + "', '" + txtMessage.Text.Trim() + "', GETDATE(), 'Pending')";

            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.CssClass = "alert alert-success d-block mb-4";
            lblMessage.Text = "<i class='bi bi-check-circle-fill me-2'></i>Your movie request has been submitted successfully!";

            ClearForm();
        }

        void ClearForm()
        {
            txtTitle.Text = "";
            ddlContentType.SelectedIndex = 0;
            txtYear.Text = "";
            ddlLanguage.SelectedIndex = 0;
            ddlQuality.SelectedIndex = 0;
            txtMessage.Text = "";
        }
    }
}