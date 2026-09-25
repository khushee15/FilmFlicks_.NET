using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



using System.Configuration;
using System.IO;



namespace WebApplication1
{
    public partial class myprofile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string fnm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null)
                {
                    LoadUserProfile(Session["UserEmail"].ToString());
                }
                else
                {
                    Response.Redirect("login.aspx");
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

        void LoadUserProfile(string email)
        {
            getcon();
            cmd = new SqlCommand("SELECT FullName, Username, Email, Phone, Bio, ImagePath FROM users_tbl WHERE Email = @Email", con);
            cmd.Parameters.AddWithValue("@Email", email);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtFullName.Text = dr["FullName"].ToString();
                txtUsername.Text = dr["Username"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtBio.Text = dr["Bio"].ToString();

                lblLeftFullName.Text = dr["FullName"].ToString();
                lblLeftUsername.Text = dr["Username"].ToString();
                lblLeftPhone.Text = dr["Phone"].ToString();
                lblLeftBio.Text = dr["Bio"].ToString();

                if (dr["ImagePath"] != DBNull.Value && !string.IsNullOrEmpty(dr["ImagePath"].ToString()))
                {
                    string imgPath = dr["ImagePath"].ToString();
                    imgLeftProfile.ImageUrl = ResolveUrl(imgPath);
                    Session["UserProfilePic"] = imgPath;
                }
            }
            dr.Close();
            con.Close();
        }

        void imgupload()
        {
            if (fileUploadAvatar.HasFile)
            {
                // ફાઈલનું નામ unique રાખવા માટે ટાઈમસ્ટેમ્પ ઉમેર્યું છે
                string fileName = Path.GetFileNameWithoutExtension(fileUploadAvatar.FileName) + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + Path.GetExtension(fileUploadAvatar.FileName);
                fnm = "~/Uploads/" + fileName;
                fileUploadAvatar.SaveAs(Server.MapPath(fnm));
            }
        }
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            getcon();

            if (fileUploadAvatar.HasFile)
            {
                imgupload();
            }
            else
            {
                cmd = new SqlCommand("SELECT ImagePath FROM users_tbl WHERE Username = @Username", con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                object obj = cmd.ExecuteScalar();
                fnm = (obj != null && obj != DBNull.Value) ? obj.ToString() : "";
            }

            // SQL Injection થી બચવા Parameterized Query નો ઉપયોગ
            cmd = new SqlCommand("UPDATE users_tbl SET FullName = @FullName, Email = @Email, Phone = @Phone, Bio = @Bio, ImagePath = @ImagePath WHERE Username = @Username", con);
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Bio", txtBio.Text);
            cmd.Parameters.AddWithValue("@ImagePath", fnm);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);

            cmd.ExecuteNonQuery();
            con.Close();

           
            Session["UserEmail"] = txtEmail.Text;
            Session["username"] = txtUsername.Text;

            lblLeftFullName.Text = txtFullName.Text;
            lblLeftPhone.Text = txtPhone.Text;
            lblLeftBio.Text = txtBio.Text;

            if (!string.IsNullOrEmpty(fnm))
            {
                imgLeftProfile.ImageUrl = ResolveUrl(fnm);
                Session["UserProfilePic"] = fnm;
            }

            lblMessage.Text = "<div class='alert alert-success'>Profile updated successfully!</div>";

            Response.Redirect(Request.RawUrl);
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
           
        }
    }
}