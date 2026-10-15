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
           
            if (ViewState["IsFirstLoad"] == null)
            {
                LoadCartoons("");
                ViewState["IsFirstLoad"] = false;
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

        void LoadCartoons(string searchText)
        {
            getcon();

            string query = "select * from Cartoons";

            if (!string.IsNullOrEmpty(searchText))
            {
                query += " where Title like '%" + searchText.Trim() + "%' or Director like '%" + searchText.Trim() + "%'";
            }

            query += " order by CartoonID desc";

            da = new SqlDataAdapter(query, con);
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchVal = txtSearch.Text.Trim();
            LoadCartoons(searchVal);
        }
    }
}
