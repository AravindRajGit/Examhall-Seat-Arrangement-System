using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ADMIN_Default : System.Web.UI.Page
{
    //SqlConnection con = new SqlConnection("Data Source=DESKTOP-D5ALKTK;Initial Catalog=db_examhall;Integrated Security=True");
    Exam obj = new Exam();
    public static int id, status = 0, flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //con.Open();
        if (!IsPostBack)
        {

            fillDept();
            filldata();
        }


    }


    public void fillDept()
    {


        obj.FillDrop(ddlDept, "dept_name", "dept_id", "tbl_dept");
        //SqlDataAdapter adp = new SqlDataAdapter(sel, con);
        //DataTable dt = new DataTable();
        //adp.Fill(dt);
        // DataTable dt = obj.GetData(sel);
        ////ddlDept.DataSource = dt;
        ////ddlDept.DataTextField = "dept_name";
        ////ddlDept.DataValueField = "dept_id";
        ////ddlDept.DataBind();
        ////ddlDept.Items.Insert(0, "--select--");


    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        //if (status == 1)
        //{
        //    string up = "update tbl_adddept set hod_name='" + txtname.Text + "',hod_contact= '" + txtcontact.Text + "',hod_email='" + txtemail.Text + "',hod_gender='" + rblgender.SelectedValue + "',hod_username='" + txtusername.Text + "' where hod_id='" + id + "'";
        //    SqlCommand cmd = new SqlCommand(up, con);
        //    cmd.ExecuteNonQuery();
        //    Response.Write("<script>alert('SUCCESSFULLY UPDATED')</script>");
        //    filldata();
        //    txtname.Text = "";
        //    txtcontact.Text = "";
        //    rblgender.ClearSelection();
        //    ddlDept.ClearSelection();
        //    txtemail.Text = "";
        //    txtusername.Text = "";
        //    txtpassword.Text = "";

        //}
        //else
        //{

        string sel = "select * from tbl_adddept where hod_username='" + txtusername.Text + "'";
        DataTable dt = obj.GetData(sel);
        if (dt.Rows.Count > 0)
        {

            Response.Write("<script>alert('UserName Already exist')</script>");

        }
        else
        {

            string dns = "insert into tbl_adddept(hod_name,hod_contact,hod_email,hod_gender,hod_username,hod_password,dept_id)values('" + txtname.Text + "','" + txtcontact.Text + "','" + txtemail.Text + "','" + rblgender.SelectedValue + "','" + txtusername.Text + "','" + txtpassword.Text + "','" + ddlDept.SelectedValue + "')";
            //SqlCommand amd = new SqlCommand(dns, con)

            //amd.ExecuteNonQuery();
            obj.ExecuteData(dns);

            Response.Write("<script>alert('INSERTED SUCCESSFULLY')</script>");
            filldata();
            cancel();
        }

    }
    protected void btncanel_Click(object sender, EventArgs e)
    {

        cancel();

    }
    public void cancel()
    {
        txtname.Text = "";
        txtcontact.Text = "";
        txtemail.Text = "";
        rblgender.ClearSelection();
        ddlDept.ClearSelection();
        txtusername.Text = "";
        txtpassword.Text = "";
    }
    protected void filldata()
    {
        string sql = "select * from tbl_adddept apt  inner join tbl_dept dep on apt.dept_id=dep.dept_id";
        //SqlDataAdapter adp = new SqlDataAdapter(sql, con);
        //DataTable hs = new DataTable();
        //adp.Fill(hs);
        DataTable dt1 = obj.GetData(sql);
        grdhod.DataSource = dt1;
        grdhod.DataBind();

    }
    protected void grdhod_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grdhod_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "del")
        {

            string delqry = "delete from tbl_adddept where hod_id=" + id + "";

            obj.ExecuteData(delqry);
            Response.Write("<script>alert('DELETED SUCESSFULLY')</script>");
            filldata();
            cancel();


        }
        //if (e.CommandName == "ed")
        //{

        //    string sel = "select * from tbl_adddept where hod_id=" + id + "";
        //    SqlDataAdapter ad = new SqlDataAdapter(sel, con);
        //    DataTable dt = new DataTable();
        //    ad.Fill(dt);

        //    txtname.Text = dt.Rows[0]["hod_name"].ToString();
        //    txtcontact.Text = dt.Rows[0]["hod_contact"].ToString();
        //    txtemail.Text = dt.Rows[0]["hod_email"].ToString();
        //    rblgender.SelectedValue = dt.Rows[0]["hod_gender"].ToString();
        //    ddlDept.SelectedValue = dt.Rows[0]["dept_id"].ToString();
        //    txtusername.Text = dt.Rows[0]["hod_username"].ToString();
        //    txtpassword.Text = dt.Rows[0]["hod_password"].ToString();
        //    filldata();
        //    status = 1;
        //}
    }
    protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}