using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_webseries : System.Web.UI.Page
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
                BindWebSeriesDirectory();
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

        private void BindWebSeriesDirectory()
        {
            getcon();
            da = new SqlDataAdapter("SELECT MovieID, Title, Category, QualityTag, PosterUrl FROM Movies WHERE Category = 'Web Series' ORDER BY MovieID DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAdminWebSeries.DataSource = dt;
            rptAdminWebSeries.DataBind();
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
            int seriesId = Convert.ToInt32(string.IsNullOrEmpty(hfSeriesID.Value) ? "0" : hfSeriesID.Value);

            getcon();

            uploadPoster();
            uploadScreenshots();

            if (seriesId == 0)
            {
                string insertQuery = @"INSERT INTO Movies 
                    (Title, ImdbID, Category, QualityTag, PosterUrl, Description, Director, Cast, TrailerUrl, Screenshot1, Screenshot2, Screenshot3, Screenshot4, DownloadLink1, DownloadLink2) 
                    VALUES 
                    (@Title, @ImdbID, 'Web Series', @QualityTag, @PosterUrl, @Description, @Director, @Cast, @TrailerUrl, @Screenshot1, @Screenshot2, @Screenshot3, @Screenshot4, @DownloadLink1, @DownloadLink2)";

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
                cmdSelect.Parameters.AddWithValue("@MovieID", seriesId);
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
                    Title=@Title, ImdbID=@ImdbID, Category='Web Series', QualityTag=@QualityTag, 
                    PosterUrl=@PosterUrl, Description=@Description, Director=@Director, Cast=@Cast, 
                    TrailerUrl=@TrailerUrl, Screenshot1=@Screenshot1, Screenshot2=@Screenshot2, 
                    Screenshot3=@Screenshot3, Screenshot4=@Screenshot4, DownloadLink1=@DownloadLink1, DownloadLink2=@DownloadLink2 
                    WHERE MovieID=@MovieID";

                cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@MovieID", seriesId);

                cmd.Parameters.AddWithValue("@PosterUrl", string.IsNullOrEmpty(posterPath) ? currentPoster : posterPath);
                cmd.Parameters.AddWithValue("@Screenshot1", string.IsNullOrEmpty(ss1Path) ? currentSS1 : ss1Path);
                cmd.Parameters.AddWithValue("@Screenshot2", string.IsNullOrEmpty(ss2Path) ? currentSS2 : ss2Path);
                cmd.Parameters.AddWithValue("@Screenshot3", string.IsNullOrEmpty(ss3Path) ? currentSS3 : ss3Path);
                cmd.Parameters.AddWithValue("@Screenshot4", string.IsNullOrEmpty(ss4Path) ? currentSS4 : ss4Path);
            }

            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@ImdbID", txtImdbID.Text.Trim());
            cmd.Parameters.AddWithValue("@QualityTag", ddlQuality.SelectedValue);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@Director", txtDirector.Text.Trim());
            cmd.Parameters.AddWithValue("@Cast", txtCast.Text.Trim());
            cmd.Parameters.AddWithValue("@TrailerUrl", txtTrailerUrl.Text.Trim());
            cmd.Parameters.AddWithValue("@DownloadLink1", txtLink1.Text.Trim());
            cmd.Parameters.AddWithValue("@DownloadLink2", txtLink2.Text.Trim());

            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.Text = seriesId == 0 ? "Web Series added successfully!" : "Web Series updated successfully!";
            lblMessage.CssClass = "text-success fw-bold d-block mb-3";

            ClearForm();
            BindWebSeriesDirectory();
        }

        protected void rptAdminWebSeries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int seriesId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                getcon();
                cmd = new SqlCommand("SELECT * FROM Movies WHERE MovieID = @MovieID", con);
                cmd.Parameters.AddWithValue("@MovieID", seriesId);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    hfSeriesID.Value = dr["MovieID"].ToString();
                    txtTitle.Text = dr["Title"].ToString();
                    txtImdbID.Text = dr["ImdbID"].ToString();

                    if (ddlQuality.Items.FindByValue(dr["QualityTag"].ToString()) != null)
                        ddlQuality.SelectedValue = dr["QualityTag"].ToString();

                    txtDescription.Text = dr["Description"].ToString();
                    txtDirector.Text = dr["Director"].ToString();
                    txtCast.Text = dr["Cast"].ToString();
                    txtTrailerUrl.Text = dr["TrailerUrl"].ToString();
                    txtLink1.Text = dr["DownloadLink1"].ToString();
                    txtLink2.Text = dr["DownloadLink2"].ToString();

                    btnSave.Text = "Update Web Series";
                }
            }
            else if (e.CommandName == "Delete")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM Movies WHERE MovieID = @MovieID", con);
                cmd.Parameters.AddWithValue("@MovieID", seriesId);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Web Series deleted successfully!";
                lblMessage.CssClass = "text-danger fw-bold d-block mb-3";
                BindWebSeriesDirectory();
            }
        }

        private void ClearForm()
        {
            hfSeriesID.Value = "0";
            txtTitle.Text = "";
            txtImdbID.Text = "";
            txtDescription.Text = "";
            txtDirector.Text = "";
            txtCast.Text = "";
            txtTrailerUrl.Text = "";
            txtLink1.Text = "";
            txtLink2.Text = "";
            btnSave.Text = "Save Web Series";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }
    }
}