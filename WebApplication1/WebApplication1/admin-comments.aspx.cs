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
        string connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=FilmFlicksDB;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindComments();
            }
        }

        private void BindComments()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Name, Email, Subject, Message, CreatedAt FROM ContactMessages ORDER BY CreatedAt DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (gvComments != null)
                        {
                            gvComments.DataSource = dt;
                            gvComments.DataBind();
                        }
                    }
                }
            }
        }

        protected void gvComments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteMessage")
            {
                int messageId = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM ContactMessages WHERE Id = @Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", messageId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindComments();
            }
        }
    }
}