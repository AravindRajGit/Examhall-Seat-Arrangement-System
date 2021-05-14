<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RoomWise.aspx.cs" Inherits="Admin_Default" %>

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
    <div>
        <asp:GridView ID="grdtimetable" runat="server" AutoGenerateColumns="False" Width="739px">
                    <Columns>
                        <asp:BoundField DataField="dept_name" HeaderText="Department" />
                        <asp:BoundField DataField="timetable_sem" HeaderText="Semester" />
                        <asp:BoundField DataField="timetable_date" HeaderText="Date" DataFormatString="{0:d}" HtmlEncode="False"  />
                        <asp:BoundField DataField="re_name" HeaderText="Rivision Scheme" />
                        <asp:BoundField DataField="timetable_scode" HeaderText="Subject Code" />
                        <asp:BoundField DataField="timetable_time" HeaderText="Time" />
                        <asp:BoundField DataField="timetable_extype" HeaderText="Exam Type" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
    </div>

    <br />
    <br />

    <div>
          <asp:DropDownList ID="ddlRoom" runat="server">
                </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:DropDownList ID="ddlSubCodes" runat="server">
                </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnShow" runat="server" Text="Show Data" OnClick="btnShow_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnExcel" runat="server" Text="Download Excel" OnClick="btnExcel_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnPdf" runat="server" Text="Download PDF" OnClick="btnPdf_Click" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnWord" runat="server" Text="Download Word" OnClick="btnWord_Click" />

    </div>
    <br />
    <br />
    <br />
    <div>
        <asp:GridView ID="grdArrangement" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="651px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="exam_regno" HeaderText="Register No" />
             <asp:BoundField DataField="exam_stuname" HeaderText="Name" />
             <asp:BoundField DataField="exam_type" HeaderText="Exam Type" />
            <asp:BoundField DataField="exam_department" HeaderText="Hall" />
            <asp:BoundField DataField="room_no" HeaderText="Hall No" />
            <asp:BoundField DataField="room_desk_pos" HeaderText="Desk Label" />
           
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    </div>
</asp:Content>

