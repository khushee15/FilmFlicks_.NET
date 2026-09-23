using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_movies : System.Web.UI.Page
    {
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True";
        string posterPath = "", ss1Path = "", ss2Path = "", ss3Path = "", ss4Path = "";
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMoviesTable();
            }
        }
        void getcon()
        {
      
            con = new SqlConnection(connStr);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        private void BindMoviesTable()
        {
            getcon();
            da = new SqlDataAdapter("SELECT MovieID, Title, Category, QualityTag, PosterUrl FROM Movies ORDER BY MovieID DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAdminMovies.DataSource = dt;
            rptAdminMovies.DataBind();
            con.Close();
        }

      
        void uploadPoster()
        {
            if (fPoster.HasFile)
            {
                string folderPath = Server.MapPath("~/poster/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                posterPath = "~/poster/" + Guid.NewGuid().ToString() + "_" + Path.GetFileName(fPoster.FileName);
                fPoster.SaveAs(Server.MapPath(posterPath));
            }
        }

      
        void uploadScreenshots()
        {
            string folderPath = Server.MapPath("~/screnshort/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            if (fSS1.HasFile)
            {
                ss1Path = "~/screnshort/" + Guid.NewGuid().ToString() + "_" + Path.GetFileName(fSS1.FileName);
                fSS1.SaveAs(Server.MapPath(ss1Path));
            }

            if (fSS2.HasFile)
            {
                ss2Path = "~/screnshort/" + Guid.NewGuid().ToString() + "_" + Path.GetFileName(fSS2.FileName);
                fSS2.SaveAs(Server.MapPath(ss2Path));
            }

            if (fSS3.HasFile)
            {
                ss3Path = "~/screnshort/" + Guid.NewGuid().ToString() + "_" + Path.GetFileName(fSS3.FileName);
                fSS3.SaveAs(Server.MapPath(ss3Path));
            }

            if (fSS4.HasFile)
            {
                ss4Path = "~/screnshort/" + Guid.NewGuid().ToString() + "_" + Path.GetFileName(fSS4.FileName);
                fSS4.SaveAs(Server.MapPath(ss4Path));
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int movieId = Convert.ToInt32(string.IsNullOrEmpty(hfMovieID.Value) ? "0" : hfMovieID.Value);

            getcon();

          
            uploadPoster();
            uploadScreenshots();

            if (movieId == 0)
            {
               
                string insertQuery = @"INSERT INTO Movies 
                    (Title, ImdbID, Category, QualityTag, PosterUrl, Description, Director, Cast, TrailerUrl, Screenshot1, Screenshot2, Screenshot3, Screenshot4, DownloadLink1, DownloadLink2) 
                    VALUES 
                    (@Title, @ImdbID, @Category, @QualityTag, @PosterUrl, @Description, @Director, @Cast, @TrailerUrl, @Screenshot1, @Screenshot2, @Screenshot3, @Screenshot4, @DownloadLink1, @DownloadLink2)";

                cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@PosterUrl", posterPath);
                cmd.Parameters.AddWithValue("@Screenshot1", ss1Path);
                cmd.Parameters.AddWithValue("@Screenshot2", ss2Path);
                cmd.Parameters.AddWithValue("@Screenshot3", ss3Path);
                cmd.Parameters.AddWithValue("@Screenshot4", ss4Path);
            }
            else
            {
              
                string currentPoster = "", currentSS1 = "", currentSS2 = "", currentSS3 = "", currentSS4 = "";

                SqlCommand cmdSelect = new SqlCommand("SELECT PosterUrl, Screenshot1, Screenshot2, Screenshot3, Screenshot4 FROM Movies WHERE MovieID = @MovieID", con);
                cmdSelect.Parameters.AddWithValue("@MovieID", movieId);
                SqlDataReader dr = cmdSelect.ExecuteReader();
                if (dr.Read())
                {
                    currentPoster = dr["PosterUrl"].ToString();
                    currentSS1 = dr["Screenshot1"].ToString();
                    currentSS2 = dr["Screenshot2"].ToString();
                    currentSS3 = dr["Screenshot3"].ToString();
                    currentSS4 = dr["Screenshot4"].ToString();
                }
                dr.Close();

                string updateQuery = @"UPDATE Movies SET 
                    Title=@Title, ImdbID=@ImdbID, Category=@Category, QualityTag=@QualityTag, 
                    PosterUrl=@PosterUrl, Description=@Description, Director=@Director, Cast=@Cast, 
                    TrailerUrl=@TrailerUrl, Screenshot1=@Screenshot1, Screenshot2=@Screenshot2, 
                    Screenshot3=@Screenshot3, Screenshot4=@Screenshot4, DownloadLink1=@DownloadLink1, DownloadLink2=@DownloadLink2 
                    WHERE MovieID=@MovieID";

                cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@MovieID", movieId);

             
                cmd.Parameters.AddWithValue("@PosterUrl", string.IsNullOrEmpty(posterPath) ? currentPoster : posterPath);
                cmd.Parameters.AddWithValue("@Screenshot1", string.IsNullOrEmpty(ss1Path) ? currentSS1 : ss1Path);
                cmd.Parameters.AddWithValue("@Screenshot2", string.IsNullOrEmpty(ss2Path) ? currentSS2 : ss2Path);
                cmd.Parameters.AddWithValue("@Screenshot3", string.IsNullOrEmpty(ss3Path) ? currentSS3 : ss3Path);
                cmd.Parameters.AddWithValue("@Screenshot4", string.IsNullOrEmpty(ss4Path) ? currentSS4 : ss4Path);
            }

            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@ImdbID", txtImdbID.Text.Trim());
            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@QualityTag", ddlQuality.SelectedValue);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@Director", txtDirector.Text.Trim());
            cmd.Parameters.AddWithValue("@Cast", txtCast.Text.Trim());
            cmd.Parameters.AddWithValue("@TrailerUrl", txtTrailerUrl.Text.Trim());
            cmd.Parameters.AddWithValue("@DownloadLink1", txtLink1.Text.Trim());
            cmd.Parameters.AddWithValue("@DownloadLink2", txtLink2.Text.Trim());

            cmd.ExecuteNonQuery();
            con.Close();

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
                getcon();
                cmd = new SqlCommand("SELECT * FROM Movies WHERE MovieID = @MovieID", con);
                cmd.Parameters.AddWithValue("@MovieID", movieId);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    hfMovieID.Value = dr["MovieID"].ToString();
                    txtTitle.Text = dr["Title"].ToString();
                    txtImdbID.Text = dr["ImdbID"].ToString();

                    if (ddlCategory.Items.FindByValue(dr["Category"].ToString()) != null)
                        ddlCategory.SelectedValue = dr["Category"].ToString();

                    if (ddlQuality.Items.FindByValue(dr["QualityTag"].ToString()) != null)
                        ddlQuality.SelectedValue = dr["QualityTag"].ToString();

                    txtDescription.Text = dr["Description"].ToString();
                    txtDirector.Text = dr["Director"].ToString();
                    txtCast.Text = dr["Cast"].ToString();
                    txtTrailerUrl.Text = dr["TrailerUrl"].ToString();
                    txtLink1.Text = dr["DownloadLink1"].ToString();
                    txtLink2.Text = dr["DownloadLink2"].ToString();

                    btnSave.Text = "Update Movie";
                }
            }
            else if (e.CommandName == "Delete")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM Movies WHERE MovieID = @MovieID", con);
                cmd.Parameters.AddWithValue("@MovieID", movieId);
                cmd.ExecuteNonQuery();
                con.Close();

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
            txtDescription.Text = "";
            txtDirector.Text = "";
            txtCast.Text = "";
            txtTrailerUrl.Text = "";
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