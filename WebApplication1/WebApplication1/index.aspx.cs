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
       
            if (ViewState["IsLoaded"] == null)
            {
                BindTrendingMovies("");
                ViewState["IsLoaded"] = true;
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

        void BindTrendingMovies(string searchText)
        {
            getcon();

            string query = "select MovieID, Title, Category, QualityTag, PosterUrl from Movies where (Category is null or (Category != 'Web Series' and Category != 'Cartoon'))";

            if (!string.IsNullOrEmpty(searchText))
            {
                query += " and Title like '%" + searchText.Trim() + "%'";
            }

            query += " order by MovieID desc";

            da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptHomeMovies.DataSource = dt;
            rptHomeMovies.DataBind();
            con.Close();
        }

        protected void rptHomeMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchVal = txtSearch.Text.Trim();
            BindTrendingMovies(searchVal);
        }
    }
}