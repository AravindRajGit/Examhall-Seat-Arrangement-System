using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    public static int id = 0,flag;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
           filldata();
            fillDept();
            fillrev();
            cancel();
        }
    }
    public void fillDept()
    {


        obj.FillDrop(ddldept, "dept_name", "dept_id", "tbl_dept");
    }
    public void fillrev()
    {


        obj.FillDrop(ddlrevision, "re_name", "re_id", "tbl_rivision");
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (flag == 1)
        {
            string up = "update tbl_timetable set timetable_sem='" + ddlsem.SelectedValue + "',timetable_extype='" + rbltype.SelectedValue + "',timetable_scode='" + txtcode.Text + "',timetable_time='" + rbltime.SelectedValue + "',timetable_date='" + txtdate.Text + "',re_id='" + ddlrevision.SelectedValue + "' where timetable_id='"+flag+"' ";
            obj.ExecuteData(up);
            flag = 0;
            cancel();
        
        
        }
        else
        {
            string ins = "insert into tbl_timetable(timetable_sem,timetable_extype,timetable_scode,timetable_time,timetable_date,re_id,dept_id)values('" + ddlsem.SelectedValue + "','" + rbltype.SelectedValue + "','" + txtcode.Text + "','" + rbltime.SelectedValue + "','" + txtdate.Text + "','" + ddlrevision.SelectedValue + "','" + ddldept.SelectedValue + "')";
            obj.ExecuteData(ins);

            Response.Write("<script>alert('INSERTED SUCCESSFULLY')</script>");
            filldata();
        }

    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        cancel();
    }
    public void cancel()
    {
        ddldept.ClearSelection();
        txtdate.Text = "";
        ddlsem.ClearSelection();
        rbltime.ClearSelection();
        txtcode.Text="";
        rbltype.ClearSelection();

    }
    protected void filldata()
    {
        string sql = "select * from tbl_timetable apt  inner join tbl_dept dep on apt.dept_id=dep.dept_id inner join tbl_rivision riv on apt.re_id=riv.re_id";
       
        //SqlDataAdapter adp = new SqlDataAdapter(sql, con);
        //DataTable hs = new DataTable();
        //adp.Fill(hs);
       
        DataTable dt1 = obj.GetData(sql);
        grdtimetable.DataSource = dt1;
        grdtimetable.DataBind();

    }

    protected void ddldept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnDeleteAll_Click(object sender, EventArgs e)
    {
        string del = "delete from tbl_timetable";
        obj.ExecuteData(del);
        filldata();
    }
    protected void grdtimetable_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "del")
        {

            string del = "delete from tbl_timetable";
            obj.ExecuteData(del);


        }
        else
        {
            string sel = "select * from tbl_timetable where timetable_id='" + id + "'";
            DataTable dt = obj.GetData(sel);
            ddldept.SelectedValue = dt.Rows[0]["dept_id"].ToString();
            ddlsem.SelectedValue = dt.Rows[0]["timetable_sem"].ToString();
            txtdate.Text = dt.Rows[0]["timetable_date"].ToString();
            ddlrevision.SelectedValue = dt.Rows[0]["re_id"].ToString();
            txtcode.Text = dt.Rows[0]["timetable_scode"].ToString();
            rbltime.SelectedValue = dt.Rows[0]["timetable_time"].ToString();
            rbltype.SelectedValue = dt.Rows[0]["timetable_extype"].ToString();
            flag = 1;

        
        }
    }
}