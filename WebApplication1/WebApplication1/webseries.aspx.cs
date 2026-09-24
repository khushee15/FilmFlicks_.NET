using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class webseries : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWebSeries();
            }
        }

        private void LoadWebSeries()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Movies WHERE Category = 'Web Series' ORDER BY MovieID DESC", con);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                rptWebSeries.DataSource = dt;
                rptWebSeries.DataBind();
            }
        }

        protected void rptWebSeries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}