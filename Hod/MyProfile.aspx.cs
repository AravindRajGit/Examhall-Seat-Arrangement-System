using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Hod_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {
        //con.Open();
        if (!IsPostBack)
        {

            filldata();
            filldata();
        }

    }
    protected void filldata()
    {
         string sql = "select * from tbl_adddept apt  inner join tbl_dept dep on apt.dept_id=dep.dept_id where hod_id='"+Session["hid"]+"'";
        //SqlDataAdapter cd=new SqlDataAdapter(sqle,con);
        //DataTable ns=new DataTable();
        //cd.Fill(ns);
        DataTable dt1 = obj.GetData(sql);
        dtshod.DataSource = dt1;
        dtshod.DataBind();

    }
    protected void dtshod_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}