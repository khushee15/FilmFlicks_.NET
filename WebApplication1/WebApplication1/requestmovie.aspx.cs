using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class requestmovie : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO MovieRequests 
                                    (Title, ContentType, ReleaseYear, PreferredLanguage, PreferredQuality, AdditionalDetails) 
                                    VALUES 
                                    (@Title, @ContentType, @ReleaseYear, @PreferredLanguage, @PreferredQuality, @AdditionalDetails)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@ContentType", ddlContentType.SelectedValue);
                        cmd.Parameters.AddWithValue("@ReleaseYear", Convert.ToInt32(txtYear.Text.Trim()));
                        cmd.Parameters.AddWithValue("@PreferredLanguage", ddlLanguage.SelectedValue);
                        cmd.Parameters.AddWithValue("@PreferredQuality", ddlQuality.SelectedValue);
                        cmd.Parameters.AddWithValue("@AdditionalDetails", txtMessage.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Success Message (Green Alert)
                        lblMessage.CssClass = "alert alert-success d-block mb-4";
                        lblMessage.Text = "Your movie request has been submitted successfully!";

                        ClearForm();
                    }
                }
            }
        }
        private void ClearForm()
        {
            txtTitle.Text = string.Empty;
            ddlContentType.SelectedIndex = 0;
            txtYear.Text = string.Empty;
            ddlLanguage.SelectedIndex = 0;
            ddlQuality.SelectedIndex = 0;
            txtMessage.Text = string.Empty;
        }
    }
}