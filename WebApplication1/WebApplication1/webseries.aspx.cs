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
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWebSeries();
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

        void LoadWebSeries()
        {
            getcon();
            da = new SqlDataAdapter("select * from WebSeries order by SeriesID desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptWebSeries.DataSource = dt;
            rptWebSeries.DataBind();
            con.Close();
        }

        protected void rptWebSeries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}