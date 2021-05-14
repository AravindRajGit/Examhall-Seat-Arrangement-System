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
        if (!IsPostBack)
        {
            fillDept();
            cancel();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string dns = "insert into tbl_newstudent(s_name,s_gender,s_email,s_contact,s_semester,s_dob,s_reg,dept_id,dept_status)values('" + txtname.Text + "','" + rblgender.SelectedValue + "','" + txtemail.Text + "','" + txtcontact.Text + "','" + ddlsemester.SelectedValue + "','" + txtdob.Text + "','" + txtreg.Text + "','" + ddldept.SelectedValue + "','" + 0 + "')";
        obj.ExecuteData(dns);

        Response.Write("<script>alert('INSERTED SUCCESSFULLY')</script>");
    }
    public void fillDept()
    {


        obj.FillDrop(ddldept, "dept_name", "dept_id", "tbl_dept");
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        cancel();
    }
         public void cancel()
    {
        txtname.Text = "";
        rblgender.ClearSelection();
        txtemail.Text = "";
        txtcontact.Text="";
        ddlsemester.ClearSelection();
        ddldept.ClearSelection();
        txtdob.Text = "";
        txtreg.Text = "";
        txtrereg.Text = "";
    }
    }
