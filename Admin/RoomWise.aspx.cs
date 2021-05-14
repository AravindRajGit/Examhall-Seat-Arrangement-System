using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj=new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {
        filldata();
      

        if (!IsPostBack)
        {
            fillRoom();
            fillSubCode();
            fillSchedule();
        }
       

    }
    protected void filldata()//Show Time Table
    {
        string sql = "select * from tbl_timetable apt  inner join tbl_dept dep on apt.dept_id=dep.dept_id inner join tbl_rivision riv on apt.re_id=riv.re_id";

        //SqlDataAdapter adp = new SqlDataAdapter(sql, con);
        //DataTable hs = new DataTable();
        //adp.Fill(hs);

        DataTable dt1 = obj.GetData(sql);
        grdtimetable.DataSource = dt1;
        grdtimetable.DataBind();

    }

    protected void fillSchedule()//Show Roomwise Arrangement
    {
        string sql1 = "select distinct(arr.exam_regno),exam_department,arr.room_desk_pos,rms1.room_no,exam_stuname,exam_sub1,exam_sub2,exam_sub3,exam_sub4,exam_sub5,exam_sub6,exam_sub7,exam_sub8,exam_sub9,exam_sub10,exam_type from tbl_arrangements arr inner join  tbl_examers exm on arr.exam_regno=exm.exam_regno inner join tbl_rooms1 rms1 on arr.room_desk_pos=rms1.room_desk_pos where (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub1='" + ddlSubCodes.SelectedValue + "') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub2='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub3='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub4='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub5='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "'and exm.exam_sub6='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub7='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub8='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub9='"+ddlSubCodes.SelectedValue+"') or  (rms1.room_no='" + ddlRoom.SelectedValue + "' and exm.exam_sub10='" + ddlSubCodes.SelectedValue + "') ";

        //SqlDataAdapter adp = new SqlDataAdapter(sql, con);
        //DataTable hs = new DataTable();
        //adp.Fill(hs);

        DataTable dt2 = obj.GetData(sql1);
        grdArrangement.DataSource = dt2;
        grdArrangement.DataBind();

    }

    public void fillRoom()
    {
        String sel = "select distinct room_no from tbl_rooms1";

        DataTable dt = obj.GetData(sel);
        ddlRoom.DataSource = dt;
        ddlRoom.DataValueField = "room_no";
        ddlRoom.DataTextField = "room_no";
        ddlRoom.DataBind();
        ddlRoom.Items.Insert(0, "---Select---");

        
    }
    public void fillSubCode()
    {
        String sel = @"select distinct(value) 
from tbl_examers
cross apply
(
    values
        ('Sub1', exam_sub1),
        ('Sub2', exam_sub2),
        ('Sub3', exam_sub3),
		('Sub4', exam_sub3),
		('Sub5', exam_sub3),
		('Sub6', exam_sub3),
		('Sub7', exam_sub3),
		('Sub8', exam_sub3),
		('Sub9', exam_sub3),
		('Sub10',exam_sub3)
 )c(col, value)
where value <>0 order by value";


        DataTable dt = obj.GetData(sel);
        ddlSubCodes.DataSource = dt;
        ddlSubCodes.DataValueField = "value";
        ddlSubCodes.DataTextField = "value";
        ddlSubCodes.DataBind();
        ddlSubCodes.Items.Insert(0, "---Select---");


    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        fillSchedule();
    }

    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName =ddlRoom.SelectedValue+ " "+"Hall Exam Arrangement-GPTC" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        grdArrangement.GridLines = GridLines.Both;
        grdArrangement.HeaderStyle.Font.Bold = true;
        grdArrangement.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }
    private void ExportGridToWord()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = ddlRoom.SelectedValue + " " + "Hall Exam Arrangement-GPTC" + DateTime.Now + ".doc";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        grdArrangement.GridLines = GridLines.Both;
        grdArrangement.HeaderStyle.Font.Bold = true;
        grdArrangement.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }
    private void ExportGridToPDF()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = ddlRoom.SelectedValue + " " + "Hall Exam Arrangement-GPTC" + DateTime.Now + ".PDF";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        grdArrangement.GridLines = GridLines.Both;
        grdArrangement.HeaderStyle.Font.Bold = true;
        grdArrangement.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }  
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    protected void btnPdf_Click(object sender, EventArgs e)
    {
        ExportGridToPDF();
    }
    protected void btnWord_Click(object sender, EventArgs e)
    {
        ExportGridToWord();
    }
}