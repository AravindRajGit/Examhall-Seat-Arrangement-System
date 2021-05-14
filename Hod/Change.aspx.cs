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
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string oldpass = "", currentpass = "";
        string sel = "select * from tbl_adddept where hod_id='" + Session["hid"] + "'";
        DataTable dt = obj.GetData(sel);
        oldpass= dt.Rows[0]["hod_password"].ToString();
        currentpass = txtold.Text;
        if (oldpass == currentpass)
        {

            if (txtconfirm.Text == txtnew.Text)
            {
                string up = "update tbl_adddept set hod_password='" + txtnew.Text + "' where hod_id='" + Session["hid"] + "'";
                obj.ExecuteData(up);
                Response.Write("<script>alert('SUCCESSFULLY UPDATED')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Old password is invalid')</script>");
        }
        txtold.Text = "";
        txtnew.Text = "";
        txtconfirm.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtold.Text = "";
        txtnew.Text = "";
        txtconfirm.Text = "";
    }
}