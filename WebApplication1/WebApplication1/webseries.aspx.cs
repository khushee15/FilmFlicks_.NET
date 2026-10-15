using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

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
            
            if (ViewState["IsFirstLoad"] == null)
            {
                LoadWebSeries("");
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

        void LoadWebSeries(string searchText)
        {
            getcon();

            string query = "SELECT * FROM WebSeries";

            if (!string.IsNullOrEmpty(searchText))
            {
                query += " WHERE Title LIKE @search";
            }

            query += " ORDER BY SeriesID DESC";

            cmd = new SqlCommand(query, con);

            if (!string.IsNullOrEmpty(searchText))
            {
                cmd.Parameters.AddWithValue("@search", "%" + searchText.Trim() + "%");
            }

            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptWebSeries.DataSource = dt;
            rptWebSeries.DataBind();
            con.Close();
        }
        protected void rptWebSeries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchVal = txtSearch.Text.Trim();
            LoadWebSeries(searchVal);
        }
    }
}