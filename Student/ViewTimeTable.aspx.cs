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
        fillGrid();
    }
    public void fillGrid()
    {

        String sel = "select * from tbl_timetable tt inner join tbl_dept dep on tt.dept_id=dep.dept_id inner join tbl_rivision riv on tt.re_id=riv.re_id";
        DataTable dt = new DataTable();
        dt = obj.GetData(sel);
        grdTimeTable.DataSource = dt;
        grdTimeTable.DataBind();
    
    }
}