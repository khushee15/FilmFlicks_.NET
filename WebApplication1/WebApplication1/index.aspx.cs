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
	public partial class index : System.Web.UI.Page
	{
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"] != null
            ? ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString
            : @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                LoadMovies();
            }

        }
        private void LoadMovies()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 12 * FROM Movies ORDER BY MovieID DESC", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptHomeMovies.DataSource = dt;
                rptHomeMovies.DataBind();
            }
        }
       


        protected void rptHomeMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}