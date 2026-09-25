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
            if (string.IsNullOrEmpty(txtSenderName.Text) || string.IsNullOrEmpty(txtSenderEmail.Text) || string.IsNullOrEmpty(ddlSubject.SelectedValue) || string.IsNullOrEmpty(txtMessageContent.Text))
            {
                lblMsg.Text = "<div class='alert alert-danger mb-4' style='background-color: #dc3545; color: #ffffff; border-radius: 8px; padding: 12px 16px;'>Please fill all required fields.</div>";
                return;
            }

            getcon();
            cmd = new SqlCommand("insert into ContactMessages (Name, Email, Subject, Message, CreatedAt) values ('" + txtSenderName.Text.Trim() + "', '" + txtSenderEmail.Text.Trim() + "', '" + ddlSubject.SelectedValue + "', '" + txtMessageContent.Text.Trim() + "', '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();

            lblMsg.Text = "<div class='alert alert-success mb-4' style='background-color: #198754; color: #ffffff; border-radius: 8px; padding: 12px 16px; font-weight: 500;'>Your message has been sent successfully. We will get back to you soon!</div>";

            txtSenderName.Text = "";
            txtSenderEmail.Text = "";
            ddlSubject.SelectedIndex = 0;
            txtMessageContent.Text = "";
        }
    }
    
}