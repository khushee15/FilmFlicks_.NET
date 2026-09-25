using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTrendingMovies();
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

        void BindTrendingMovies()
        {
            getcon();
            da = new SqlDataAdapter("select MovieID, Title, Category, QualityTag, PosterUrl from Movies where Category is null or (Category != 'Web Series' and Category != 'Cartoon') order by MovieID desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptHomeMovies.DataSource = dt;
            rptHomeMovies.DataBind();
            con.Close();
        }

        protected void rptHomeMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}