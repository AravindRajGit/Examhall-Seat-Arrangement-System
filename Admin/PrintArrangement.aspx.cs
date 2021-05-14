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


//using System;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Configuration;
//using System.Data.SqlClient;

//using System.Web;  
  
public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {
        fillGrid();
    }

    public void fillGrid()
    {

        string sel = "select distinct(arr.exam_regno),exam_department,arr.room_desk_pos,room_no from tbl_arrangements arr inner join  tbl_examers exm on arr.exam_regno=exm.exam_regno inner join tbl_rooms1 rms1 on arr.room_desk_pos=rms1.room_desk_pos";
        DataTable dt = new DataTable();
        dt = obj.GetData(sel);
        grdArrangement.DataSource = dt;
        grdArrangement.DataBind();
    
    }
    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Exam Arrangement-GPTC" + DateTime.Now + ".xls";
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        ExportGridToExcel(); 
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }  
}