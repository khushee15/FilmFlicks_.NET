using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_comments : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["IsLoaded"] == null)
            {
                BindComments();
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

        void BindComments()
        {
            getcon();
            da = new SqlDataAdapter("SELECT Id, UserId, Name, Email, Subject, Message, CreatedAt FROM ContactMessages ORDER BY CreatedAt DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (gvComments != null)
            {
                gvComments.DataSource = dt;
                gvComments.DataBind();
            }

            lblTotalMessages.Text = dt.Rows.Count.ToString();
            con.Close();
        }

        protected void gvComments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMessage")
            {
                int messageId = Convert.ToInt32(e.CommandArgument);

                getcon();
                cmd = new SqlCommand("DELETE FROM ContactMessages WHERE Id = " + messageId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                BindComments();
            }
        }
    }
}