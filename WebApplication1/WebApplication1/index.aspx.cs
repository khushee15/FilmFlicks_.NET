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
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTrendingMovies();
            }
        }

        private void BindTrendingMovies()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Web Series સિવાયની ફિલ્મો લાવવા માટે WHERE Category != 'Web Series' મૂક્યું છે
                string query = "SELECT MovieID, Title, Category, QualityTag, PosterUrl FROM Movies WHERE Category IS NULL OR Category != 'Web Series' ORDER BY MovieID DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        // Repeater ID બરાબર match કરી દીધું છે (rptHomeMovies)
                        rptHomeMovies.DataSource = dt;
                        rptHomeMovies.DataBind();
                    }
                }
            }
        }

        protected void rptHomeMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}