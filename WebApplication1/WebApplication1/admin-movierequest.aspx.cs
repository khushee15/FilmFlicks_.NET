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
    public partial class admin_movierequest : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRequests();
            }

        }
        private void BindRequests()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT RequestId, Title, ContentType, ReleaseYear, PreferredLanguage, PreferredQuality, AdditionalDetails, RequestDate, ISNULL(Status, 'Pending') as Status FROM MovieRequests ORDER BY RequestId DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptRequests.DataSource = dt;
                        rptRequests.DataBind();
                    }
                }
            }
        }

        protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string requestId = e.CommandArgument.ToString();

            if (e.CommandName == "Approve")
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "UPDATE MovieRequests SET Status = 'Approved' WHERE RequestId = @RequestId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@RequestId", requestId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                lblMessage.Text = "<div class='alert alert-success d-block mb-3'>Request Approved Successfully!</div>";
                BindRequests();
            }
            else if (e.CommandName == "DeleteReq")
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM MovieRequests WHERE RequestId = @RequestId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@RequestId", requestId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                lblMessage.Text = "<div class='alert alert-danger d-block mb-3'>Request Deleted Successfully!</div>";
                BindRequests();
            }
        }
    }

}