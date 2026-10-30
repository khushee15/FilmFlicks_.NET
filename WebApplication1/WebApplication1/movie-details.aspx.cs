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
            if (ViewState["IsLoaded"] == null)
            {
                int movieId = GetCurrentMovieId();
                LoadMovieDetails(movieId);

                ViewState["IsLoaded"] = true;
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

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            
        }

        protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}