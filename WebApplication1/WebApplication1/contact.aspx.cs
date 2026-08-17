using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
    public partial class contact : Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSenderName.Text) ||
                string.IsNullOrEmpty(txtSenderEmail.Text) ||
                string.IsNullOrEmpty(ddlSubject.SelectedValue) ||
                string.IsNullOrEmpty(txtMessageContent.Text))
            {
                lblMsg.Text = "<div class='alert alert-danger mb-4' style='background-color: #dc3545; color: #ffffff; border-radius: 8px; padding: 12px 16px;'>Please fill all required fields.</div>";
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO ContactMessages (Name, Email, Subject, Message, CreatedAt) VALUES (@Name, @Email, @Subject, @Message, @CreatedAt)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtSenderName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtSenderEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedValue);
                        cmd.Parameters.AddWithValue("@Message", txtMessageContent.Text.Trim());
                        cmd.Parameters.AddWithValue("@CreatedAt", DateTime.Now);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                lblMsg.Text = "<div class='alert alert-success mb-4' style='background-color: #198754; color: #ffffff; border-radius: 8px; padding: 12px 16px; font-weight: 500;'>Your message has been sent successfully. We will get back to you soon!</div>";

                txtSenderName.Text = "";
                txtSenderEmail.Text = "";
                ddlSubject.SelectedIndex = 0;
                txtMessageContent.Text = "";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='alert alert-danger mb-4' style='background-color: #dc3545; color: #ffffff; border-radius: 8px; padding: 12px 16px;'>Error: " + ex.Message + "</div>";
            }
        }
    }
}