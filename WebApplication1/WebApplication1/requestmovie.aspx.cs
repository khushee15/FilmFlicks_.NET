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
    public partial class requestmovie : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            getcon();

            cmd = new SqlCommand("insert into MovieRequests(Title, ContentType, ReleaseYear, PreferredLanguage, PreferredQuality, AdditionalDetails) values('" + txtTitle.Text + "','" + ddlContentType.SelectedValue + "','" + txtYear.Text + "','" + ddlLanguage.SelectedValue + "','" + ddlQuality.SelectedValue + "','" + txtMessage.Text + "')", con);
            cmd.ExecuteNonQuery();

            con.Close();

            lblMessage.CssClass = "alert alert-success d-block mb-4";
            lblMessage.Text = "Your movie request has been submitted successfully!";

            ClearForm();
        }


        void ClearForm()
        {
            txtTitle.Text = "";
            ddlContentType.SelectedIndex = 0;
            txtYear.Text = "";
            ddlLanguage.SelectedIndex = 0;
            ddlQuality.SelectedIndex = 0;
            txtMessage.Text = "";
        }

    }
}