using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_users : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridfill();
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

        void gridfill(string searchQuery = "")
        {
            getcon();
            string query = "select * from users_tbl";

            if (!string.IsNullOrEmpty(searchQuery))
            {
                query += " where FullName like '%" + searchQuery + "%' or Username like '%" + searchQuery + "%' or Email like '%" + searchQuery + "%'";
            }

            da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            rptUsers.DataSource = ds;
            rptUsers.DataBind();

            lblTotalUsers.Text = "Total Users: " + ds.Tables[0].Rows.Count.ToString();
            con.Close();
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                getcon();
                cmd = new SqlCommand("delete from users_tbl where UserId='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                gridfill();
            }
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
        }
        protected string GetInitials(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
                return "U";

            string[] names = name.Trim().Split(' ');
            if (names.Length >= 2 && !string.IsNullOrEmpty(names[0]) && !string.IsNullOrEmpty(names[1]))
            {
                return (names[0][0].ToString() + names[1][0].ToString()).ToUpper();
            }

            return name.Substring(0, Math.Min(2, name.Length)).ToUpper();
        }

        protected string GetAvatarStyle(int index)
        {
            string[] gradients = new string[]
            {
                "background: linear-gradient(135deg, #ec4899, #8b5cf6);",
                "background: linear-gradient(135deg, #3b82f6, #10b981);",
                "background: linear-gradient(135deg, #f59e0b, #ef4444);",
                "background: linear-gradient(135deg, #6366f1, #a855f7);"
            };

            return gradients[index % gradients.Length];
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            gridfill(txtSearch.Text.Trim());
        }
    
    }
}
