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
    Exam obj= new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            filldata();
            Accepteddata();
        }


    }
    public void filldata()
    {
        string sel = "select * from tbl_newstudent nst inner join tbl_dept dep on nst.dept_id=dep.dept_id where nst.dept_id='"+Session["deptid"]+"' and dept_status='0'";
        DataTable dt1 = obj.GetData(sel);
        grdvarify.DataSource = dt1;
        grdvarify.DataBind();
    }



    public void Accepteddata()
    {
        string sel = "select * from tbl_newstudent nst inner join tbl_dept dep on nst.dept_id=dep.dept_id where nst.dept_id='" + Session["deptid"] + "' and dept_status='1'";
        DataTable dt1 = obj.GetData(sel);
        grdStuList.DataSource = dt1;
        grdStuList.DataBind();
    }






    
    protected void grdvarify_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id=0;
        id=Convert.ToInt32(e.CommandArgument);

        if(e.CommandName=="acpt"){
        string up="update tbl_newstudent set dept_status='1' where student_id='"+id+"'";
        obj.ExecuteData(up);
        }
        else{
        
         string up="delete tbl_newstudent  where student_id='"+id+"'";
        obj.ExecuteData(up);
        
        }

        filldata();
        Accepteddata();
        }

    protected void grdStuList_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void grdvarify_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
