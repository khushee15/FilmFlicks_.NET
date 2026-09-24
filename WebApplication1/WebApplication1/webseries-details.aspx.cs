using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class webseries_details : System.Web.UI.Page
    {
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int seriesId = Convert.ToInt32(Request.QueryString["id"]);
                    BindWebSeriesDetails(seriesId);
                    BindComments(seriesId);
                }
            }
        }

        private void BindWebSeriesDetails(int id)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Movies WHERE MovieID = @MovieID AND Category = 'Web Series'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@MovieID", id);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptWebSeriesDetails.DataSource = dt;
                        rptWebSeriesDetails.DataBind();
                    }
                }
            }
        }

        private void BindComments(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Comments WHERE MovieID = @MovieID ORDER BY CommentID DESC";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@MovieID", id);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            rptComments.DataSource = dt;
                            rptComments.DataBind();
                        }
                    }
                }
            }
            catch
            {
                // ડેટાબેઝમાં કોલમ ન હોય તો પેજને ક્રેશ થતા અટકાવશે
            }
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && !string.IsNullOrEmpty(txtComment.Text))
            {
                int seriesId = Convert.ToInt32(Request.QueryString["id"]);
                try
                {
                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        string query = "INSERT INTO Comments (MovieID, UserName, CommentText, Rating, CommentDate) VALUES (@MovieID, @UserName, @CommentText, 5, GETDATE())";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@MovieID", seriesId);
                            cmd.Parameters.AddWithValue("@UserName", string.IsNullOrEmpty(txtUserName.Text) ? "Anonymous" : txtUserName.Text);
                            cmd.Parameters.AddWithValue("@CommentText", txtComment.Text);

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    txtUserName.Text = "";
                    txtComment.Text = "";
                    BindComments(seriesId);
                }
                catch
                {
                    // Error safety Block
                }
            }
        }

        protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}