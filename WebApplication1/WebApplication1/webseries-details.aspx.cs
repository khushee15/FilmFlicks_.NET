using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class webseries_details : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["IsLoaded"] == null)
            {
                if (Request.QueryString["id"] != null)
                {
                    int seriesId = Convert.ToInt32(Request.QueryString["id"]);
                    BindWebSeriesDetails(seriesId);
                }

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

        void BindWebSeriesDetails(int id)
        {
            getcon();
            da = new SqlDataAdapter("select * from WebSeries where SeriesID = " + id, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptWebSeriesDetails.DataSource = dt;
            rptWebSeriesDetails.DataBind();
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