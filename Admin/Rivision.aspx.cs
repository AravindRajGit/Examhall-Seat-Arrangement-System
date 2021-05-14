using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string insqry = "insert into tbl_rivision(re_name)values('" + txtrivision.Text + "')";
        
        obj.ExecuteData(insqry);
        Response.Write("<script>alert('Inserted Successfully')</script>");
        txtrivision.Text = "";

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtrivision.Text = "";
    }
}