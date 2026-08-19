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
    public partial class movie_details : System.Web.UI.Page
    {
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True;";

  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int movieId = GetCurrentMovieId();
                LoadMovieDetails(movieId);
                LoadComments(movieId);
            }
        }
        private int GetCurrentMovieId()
        {
            if (Request.QueryString["id"] != null)
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id))
                {
                    return id;
                }
            }
            return 1; 
        }

        private void LoadMovieDetails(int movieId)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Movies WHERE MovieID = @MovieID", con);
                cmd.Parameters.AddWithValue("@MovieID", movieId);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                rptMovieDetails.DataSource = dt;
                rptMovieDetails.DataBind();
            }
        }

        private void LoadComments(int movieId)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM MovieComments WHERE MovieID = @MovieID ORDER BY CommentDate DESC", con);
                cmd.Parameters.AddWithValue("@MovieID", movieId);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                rptComments.DataSource = dt;
                rptComments.DataBind();
            }
        }
        protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            int movieId = GetCurrentMovieId();
            string name = string.IsNullOrWhiteSpace(txtUserName.Text) ? "Anonymous" : txtUserName.Text.Trim();
            string comment = txtComment.Text.Trim();

            if (!string.IsNullOrEmpty(comment))
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO MovieComments (MovieID, UserName, Rating, CommentText, CommentDate) VALUES (@MovieID, @UserName, '5.0', @CommentText, GETDATE())";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    cmd.Parameters.AddWithValue("@UserName", name);
               
                    cmd.Parameters.AddWithValue("@CommentText", comment);
                    cmd.Parameters.AddWithValue("@CommentDate", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                txtUserName.Text = "";
                txtComment.Text = "";
                LoadComments(movieId);
            }
        }
    }
}