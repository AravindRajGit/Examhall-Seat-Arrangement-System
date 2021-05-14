<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UploadExcel.aspx.cs" Inherits="Admin_Default" %>

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
   <fieldset>
        <legend>Upload Data</legend>
    <table>
        <tr>
            <td>Excel Sheet</td>
            <td><asp:FileUpload ID="FileUpload1" runat="server" /><asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click"  /></td> 
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ScheduleNow" runat="server" OnClick="ScheduleNow_Click" Text="ScheduleNow" />
            </td>
            <td>
                <asp:Button ID="btnDelete" runat="server" Text="Clear All" OnClick="btnDelete_Click" /></td>
            <td>
                <asp:GridView ID="grdStudents" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="exam_department" HeaderText="Department" />
                        <asp:BoundField DataField="TotalStudents" HeaderText="Total Students" />
                    </Columns>
                </asp:GridView>
            </td>
             <td>
                <asp:GridView ID="GridDesks" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="dept_name" HeaderText="Department" />
                        <asp:BoundField DataField="TotalSpace" HeaderText="Total Space" />
                    </Columns>
                </asp:GridView>
            </td>
       </tr>
        </table>
        </fieldset>
    <br />
    <br />
    <br />
      
        <div align="center">
                <asp:GridView ID="grdEamers" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="418px" Width="1226px">
                    <Columns>
                        <asp:BoundField HeaderText="Register No" DataField="exam_regno" />
                        <asp:BoundField HeaderText="Student Name" DataField="exam_stuname" />
                          <asp:BoundField HeaderText="Department" DataField="exam_department" />
                        <asp:BoundField HeaderText="Semester" DataField="exam_sem" />
                        <asp:BoundField HeaderText="Type" DataField="exam_type" />
                        <asp:BoundField HeaderText="Seat Status" DataField="exam_seatstatus" />
                        <asp:BoundField HeaderText="Sub1" DataField="exam_sub1" />
                        <asp:BoundField HeaderText="Sub2" DataField="exam_sub2" />
                        <asp:BoundField HeaderText="Sub3" DataField="exam_sub3" />
                        <asp:BoundField HeaderText="Sub4" DataField="exam_sub4" />
                        <asp:BoundField HeaderText="Sub5" DataField="exam_sub5" />
                        <asp:BoundField HeaderText="Sub6" DataField="exam_sub6" />
                        <asp:BoundField HeaderText="Sub7" DataField="exam_sub7" />
                        <asp:BoundField HeaderText="Sub8" DataField="exam_sub8" />
                        <asp:BoundField HeaderText="Sub9" DataField="exam_sub9" />
                        <asp:BoundField HeaderText="Sub10" DataField="exam_sub10" />
                    </Columns>
                   
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                   
                </asp:GridView>

        </div>
      
</asp:Content>

