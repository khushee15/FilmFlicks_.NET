using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_Cartoon : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        string posterPath = "", ss1Path = "", ss2Path = "", ss3Path = "", ss4Path = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartoonDirectory();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void BindCartoonDirectory()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Cartoons ORDER BY CartoonID DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptAdminCartoons.DataSource = dt;
            rptAdminCartoons.DataBind();
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
            int cartoonId = Convert.ToInt32(string.IsNullOrEmpty(hfCartoonID.Value) ? "0" : hfCartoonID.Value);

            getcon();

            uploadPoster();
            uploadScreenshots();

            if (cartoonId == 0)
            {
                string query = "INSERT INTO Cartoons " +
                               "(Title, ImdbID, QualityTag, PosterUrl, Description, Director, Cast, TrailerUrl, Screenshot1, Screenshot2, Screenshot3, Screenshot4, DownloadLink1, DownloadLink2) " +
                               "VALUES (" +
                               "'" + txtTitle.Text.Trim() + "', " +
                               "'" + txtImdbID.Text.Trim() + "', " +
                               "'" + ddlQuality.SelectedValue + "', " +
                               "'" + posterPath + "', " +
                               "'" + txtDescription.Text.Trim() + "', " +
                               "'" + txtDirector.Text.Trim() + "', " +
                               "'" + txtCast.Text.Trim() + "', " +
                               "'" + txtTrailerUrl.Text.Trim() + "', " +
                               "'" + ss1Path + "', " +
                               "'" + ss2Path + "', " +
                               "'" + ss3Path + "', " +
                               "'" + ss4Path + "', " +
                               "'" + txtLink1.Text.Trim() + "', " +
                               "'" + txtLink2.Text.Trim() + "')";

                cmd = new SqlCommand(query, con);
            }
            else
            {
                string currentPoster = "", currentSS1 = "", currentSS2 = "", currentSS3 = "", currentSS4 = "";

                SqlCommand cmdSelect = new SqlCommand("SELECT PosterUrl, Screenshot1, Screenshot2, Screenshot3, Screenshot4 FROM Cartoons WHERE CartoonID = " + cartoonId, con);
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

                string finalPoster = string.IsNullOrEmpty(posterPath) ? currentPoster : posterPath;
                string finalSS1 = string.IsNullOrEmpty(ss1Path) ? currentSS1 : ss1Path;
                string finalSS2 = string.IsNullOrEmpty(ss2Path) ? currentSS2 : ss2Path;
                string finalSS3 = string.IsNullOrEmpty(ss3Path) ? currentSS3 : ss3Path;
                string finalSS4 = string.IsNullOrEmpty(ss4Path) ? currentSS4 : ss4Path;

                string query = "UPDATE Cartoons SET " +
                               "Title = '" + txtTitle.Text.Trim() + "', " +
                               "ImdbID = '" + txtImdbID.Text.Trim() + "', " +
                               "QualityTag = '" + ddlQuality.SelectedValue + "', " +
                               "PosterUrl = '" + finalPoster + "', " +
                               "Description = '" + txtDescription.Text.Trim() + "', " +
                               "Director = '" + txtDirector.Text.Trim() + "', " +
                               "Cast = '" + txtCast.Text.Trim() + "', " +
                               "TrailerUrl = '" + txtTrailerUrl.Text.Trim() + "', " +
                               "Screenshot1 = '" + finalSS1 + "', " +
                               "Screenshot2 = '" + finalSS2 + "', " +
                               "Screenshot3 = '" + finalSS3 + "', " +
                               "Screenshot4 = '" + finalSS4 + "', " +
                               "DownloadLink1 = '" + txtLink1.Text.Trim() + "', " +
                               "DownloadLink2 = '" + txtLink2.Text.Trim() + "' " +
                               "WHERE CartoonID = " + cartoonId;

                cmd = new SqlCommand(query, con);
            }

            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.Text = cartoonId == 0 ? "Cartoon added successfully!" : "Cartoon updated successfully!";
            lblMessage.CssClass = "text-success fw-bold d-block mb-3";

            ClearForm();
            BindCartoonDirectory();
        }

        protected void rptAdminCartoons_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int cartoonId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                getcon();

                cmd = new SqlCommand("SELECT * FROM Cartoons WHERE CartoonID = " + cartoonId, con);
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    hfCartoonID.Value = dr["CartoonID"].ToString();
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

                    btnSave.Text = "Update Cartoon";
                }
            }
            else if (e.CommandName == "Delete")
            {
                getcon();

                cmd = new SqlCommand("DELETE FROM Cartoons WHERE CartoonID = " + cartoonId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Cartoon deleted successfully!";
                lblMessage.CssClass = "text-danger fw-bold d-block mb-3";
                BindCartoonDirectory();
            }
        }
        void ClearForm()
        {
            hfCartoonID.Value = "0";
            txtTitle.Text = "";
            txtImdbID.Text = "";
            txtDescription.Text = "";
            txtDirector.Text = "";
            txtCast.Text = "";
            txtTrailerUrl.Text = "";
            txtLink1.Text = "";
            txtLink2.Text = "";
            btnSave.Text = "Save Cartoon";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }
    }
}