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
    public partial class admin_movierequest : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRequests();
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

        void BindRequests()
        {
            getcon();
            da = new SqlDataAdapter("select RequestId, Title, ContentType, ReleaseYear, PreferredLanguage, PreferredQuality, AdditionalDetails, RequestDate, ISNULL(Status, 'Pending') as Status from MovieRequests order by RequestId desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptRequests.DataSource = dt;
            rptRequests.DataBind();
            con.Close();
        }

        protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string requestId = e.CommandArgument.ToString();

            if (e.CommandName == "Approve")
            {
                getcon();
                cmd = new SqlCommand("update MovieRequests set Status = 'Approved' where RequestId = " + requestId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "<div class='alert alert-success d-block mb-3'>Request Approved Successfully!</div>";
                BindRequests();
            }
            else if (e.CommandName == "DeleteReq")
            {
                getcon();
                cmd = new SqlCommand("delete from MovieRequests where RequestId = " + requestId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "<div class='alert alert-danger d-block mb-3'>Request Deleted Successfully!</div>";
                BindRequests();
            }
        }
    }

}