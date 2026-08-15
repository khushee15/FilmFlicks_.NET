using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class contact : System.Web.UI.Page
    {
        private string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            string name = txtSenderName.Text.Trim();
            string email = txtSenderEmail.Text.Trim();
            string subject = ddlSubject.SelectedValue;
            string message = txtMessageContent.Text.Trim();

           
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(subject) || string.IsNullOrEmpty(message))
            {
                lblStatus.Text = "<div class='alert alert-warning'>Please fill all required fields!</div>";
                return;
            }

        
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO ContactMessages (SenderName, SenderEmail, Subject, MessageContent) VALUES (@Name, @Email, @Subject, @Message)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@Message", message);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblStatus.Text = "<div class='alert alert-success'>Thank you! Your message has been sent successfully.</div>";

                      
                        txtSenderName.Text = string.Empty;
                        txtSenderEmail.Text = string.Empty;
                        ddlSubject.SelectedIndex = 0;
                        txtMessageContent.Text = string.Empty;
                    }
                    else
                    {
                        lblStatus.Text = "<div class='alert alert-danger'>Failed to send message. Please try again later.</div>";
                    }
                }            
            }
        }
    }
}