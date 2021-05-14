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
    public static int id;
   
   // SqlConnection con = new SqlConnection("Data Source=DESKTOP-D5ALKTK;Initial Catalog=db_examhall;Integrated Security=True");

    Exam obj = new Exam();

    protected void Page_Load(object sender, EventArgs e)
    {
        //con.Open();
        if (!IsPostBack)
        {

            filldata();
        }
   


    }
    protected void btnsave_Click(object sender, EventArgs e)
    {


        string sel = "select * from tbl_dept where dept_name='" + txtdept.Text + "'";
        DataTable dt = obj.GetData(sel);
        if (dt.Rows.Count > 0)
        {

            Response.Write("<script>alert('Department Already exist')</script>");

        }
        else
        {
            string insqry = "insert into tbl_dept(dept_name)values('" + txtdept.Text + "')";
            //SqlCommand cmd = new SqlCommand(insqry, con);
            //cmd.ExecuteNonQuery();

            obj.ExecuteData(insqry);


            Response.Write("<script>alert('Inserted Successfully')</script>");
            filldata();
            txtdept.Text = "";
        
        }
       
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtdept.Text = "";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "del")
        {

            string delqry = "delete from tbl_dept where dept_id=" + id + "";

            obj.ExecuteData(delqry);
            Response.Write("<script>alert('DELETED SUCESSFULLY')</script>");
            filldata();
            txtdept.Text = "";


        }
    }
    protected void filldata()
    {
        string sqle="select * from tbl_dept";
        //SqlDataAdapter cd=new SqlDataAdapter(sqle,con);
        //DataTable ns=new DataTable();
        //cd.Fill(ns);
        DataTable dt1 = obj.GetData(sqle);


        grddept.DataSource = dt1;
        grddept.DataBind();

    }

    protected void grddept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}