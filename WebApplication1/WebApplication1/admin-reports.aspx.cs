using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web.Design;
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
    public partial class admin_reports : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        string posterPath = "", ss1Path = "", ss2Path = "", ss3Path = "", ss4Path = "";

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr
    = new ReportDocument();
        static string Crypath = "";
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

        protected void btnMoviesReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from Movies", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/movies.xml");
            ds.WriteXmlSchema(s);


            string path = Server.MapPath("~/Movies.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
              Response, true, "Movies");
        }

        protected void btnWebSeriesReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from WebSeries", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/WebSeries.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/WebSeries.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
            Response, true, "WebSeries");
        }

        protected void btnCartoonReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from Cartoons", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/cartoons.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/Cartoons.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
            Response, true, "Crtoons");
        }

        protected void btnUsersReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from users_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/user.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/user.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
            Response, true, "users_tbl");
        }

        protected void btnCommentsReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from ContactMessages", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/ContactMessages.xml");
            ds.WriteXmlSchema(s);

        }

        protected void btnRequestsReport_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from MovieRequests", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/MovieRequests.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/MovieRequests.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
            Response, true, "MovieRequests");
        }
    }
}