using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
    public partial class contact : Page
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
                    txtSenderEmail.Text = Session["UserEmail"].ToString();
                    txtSenderEmail.ReadOnly = true;

                    if (Session["FullName"] != null && !string.IsNullOrWhiteSpace(Session["FullName"].ToString()))
                    {
                        txtSenderName.Text = Session["FullName"].ToString();
                    }
                    else if (Session["username"] != null)
                    {
                        txtSenderName.Text = Session["username"].ToString();
                    }
                    txtSenderName.ReadOnly = true;

                    lblMsg.Text = "<div class='alert alert-info mb-4' style='border-radius: 8px; padding: 12px 16px;'><i class='bi bi-person-check-fill me-2'></i>Contacting as <strong>" + Server.HtmlEncode(txtSenderName.Text) + "</strong> (" + Server.HtmlEncode(txtSenderEmail.Text) + ")</div>";
                }
                else
                {
                    lblMsg.Text = "<div class='alert alert-warning mb-4' style='border-radius: 8px; padding: 12px 16px; font-weight: 500;'><i class='bi bi-exclamation-triangle-fill me-2'></i><strong>Login please!</strong> Please <a href='login.aspx?msg=login_please' class='alert-link text-decoration-underline fw-bold'>login</a> to submit your inquiry.</div>";
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
                lblMsg.Text = "<div class='alert alert-danger mb-4' style='background-color: #dc3545; color: #ffffff; border-radius: 8px; padding: 12px 16px; font-weight: 500;'><i class='bi bi-lock-fill me-2'></i><strong>Login please!</strong> You must be logged in to send a message. <a href='login.aspx?msg=login_please' class='text-white text-decoration-underline fw-bold'>Click here to Login</a></div>";
                return;
            }

            if (string.IsNullOrEmpty(txtSenderName.Text) || string.IsNullOrEmpty(txtSenderEmail.Text) || string.IsNullOrEmpty(ddlSubject.SelectedValue) || string.IsNullOrEmpty(txtMessageContent.Text))
            {
                lblMsg.Text = "<div class='alert alert-danger mb-4' style='background-color: #dc3545; color: #ffffff; border-radius: 8px; padding: 12px 16px;'>Please fill all required fields.</div>";
                return;
            }

            string userId = (Session["UserId"] != null) ? Session["UserId"].ToString() : "0";
            string createdAt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            getcon();
            cmd = new SqlCommand("INSERT INTO ContactMessages (UserId, Name, Email, Subject, Message, CreatedAt) VALUES (" + userId + ", '" + txtSenderName.Text.Trim() + "', '" + txtSenderEmail.Text.Trim() + "', '" + ddlSubject.SelectedValue + "', '" + txtMessageContent.Text.Trim() + "', '" + createdAt + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "<div class='alert alert-success mb-4' style='background-color: #198754; color: #ffffff; border-radius: 8px; padding: 12px 16px; font-weight: 500;'><i class='bi bi-check-circle-fill me-2'></i>Your message has been sent successfully. We will get back to you soon!</div>";

            ddlSubject.SelectedIndex = 0;
            txtMessageContent.Text = "";
        }
    }
}