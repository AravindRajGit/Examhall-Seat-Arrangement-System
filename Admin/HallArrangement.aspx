<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HallArrangement.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
   <style> 
            table, th, td { 
                /*border: 2px solid green;*/ 
                /*text-align:center;*/ 
            }
            th, td { 
                padding: 5px; 
                background-color:none; 
            } 
              
            /*h1 { 
            color:green; 
            }*/ 
        </style>  
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style6">Select Studetns</td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddldept" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                (Department Wise)</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td rowspan="3"> 
               
                <asp:GridView ID="grdStudents" runat="server" AutoGenerateColumns="False" style="margin-left: 0px; margin-top: 0px;">
                    <Columns>
                        <asp:BoundField DataField="exam_department" HeaderText="Department" />
                        <asp:BoundField DataField="TotalStudents" HeaderText="Total Students" />
                    </Columns>
                </asp:GridView>
            </td>
            <td rowspan="3">
                <asp:GridView ID="GridDesks" runat="server" AutoGenerateColumns="False" Height="147px">
                    <Columns>
                        <asp:BoundField DataField="dept_name" HeaderText="Department" />
                        <asp:BoundField DataField="TotalSpace" HeaderText="Total Space" />
                    </Columns>
                </asp:GridView>
            </td>
         
           
            <td rowspan="3">
                &nbsp;</td>
           
        </tr>
        <tr>
            <td class="auto-style6">Desk Positions</td>
            <td class="auto-style5">
                <asp:RadioButtonList ID="rdbPos" runat="server" RepeatDirection="Horizontal" Width="286px">
                    <asp:ListItem Value="OddPositions">Odd Positions</asp:ListItem>
                    <asp:ListItem Value="EvenPositions">EvenPositions</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Arrange" />
            </td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="2"> 
                </td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2"> 
                Total Students(Not Arranged):&nbsp;&nbsp;
                <asp:Label ID="lblTotalStudents" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2"> 
                Total Seat (Not filled):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblTotalSeat" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2"> 
                <asp:Button ID="btnResetRooms" runat="server" OnClick="btnResetRooms_Click" Text="Reset All Rooms" Width="134px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2"> 
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2"> 
                &nbsp;</td>
        </tr>
    </table>
    
    
    <%--###############################################################################--%>
    
    
    
    <div align="left">
     <fieldset>
                <legend>Arrangement</legend>
         
            <td rowspan="3">Civil Students:<asp:Label ID="lblCivil" runat="server"></asp:Label>
                <br />
                Mechanical Students:<asp:Label ID="lblMechanical" runat="server"></asp:Label>
                <br />
                Electrical Students:<asp:Label ID="lblElectrical" runat="server"></asp:Label>
                <br />
                Computer Students:<asp:Label ID="lblComputer" runat="server"></asp:Label>
            </td>
                   </fieldset>
        </div>
      
    
    





     
    <fieldset>
        <div align="left">
        <legend>Non Arranged Students</legend>
              
            <td rowspan="3">
                Civil :<asp:Label ID="lblLeftCivil" runat="server"></asp:Label>
                <br />
                Mechanical :<asp:Label ID="lblLeftMech" runat="server"></asp:Label>
                <br />
                Electrical :<asp:Label ID="lblLeftElec" runat="server"></asp:Label>
                <br />
                Computer :<asp:Label ID="lblLeftComp" runat="server"></asp:Label>
            </td>
        </div>
    </fieldset>









    
    
    
    <fieldset>
        <div align="left">
        <legend> Arranged Students</legend>
              
            <td rowspan="3">
                Civil :<asp:Label ID="lblCivilCount" runat="server"></asp:Label>
                <br />
                Mechanical :<asp:Label ID="lblMechanicalCount" runat="server"></asp:Label>
                <br />
                Electrical :<asp:Label ID="lblElectricalCount" runat="server"></asp:Label>
                <br />
                Computer :<asp:Label ID="lblComputerCount" runat="server"></asp:Label>
            </td>
               </div>
        
    </fieldset>
    
    
    
   





     <%--###############################################################################--%>
</asp:Content>
