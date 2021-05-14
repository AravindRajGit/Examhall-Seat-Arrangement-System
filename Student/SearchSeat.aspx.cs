using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Student_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sel="select * from tbl_arrangements arr inner join tbl_rooms1 rms1 on arr.room_desk_pos=rms1.room_desk_pos inner join tbl_examers exm on arr.exam_regno=exm.exam_regno  inner join tbl_dept dep on rms1.dept_id=dep.dept_id where arr.exam_regno='"+txtRegNo.Text+"' and exm.exam_seatstatus='1'";
        DataTable dt = new DataTable();
        dt = obj.GetData(sel);
        if (dt.Rows.Count > 0)
        {
            lblStuname.Text = dt.Rows[0]["exam_stuname"].ToString();
            lblDepartment.Text = dt.Rows[0]["dept_name"].ToString();
            lblRoomNo.Text = dt.Rows[0]["room_no"].ToString();
            lblDeskNumber.Text = dt.Rows[0]["room_desk_pos"].ToString();
        }
        else
        {
            lblStuname.Text = "Not Set";
            lblDepartment.Text = "Not Set";
            lblRoomNo.Text = "Not Set";
            lblDeskNumber.Text = "Not Set";
        
        }
    }
}