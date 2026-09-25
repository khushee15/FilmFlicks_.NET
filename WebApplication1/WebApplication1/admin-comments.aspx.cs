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
            if (!IsPostBack)
            {
                BindComments();
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
            da = new SqlDataAdapter("select Id, Name, Email, Subject, Message, CreatedAt from ContactMessages order by CreatedAt desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (gvComments != null)
            {
                gvComments.DataSource = dt;
                gvComments.DataBind();
            }
            con.Close();
        }

        protected void gvComments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMessage")
            {
                int messageId = Convert.ToInt32(e.CommandArgument);

                getcon();
                cmd = new SqlCommand("delete from ContactMessages where Id=" + messageId, con);
                cmd.ExecuteNonQuery();
                con.Close();

                BindComments();
            }
        }
    }
}