using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Cartoon : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartoons();
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

        void LoadCartoons()
        {
            getcon();
            da = new SqlDataAdapter("select * from Cartoons order by CartoonID desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptCartoons.DataSource = dt;
                rptCartoons.DataBind();
                pnlNoCartoons.Visible = false;
            }
            else
            {
                rptCartoons.DataSource = null;
                rptCartoons.DataBind();
                pnlNoCartoons.Visible = true;
            }
            con.Close();
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {

        }
    }
}
