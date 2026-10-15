using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class cartoon_details : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["IsLoaded"] == null)
            {
                int cartoonId = GetCurrentCartoonId();
                LoadCartoonDetails(cartoonId);
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

        int GetCurrentCartoonId()
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

        void LoadCartoonDetails(int cartoonId)
        {
            getcon();
            da = new SqlDataAdapter("select * from Cartoons where CartoonID = " + cartoonId, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCartoonDetails.DataSource = dt;
            rptCartoonDetails.DataBind();
            con.Close();
        }
    }
}


