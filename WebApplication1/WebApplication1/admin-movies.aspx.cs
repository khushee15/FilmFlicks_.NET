using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_movies : System.Web.UI.Page
    {
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMoviesTable();
            }

        }
        private void BindMoviesTable()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT MovieID, Title, Category, QualityTag, PosterUrl FROM Movies ORDER BY MovieID DESC", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                rptAdminMovies.DataSource = dt;
                rptAdminMovies.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int movieId = Convert.ToInt32(hfMovieID.Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd;

                if (movieId == 0)
                {
                    // INSERT NEW MOVIE
                    string insertQuery = @"INSERT INTO Movies 
                        (Title, ImdbID, Category, QualityTag, PosterUrl, Description, Director, Cast, TrailerUrl, Screenshot1, Screenshot2, Screenshot3, Screenshot4, DownloadLink1, DownloadLink2) 
                        VALUES 
                        (@Title, @ImdbID, @Category, @QualityTag, @PosterUrl, @Description, @Director, @Cast, @TrailerUrl, @Screenshot1, @Screenshot2, @Screenshot3, @Screenshot4, @DownloadLink1, @DownloadLink2)";

                    cmd = new SqlCommand(insertQuery, con);
                }
                else
                {
                    // UPDATE EXISTING MOVIE
                    string updateQuery = @"UPDATE Movies SET 
                        Title=@Title, ImdbID=@ImdbID, Category=@Category, QualityTag=@QualityTag, PosterUrl=@PosterUrl, Description=@Description, 
                        Director=@Director, Cast=@Cast, TrailerUrl=@TrailerUrl, Screenshot1=@Screenshot1, Screenshot2=@Screenshot2, 
                        Screenshot3=@Screenshot3, Screenshot4=@Screenshot4, DownloadLink1=@DownloadLink1, DownloadLink2=@DownloadLink2 
                        WHERE MovieID=@MovieID";

                    cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                }

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@ImdbID", txtImdbID.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@QualityTag", ddlQuality.SelectedValue);
                cmd.Parameters.AddWithValue("@PosterUrl", txtPosterUrl.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Director", txtDirector.Text.Trim());
                cmd.Parameters.AddWithValue("@Cast", txtCast.Text.Trim());
                cmd.Parameters.AddWithValue("@TrailerUrl", txtTrailerUrl.Text.Trim());
                cmd.Parameters.AddWithValue("@Screenshot1", txtSS1.Text.Trim());
                cmd.Parameters.AddWithValue("@Screenshot2", txtSS2.Text.Trim());
                cmd.Parameters.AddWithValue("@Screenshot3", txtSS3.Text.Trim());
                cmd.Parameters.AddWithValue("@Screenshot4", txtSS4.Text.Trim());
                cmd.Parameters.AddWithValue("@DownloadLink1", txtLink1.Text.Trim());
                cmd.Parameters.AddWithValue("@DownloadLink2", txtLink2.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = movieId == 0 ? "Movie added successfully!" : "Movie updated successfully!";
            lblMessage.CssClass = "text-success fw-bold d-block mb-3";

            ClearForm();
            BindMoviesTable();


        }
        protected void rptAdminMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int movieId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        hfMovieID.Value = dr["MovieID"].ToString();
                        txtTitle.Text = dr["Title"].ToString();
                        txtImdbID.Text = dr["ImdbID"].ToString();
                        ddlCategory.SelectedValue = dr["Category"].ToString();
                        ddlQuality.SelectedValue = dr["QualityTag"].ToString();
                        txtPosterUrl.Text = dr["PosterUrl"].ToString();
                        txtDescription.Text = dr["Description"].ToString();
                        txtDirector.Text = dr["Director"].ToString();
                        txtCast.Text = dr["Cast"].ToString();
                        txtTrailerUrl.Text = dr["TrailerUrl"].ToString();
                        txtSS1.Text = dr["Screenshot1"].ToString();
                        txtSS2.Text = dr["Screenshot2"].ToString();
                        txtSS3.Text = dr["Screenshot3"].ToString();
                        txtSS4.Text = dr["Screenshot4"].ToString();
                        txtLink1.Text = dr["DownloadLink1"].ToString();
                        txtLink2.Text = dr["DownloadLink2"].ToString();

                        btnSave.Text = "Update Movie";
                    }
                }
            }
            else if (e.CommandName == "Delete")
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Movies WHERE MovieID = @MovieID", con);
                    cmd.Parameters.AddWithValue("@MovieID", movieId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Movie deleted successfully!";
                lblMessage.CssClass = "text-danger fw-bold d-block mb-3";
                BindMoviesTable();
            }
        }
        private void ClearForm()
        {
            hfMovieID.Value = "0";
            txtTitle.Text = "";
            txtImdbID.Text = "";
            txtPosterUrl.Text = "";
            txtDescription.Text = "";
            txtDirector.Text = "";
            txtCast.Text = "";
            txtTrailerUrl.Text = "";
            txtSS1.Text = "";
            txtSS2.Text = "";
            txtSS3.Text = "";
            txtSS4.Text = "";
            txtLink1.Text = "";
            txtLink2.Text = "";
            btnSave.Text = "Save Movie";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();

        }
    }
}