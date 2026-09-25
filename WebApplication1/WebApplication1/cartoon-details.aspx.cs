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
            if (!IsPostBack)
            {
                int cartoonId = GetCurrentCartoonId();
                LoadCartoonDetails(cartoonId);
                LoadComments(cartoonId);

                if (Session["username"] != null)
                {
                    txtUserName.Text = Session["username"].ToString();
                    txtUserName.ReadOnly = true;
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

        void LoadComments(int cartoonId)
        {
            getcon();
            da = new SqlDataAdapter("select * from MovieComments where MovieID = " + cartoonId + " order by CommentDate desc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptComments.DataSource = dt;
                rptComments.DataBind();
                pnlNoComments.Visible = false;
            }
            else
            {
                rptComments.DataSource = null;
                rptComments.DataBind();
                pnlNoComments.Visible = true;
            }
            con.Close();
        }
        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            int cartoonId = GetCurrentCartoonId();
            string name = Session["username"] != null ? Session["username"].ToString() : (string.IsNullOrWhiteSpace(txtUserName.Text) ? "Anonymous" : txtUserName.Text.Trim());
            string comment = txtComment.Text.Trim();

            if (!string.IsNullOrEmpty(comment))
            {
                getcon();
                cmd = new SqlCommand("insert into MovieComments (MovieID, UserName, Rating, CommentText, CommentDate) values (" + cartoonId + ", '" + name + "', '5.0', '" + comment + "', GETDATE())", con);
                cmd.ExecuteNonQuery();
                con.Close();

                if (Session["username"] == null)
                {
                    txtUserName.Text = "";
                }
                txtComment.Text = "";
                lblReviewMsg.Text = "<span class='text-success fw-semibold'>Thank you! Your review has been posted.</span>";
                LoadComments(cartoonId);
            }
            else
            {
                lblReviewMsg.Text = "<span class='text-danger fw-semibold'>Please write your comment before submitting.</span>";
            }
        }
    }
}
