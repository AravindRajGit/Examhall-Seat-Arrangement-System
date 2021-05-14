using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_Default : System.Web.UI.Page
{
    Exam obj = new Exam();
   public String Selectedpos = "";
    double[] Evenpos = new double[500];
    double[] oddPos = new double[500];
    double[] StudentsReg = new double[500];
    
   public static int i = 0, j = 0, k = 0, m = 0,n=0, deskoddPos = 0,deskEvenPos = 0, StudentCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDept();
          
           
            
        }
        StudentsCount();
        TotalSpace(); 
        ExamersSeatStatus();
        NonArranged();
        Arranged();
        NotArrangedStudents();
        NotFilledSeats();
       

    }

    public void NotFilledSeats()
    {
        string sel = " select COUNT(room_desk_fillstatus) as freeSeat from tbl_rooms1 where room_desk_fillstatus='0'  ";
        DataTable deskCount = obj.GetData(sel);
        lblTotalSeat.Text = deskCount.Rows[0]["freeSeat"].ToString();

    }

    public void NotArrangedStudents()
    {
        string sel = " select COUNT(distinct exam_regno) as totalStudents from tbl_examers where exam_seatstatus='0' ";
        DataTable StuCount = obj.GetData(sel);
        lblTotalStudents.Text = StuCount.Rows[0]["totalStudents"].ToString();
    
    }


    public void StudentsCount()
    {

        string sel = "select COUNT(distinct exam_regno) as TotalStudents,exam_department from tbl_examers group by exam_department order by TotalStudents";
        DataTable dtCounts = obj.GetData(sel);
        grdStudents.DataSource = dtCounts;
        grdStudents.DataBind();
        

    }
    public void TotalSpace()
    {

        string sel1 = "select COUNT(*) as TotalSpace,dep.dept_name from tbl_rooms1 rms1 inner join tbl_dept dep on rms1.dept_id=dep.dept_id  group by dept_name order by TotalSpace";
        DataTable dtSpace = obj.GetData(sel1);
        GridDesks.DataSource = dtSpace;
        GridDesks.DataBind();

    }
    public void fillDept()//Function For Read Department
    {
        obj.FillDrop(ddldept, "dept_name", "dept_id", "tbl_dept");

    }
    public void selectStudents()//Function for Select students based on department
    {

        string selStudents = "select  distinct exam_regno from tbl_examers where exam_department='" + ddldept.SelectedItem + "' and exam_seatstatus='0'";
        DataTable dtStudents = obj.GetData(selStudents);
        StudentCount = dtStudents.Rows.Count;
       
       


        for (m = 0; m < dtStudents.Rows.Count; m++)
        {
            StudentsReg[m] = Convert.ToDouble(dtStudents.Rows[m]["exam_regno"]);//Store all students regno to Array StudentsReg

        }

    }


    public void NonArranged()
    {

        string selCivilRemain = "select COUNT( distinct exam_regno)as CivilCount from tbl_examers where exam_department='Civil' and exam_seatstatus='0'";
        DataTable dtCivilRemain = obj.GetData(selCivilRemain);
        lblLeftCivil.Text = dtCivilRemain.Rows[0]["CivilCount"].ToString();


        string selMechRemain = "select COUNT( distinct exam_regno)as MechCount from tbl_examers where exam_department='Mechanical' and exam_seatstatus='0'";
        DataTable dtMechRemain = obj.GetData(selMechRemain);
        lblLeftMech.Text = dtMechRemain.Rows[0]["MechCount"].ToString();


        string selElectricRemain = "select COUNT( distinct exam_regno)as ElectricCount from tbl_examers where exam_department='Electronics' and exam_seatstatus='0'";
        DataTable dtElectricalRemain = obj.GetData(selElectricRemain);
        lblLeftElec.Text = dtElectricalRemain.Rows[0]["ElectricCount"].ToString();


        string selComputerRemain = "select COUNT( distinct exam_regno)as ComputerCount from tbl_examers where exam_department='Computer' and exam_seatstatus='0'";
        DataTable dtComputerRemain = obj.GetData(selComputerRemain);
        lblLeftComp.Text = dtComputerRemain.Rows[0]["ComputerCount"].ToString();
    
    
    
    
    }


    public void Arranged()
    {

        string selCivilCount = "select COUNT( distinct exam_regno)as CivilCount from tbl_examers where exam_department='Civil' and exam_seatstatus='1'";
        DataTable dtCivilCount = obj.GetData(selCivilCount);
        lblCivilCount.Text = dtCivilCount.Rows[0]["CivilCount"].ToString();


        string selMechCount = "select COUNT( distinct exam_regno)as MechCount from tbl_examers where exam_department='Mechanical' and exam_seatstatus='1'";
        DataTable dtMechCount = obj.GetData(selMechCount);
        lblMechanicalCount.Text = dtMechCount.Rows[0]["MechCount"].ToString();


        string selElectricCount = "select COUNT( distinct exam_regno)as ElectricCount from tbl_examers where exam_department='Electronics' and exam_seatstatus='1'";
        DataTable dtElectricalCount = obj.GetData(selElectricCount);
        lblElectricalCount.Text = dtElectricalCount.Rows[0]["ElectricCount"].ToString();


        string selComputerCount = "select COUNT( distinct exam_regno)as ComputerCount from tbl_examers where exam_department='Computer' and exam_seatstatus='1'";
        DataTable dtComputerCount = obj.GetData(selComputerCount);
        lblComputerCount.Text = dtComputerCount.Rows[0]["ComputerCount"].ToString();




    }
   
    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //double[] StudentsCountArray = new double[StudentCount];
        selectStudents();
        
       
        string sel = "select  * from tbl_rooms1 where room_desk_fillstatus='0'";
        DataTable dtDeskpos = obj.GetData(sel);
        Selectedpos = rdbPos.SelectedValue;
        j = 0;
        n = 0;

        if (dtDeskpos.Rows.Count > 0)
        {
            
            
            
            
                //Odd Side Arrangment##########
           
            
            
            if (Selectedpos == "OddPositions")
            {
                for (i = 0; i < dtDeskpos.Rows.Count; i++)//Odd Side Arrangement
                {//For Loop-1

                    deskoddPos = Convert.ToInt32(dtDeskpos.Rows[i]["room_desk_pos"]);
                    if (deskoddPos % 2 != 0)//Check odd position
                    {

                        oddPos[j] = deskoddPos;//Store all odd positions to the Array oddpos
                        j++;
                        //Response.Write(j);



                    }

                }//For Loop-1

                if (j == 0)
                {

                    Response.Write("<script>alert('No odd Space Remain')</script>");
                }
                else
                {
                    for (k = 0; k <= StudentCount - 1; k++)    //Assign Students to Odd Positions
                    {//For Loop-2
                      
                            if (k >= j)
                            {
                                Response.Write("<script>alert('No Space Remain So System Couldnot Arrange all Students')</script>");
                                break;

                            }
                            else
                            {

                                string ins = "insert into tbl_arrangements(exam_regno,room_desk_pos)values('" + StudentsReg[k] + "','" + oddPos[k] + "')";
                                obj.ExecuteData(ins);

                                string up = "update tbl_rooms1 set room_desk_fillstatus='1' where room_desk_pos='" + oddPos[k] + "' ";
                                obj.ExecuteData(up);

                                string up1 = "update tbl_examers set exam_seatstatus='1' where exam_regno='" + StudentsReg[k] + "' ";
                                obj.ExecuteData(up1);
                                
                            }
                        



                        // StudentCount = StudentCount + 1;
                    }//For Loop-2

                    Response.Write("<script>alert('Arrangemet Completed in Odd Positions')</script>");

                }



            }
           
            
            //Even Side Arrangement
            
            else //Start Even Side Arrangwmwnt
            {



                for (i = 0; i < dtDeskpos.Rows.Count; i++)  
                {//For Loop-3

                   
                    deskEvenPos = Convert.ToInt32(dtDeskpos.Rows[i]["room_desk_pos"]);
                    if (deskEvenPos % 2 == 0)//Check odd position
                    {

                        Evenpos[n] = deskEvenPos;//Store all odd positions to the Array Evenpos
                        n++;



                    }

                }//For Loop-3

                if (n == 0)
                {

                    Response.Write("<script>alert('No Even Space Remain')</script>");

                }
                else
                {
                    for (k = 0; k <= StudentCount - 1; k++)      //Assign Students to Even positions
                    {//For Loop-4

                        if (k >= n)
                        {
                            Response.Write("<script>alert('No Space Remain')</script>");
                            break;

                        }
                        string ins = "insert into tbl_arrangements(exam_regno,room_desk_pos)values('" + StudentsReg[k] + "','" + Evenpos[k] + "')";
                        obj.ExecuteData(ins);
                        string up = "update tbl_rooms1 set room_desk_fillstatus='1' where room_desk_pos='" + Evenpos[k] + "' ";
                        obj.ExecuteData(up);

                        string up1 = "update tbl_examers set exam_seatstatus='1' where exam_regno='" + StudentsReg[k] + "' ";
                        obj.ExecuteData(up1);


                        // StudentCount = StudentCount + 1;
                    }//For Loop-4

                    Response.Write("<script>alert('Arrangemet Completed in Even Positions')</script>");
                }
            
            
            
            }//End Even Side Arrangement
        }
        else
        {

            Response.Write("<script>alert('All Spaces Are Filled')</script>");
        
        }
        ExamersSeatStatus();
        NonArranged();
        Arranged();
        NotArrangedStudents();
        NotFilledSeats();
       
    }
    
    
    
    protected void btnResetRooms_Click(object sender, EventArgs e)
    {
        resetAll();
        NonArranged();
        Arranged();
        NotArrangedStudents();
        NotFilledSeats();
       
       
    }


    public void ExamersSeatStatus()
    {

        string selCivil = "select distinct exam_regno from tbl_examers where exam_department='Civil' and exam_seatstatus='0'";
        DataTable dtCivil = obj.GetData(selCivil);
        if (dtCivil.Rows.Count == 0)
        {
            lblCivil.Text = "All Students Are Arranged";
        
        }


      
        if (dtCivil.Rows.Count == 0)
        {
            lblCivil.Text = "All Students Are Arranged";

        }


        string selMechanical = "select distinct exam_regno from tbl_examers where exam_department='Mechanical' and exam_seatstatus='0'";
        DataTable dtMechanic = obj.GetData(selMechanical);
        if (dtMechanic.Rows.Count == 0)
        {
            lblMechanical.Text = "All Students Are Arranged";

        }


        string selElectrical = "select distinct exam_regno from tbl_examers where exam_department='Electronics' and exam_seatstatus='0'";
        DataTable dtElectronics = obj.GetData(selElectrical);
        if (dtElectronics.Rows.Count == 0)
        {
            lblElectrical.Text = "All Students Are Arranged";

        }


        string selComputer = "select distinct exam_regno from tbl_examers where exam_department='Computer' and exam_seatstatus='0'";
        DataTable dtComputer = obj.GetData(selComputer);
        if (dtComputer.Rows.Count == 0)
        {
            lblComputer.Text = "All Students Are Arranged";

        }
    
    
    }
    public void resetAll()
    {

        string up = "update tbl_rooms1 set room_desk_fillstatus='0'";
        obj.ExecuteData(up);
        string up1 = "update tbl_examers set exam_seatstatus='0'";
        obj.ExecuteData(up1);

       string del = "delete from tbl_arrangements";
       obj.ExecuteData(del);
       Arranged();

        //Response.Write("<script>alert('Reset All Rooms')</script>");

       Response.Redirect("HallArrangement.aspx");
    
    
    }




   


}
