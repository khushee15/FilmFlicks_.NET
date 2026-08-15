using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;



namespace WebApplication1
{
    public partial class myprofile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
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

        private void LoadUserProfile(string email)
        {
            getcon();
            string query = "SELECT FullName, Username, Email, Phone, Bio, ImagePath FROM users_tbl WHERE Email = @Email";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtFullName.Text = dr["FullName"].ToString();
                txtUsername.Text = dr["Username"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"] != DBNull.Value ? dr["Phone"].ToString() : "";
                txtBio.Text = dr["Bio"] != DBNull.Value ? dr["Bio"].ToString() : "";

                lblLeftFullName.Text = dr["FullName"].ToString();
                lblLeftUsername.Text = dr["Username"].ToString();
                lblLeftPhone.Text = string.IsNullOrEmpty(txtPhone.Text) ? "Not Provided" : txtPhone.Text;
                lblLeftBio.Text = string.IsNullOrEmpty(txtBio.Text) ? "No bio added yet." : txtBio.Text;

                if (dr["ImagePath"] != DBNull.Value && !string.IsNullOrEmpty(dr["ImagePath"].ToString()))
                {
                    string imgPath = dr["ImagePath"].ToString();
                    imgLeftProfile.ImageUrl = ResolveUrl(imgPath);
                    imgNavAvatar.ImageUrl = ResolveUrl(imgPath);
                }
            }
            dr.Close();
            con.Close();
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            getcon();
            string imagePath = imgLeftProfile.ImageUrl;

            if (fileUploadAvatar.HasFile)
            {
                string ext = Path.GetExtension(fileUploadAvatar.FileName).ToLower();
                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName = Guid.NewGuid().ToString() + ext;
                    string savePath = "~/Uploads/" + fileName;
                    fileUploadAvatar.SaveAs(folderPath + fileName);
                    imagePath = savePath;
                }
                else
                {
                    lblMessage.Text = "<div class='alert alert-danger'>Only JPG, JPEG, and PNG images are allowed!</div>";
                    con.Close();
                    return;
                }
            }

            string query = "UPDATE users_tbl SET FullName = @Name, Email = @Email, Phone = @Phone, Bio = @Bio, ImagePath = @ImagePath WHERE Username = @Username";
            cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Bio", txtBio.Text.Trim());
            cmd.Parameters.AddWithValue("@ImagePath", imagePath);
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());

            cmd.ExecuteNonQuery();
            con.Close();

            lblLeftFullName.Text = txtFullName.Text.Trim();
            lblLeftPhone.Text = string.IsNullOrEmpty(txtPhone.Text) ? "Not Provided" : txtPhone.Text;
            lblLeftBio.Text = string.IsNullOrEmpty(txtBio.Text) ? "No bio added yet." : txtBio.Text;
            imgLeftProfile.ImageUrl = ResolveUrl(imagePath);
            imgNavAvatar.ImageUrl = ResolveUrl(imagePath);

            Session["UserEmail"] = txtEmail.Text.Trim();

            lblMessage.Text = "<div class='alert alert-success'>Profile updated successfully!</div>";
        
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
           
        }
    }
}