using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Exam

{
    SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=db_examhall;Integrated Security=True");
   
	public Exam()
	{


        con.Open();
		//
		// TODO: Add constructor logic here
		//
	}

    public void ExecuteData(string qry)
    {
        SqlCommand cmd = new SqlCommand(qry,con);
        cmd.ExecuteNonQuery();
    }
    public DataTable GetData(string qry)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(qry, con);
        adp.Fill(dt);

        return (dt);
    }

    public void FillGridView(string querystr, GridView grid)
    {
        DataTable dt = GetData(querystr);
        grid.DataSource = dt;
        grid.DataBind();
    }
    public void FillDataList(string querystr, DataList list)
    {
        DataTable dt = GetData(querystr);
        list.DataSource = dt;
        list.DataBind();
    }
    public void FillDetailsView(string querystr, DetailsView list)
    {
        DataTable dt = GetData(querystr);
        list.DataSource = dt;
        list.DataBind();
    }
    public void FillDrop(DropDownList drop, string display, string valfield, string tbl)
    {
        string str = "select " + display + "," + valfield + " from " + tbl + "";
        DataTable dt1 = GetData(str);
        drop.DataSource = dt1;
        drop.DataTextField = display;
        drop.DataValueField = valfield;
        drop.DataBind();
        drop.Items.Insert(0, "---select---");

    }
    public void FillDrop(DropDownList ddl, string display, string valfield, string tbl, string condition1)
    {
        string str = "select " + display + "," + valfield + " from " + tbl + " where " + condition1 + "";
        DataTable dt1 = new DataTable();
        dt1 = GetData(str);
        ddl.DataSource = dt1;
        ddl.DataTextField = display;
        ddl.DataValueField = valfield;
        ddl.DataBind();
        ddl.Items.Insert(0, "---select---");

    }
    public void FillCheck(CheckBoxList chk, string display, string valfield, string tbl)
    {
        string str = "select " + display + "," + valfield + " from " + tbl + "";
        DataTable dt1 = GetData(str);
        chk.DataSource = dt1;
        chk.DataTextField = display;
        chk.DataValueField = valfield;
        chk.DataBind();
    }
    public void FillCheck(CheckBoxList chk, string display, string valfield, string tbl, string condition1)
    {
        string str = "select " + display + "," + valfield + " from " + tbl + " where " + condition1 + "";
        DataTable dt1 = new DataTable(str);
        chk.DataSource = dt1;
        chk.DataTextField = display;
        chk.DataValueField = valfield;
        chk.DataBind();
    }


}