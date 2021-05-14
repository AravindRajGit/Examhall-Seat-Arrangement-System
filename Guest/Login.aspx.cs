using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Guest_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string sel = "select * from tbl_adddept where hod_username='" + txt.Text + "' and  hod_password='"+txtpassword.Text+"'";
        DataTable dt = obj.GetData(sel);


        string sel1 = "select * from tbl_newstudent where s_dob='"+txt.Text+"' and s_reg='"+txtpassword.Text+"' and dept_status='1'";
        DataTable dt1 = obj.GetData(sel1);

        if (dt.Rows.Count > 0)
        {
            Session["hid"] = dt.Rows[0]["hod_id"].ToString();
            Session["hname"] = dt.Rows[0]["hod_name"].ToString();
            Session["deptid"] = dt.Rows[0]["dept_id"].ToString();
            Response.Redirect("../HOD/HomePage.aspx");
        }

        if (dt1.Rows.Count > 0)
        {
            Session["sid"] = dt1.Rows[0]["student_id"].ToString();
            Session["sname"] = dt1.Rows[0]["s_name"].ToString();
            Session["sdeptid"] = dt1.Rows[0]["dept_id"].ToString();
            Response.Redirect("../Student/HomePage.aspx");
        }
        else
        {
            Response.Write("<script>alert('Incorrect Data')</script>");
        }
}
    protected void btncancel_Click(object sender, EventArgs e)
    {
        
    }
}