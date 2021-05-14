using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
    protected void Page_Load(object sender, EventArgs e)
    {
        fillGrid();
        StudentsCount();
        TotalSpace();
    }


    public void fillGrid()
    {

        String sel = " select * from tbl_examers order by exam_regno";
        DataTable dt = obj.GetData(sel);
        grdEamers.DataSource = dt;
        grdEamers.DataBind();
    
    }

    public void StudentsCount()
    {

        string sel = "select COUNT(distinct exam_stuname) as TotalStudents,exam_department from tbl_examers group by exam_department";
        DataTable dtCounts = obj.GetData(sel);
        grdStudents.DataSource = dtCounts;
        grdStudents.DataBind();
    
    }
    public void TotalSpace()
    {

        string sel1 = "select COUNT(*) as TotalSpace,dep.dept_name from tbl_rooms1 rms1 inner join tbl_dept dep on rms1.dept_id=dep.dept_id  group by dept_name";
        DataTable dtSpace = obj.GetData(sel1);
        GridDesks.DataSource = dtSpace;
        GridDesks.DataBind();

    }


    protected void Button1_Click(object sender, EventArgs e)
{
    //Upload and save the file
    if (Path.GetFileName(FileUpload1.PostedFile.FileName) == "")
    {
        Response.Write("<script>alert('Please Choose File')</script>");
    }
    else
    {
    string excelPath = Server.MapPath("~/Assets/StudentData/") + Path.GetFileName(FileUpload1.PostedFile.FileName);

    FileUpload1.SaveAs(excelPath);
   
        string conString = string.Empty;
        string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
        switch (extension)
        {
            case ".xls": //Excel 97-03
                conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07 or higher
                conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                break;

        }
        conString = string.Format(conString, excelPath);
        using (OleDbConnection excel_con = new OleDbConnection(conString))
        {
            excel_con.Open();
            string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
            DataTable dtExcelData = new DataTable();

            // [OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            //dtExcelData.Columns.AddRange(
            //                                    new DataColumn[14] 
            //                                        { 
            //                                                new DataColumn("RegisterNo", typeof(string)),//1
            //                                                new DataColumn("Name", typeof(string)),//2
            //                                                new DataColumn("Sem",typeof(string)),//3
            //                                                new DataColumn("Type",typeof(string)),//4
            //                                                new DataColumn("Sub1",typeof(string)),//5
            //                                                new DataColumn("Sub2",typeof(string)),//6
            //                                                new DataColumn("Sub3",typeof(string)),//7

            //                                                new DataColumn("Sub4",typeof(string)),//8
            //                                                new DataColumn("Sub5",typeof(string)),//9
            //                                                new DataColumn("Sub6",typeof(string)),//10
            //                                                new DataColumn("Sub7",typeof(string)),//11
            //                                                new DataColumn("Sub8",typeof(string)),//12
            //                                                new DataColumn("Sub9",typeof(string)),//13
            //                                                new DataColumn("Sub10",typeof(string))//14


            //                                        }
            //                            );


















            using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
            {
                oda.Fill(dtExcelData);
            }
            excel_con.Close();

            string consString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.tbl_examers";

                    //[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("RegisterNo", "exam_regno"); //1
                    sqlBulkCopy.ColumnMappings.Add("Department", "exam_department");//2
                    sqlBulkCopy.ColumnMappings.Add("Name", "exam_stuname");//3
                    sqlBulkCopy.ColumnMappings.Add("Sem", "exam_sem");//4
                    sqlBulkCopy.ColumnMappings.Add("Type", "exam_type");//5
                    sqlBulkCopy.ColumnMappings.Add("SeatStatus", "exam_seatstatus");//6
                    sqlBulkCopy.ColumnMappings.Add("Sub1", "exam_sub1");//7
                    sqlBulkCopy.ColumnMappings.Add("Sub2", "exam_sub2");//8
                    sqlBulkCopy.ColumnMappings.Add("Sub3", "exam_sub3");//9
                    sqlBulkCopy.ColumnMappings.Add("Sub4", "exam_sub4");//10
                    sqlBulkCopy.ColumnMappings.Add("Sub5", "exam_sub5");//11
                    sqlBulkCopy.ColumnMappings.Add("Sub6", "exam_sub6");//12
                    sqlBulkCopy.ColumnMappings.Add("Sub7", "exam_sub7");//13
                    sqlBulkCopy.ColumnMappings.Add("Sub8", "exam_sub8");//14
                    sqlBulkCopy.ColumnMappings.Add("Sub9", "exam_sub9");//15
                    sqlBulkCopy.ColumnMappings.Add("Sub10", "exam_sub10");//16






                    con.Open();
                    sqlBulkCopy.WriteToServer(dtExcelData);
                    fillGrid();
                    StudentsCount();
                    con.Close();
                }
            }
        }
    }
}

    protected void ScheduleNow_Click(object sender, EventArgs e)
    {
        Response.Redirect("HallArrangement.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string consString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(consString))
        {
            con.Open();
            string del = "delete from tbl_examers";
            SqlCommand cmd = new SqlCommand(del,con);
            cmd.ExecuteNonQuery();
            fillGrid();
            StudentsCount();
            con.Close();
        }
    }
}
