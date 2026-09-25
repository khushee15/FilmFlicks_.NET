using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class movie_details : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int movieId = GetCurrentMovieId();
                LoadMovieDetails(movieId);
                LoadComments(movieId);

                if (Session["username"] != null)
                {
                    txtUserName.Text = Session["username"].ToString();
                    txtUserName.ReadOnly = true;
                }
            }
        }

        protected void rptMovieDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        int GetCurrentMovieId()
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

        void LoadMovieDetails(int movieId)
        {
            getcon();
            da = new SqlDataAdapter("select * from Movies where MovieID = " + movieId, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptMovieDetails.DataSource = dt;
            rptMovieDetails.DataBind();
            con.Close();
        }

        void LoadComments(int movieId)
        {
            getcon();
            da = new SqlDataAdapter("select * from MovieComments where MovieID = " + movieId + " order by CommentDate desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptComments.DataSource = dt;
            rptComments.DataBind();
            con.Close();
        }
        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            int movieId = GetCurrentMovieId();
            string name = Session["username"] != null ? Session["username"].ToString() : (string.IsNullOrWhiteSpace(txtUserName.Text) ? "Anonymous" : txtUserName.Text.Trim());
            string comment = txtComment.Text.Trim();

            if (!string.IsNullOrEmpty(comment))
            {
                getcon();
                cmd = new SqlCommand("insert into MovieComments (MovieID, UserName, Rating, CommentText, CommentDate) values (" + movieId + ", '" + name + "', '5.0', '" + comment + "', GETDATE())", con);
                cmd.ExecuteNonQuery();
                con.Close();

                if (Session["username"] == null)
                {
                    txtUserName.Text = "";
                }
                txtComment.Text = "";
                LoadComments(movieId);
            }
        }

        protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}