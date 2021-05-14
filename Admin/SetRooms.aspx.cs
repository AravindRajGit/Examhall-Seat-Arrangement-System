using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    public static double DeskCount,DeskPositions;
    public static int i = 0,MaxNo=0;
    public string code = "D";
    public int DeskNo = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDept();
        }
        FillGrid();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        string sel = "select isnull(MAX(room_desk_pos),0) as maxPos from tbl_rooms1";
        DataTable dtMaxpos = obj.GetData(sel);
        MaxNo = Convert.ToInt32(dtMaxpos.Rows[0]["maxPos"]);

        
        
        
        DeskCount = Convert.ToDouble(txtDeskcount.Text);
        DeskPositions = DeskCount * 2;
        
        
        
        
        if (MaxNo == 0)
        {
            for (i = 1; i <= DeskPositions; i++)
            {

                //DeskNo = code + i;
                string ins = "insert into tbl_rooms1(room_no,room_desk_pos,room_desk_fillstatus,dept_id)values('" + txtRoomNo.Text + "','" + i + "','0','" + ddldept.SelectedValue + "')";
                obj.ExecuteData(ins);

            }
        }
        else
        {

            for (i = 1; i <= DeskPositions; i++)
            {

                DeskNo = MaxNo + i;
                string ins = "insert into tbl_rooms1(room_no,room_desk_pos,room_desk_fillstatus,dept_id)values('" + txtRoomNo.Text + "','" + DeskNo + "','0','" + ddldept.SelectedValue + "')";
                obj.ExecuteData(ins);

            }
        
        }
        FillGrid();
        Response.Write("<script>alert('Desk Labeling Completed')</script>");
    }
   
    
    
    
    public void fillDept()
    {
        obj.FillDrop(ddldept, "dept_name", "dept_id", "tbl_dept");
    }


    public void FillGrid()
    {

        string sel = "select * from tbl_rooms1 rms inner join tbl_dept dep on rms.dept_id=dep.dept_id";
        DataTable dtRooms= obj.GetData(sel);
        grdRooms.DataSource = dtRooms;
        grdRooms.DataBind();
    
    
    }
    protected void btnDeleteRooms_Click(object sender, EventArgs e)
    {
        string del = "delete from tbl_rooms1";
        obj.ExecuteData(del);
        Response.Write("<script>alert('Remove all rooms')</script>");
        FillGrid();
    }
}