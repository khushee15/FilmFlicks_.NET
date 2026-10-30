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
            if (ViewState["IsLoaded"] == null)
            {
                BindRequests();
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

        void BindRequests()
        {
            getcon();
            da = new SqlDataAdapter("SELECT RequestId, UserId, ISNULL(RequesterName, '') AS RequesterName, ISNULL(RequesterEmail, '') AS RequesterEmail, Title, ContentType, ReleaseYear, PreferredLanguage, PreferredQuality, AdditionalDetails, RequestDate, ISNULL(Status, 'Pending') AS Status FROM MovieRequests ORDER BY RequestId DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptRequests.DataSource = dt;
            rptRequests.DataBind();

            lblTotalRequests.Text = dt.Rows.Count.ToString();
            con.Close();
        }

        protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int requestId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Approve")
            {
                getcon();
                cmd = new SqlCommand("UPDATE MovieRequests SET Status = 'Approved' WHERE RequestId = " + requestId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "<div class='alert alert-success d-block mb-3'>Request Approved Successfully!</div>";
                BindRequests();
            }
            else if (e.CommandName == "DeleteReq")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM MovieRequests WHERE RequestId = " + requestId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "<div class='alert alert-danger d-block mb-3'>Request Deleted Successfully!</div>";
                BindRequests();
            }
        }
    }
}