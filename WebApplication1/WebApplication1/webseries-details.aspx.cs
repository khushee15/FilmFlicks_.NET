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
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int seriesId = Convert.ToInt32(Request.QueryString["id"]);
                    BindWebSeriesDetails(seriesId);
                    BindComments(seriesId);

                    if (Session["username"] != null)
                    {
                        txtUserName.Text = Session["username"].ToString();
                        txtUserName.ReadOnly = true;
                    }
                }
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

        void BindComments(int id)
        {
            getcon();
            da = new SqlDataAdapter("select * from MovieComments where MovieID = " + id + " order by CommentDate desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptComments.DataSource = dt;
            rptComments.DataBind();
            con.Close();
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && !string.IsNullOrEmpty(txtComment.Text.Trim()))
            {
                int seriesId = Convert.ToInt32(Request.QueryString["id"]);
                string userName = Session["username"] != null ? Session["username"].ToString() : (string.IsNullOrEmpty(txtUserName.Text) ? "Anonymous" : txtUserName.Text.Trim());
                string commentText = txtComment.Text.Trim();

                getcon();
                cmd = new SqlCommand("insert into MovieComments (MovieID, UserName, CommentText, Rating, CommentDate) values (" + seriesId + ", '" + userName + "', '" + commentText + "', '5.0', GETDATE())", con);
                cmd.ExecuteNonQuery();
                con.Close();

                if (Session["username"] == null)
                {
                    txtUserName.Text = "";
                }
                txtComment.Text = "";
                BindComments(seriesId);
            }
        }

        protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}