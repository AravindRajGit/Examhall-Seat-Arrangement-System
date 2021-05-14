<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SetRooms.aspx.cs" Inherits="Admin_Default" %>

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
            <td class="auto-style3">Department</td>
            <td class="auto-style2">
                <asp:DropDownList ID="ddldept" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Room No</td>
            <td>
                <asp:TextBox ID="txtRoomNo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Total Desk</td>
            <td>
                <asp:TextBox ID="txtDeskcount" runat="server" Height="23px" Width="123px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
            &nbsp;&nbsp;
                <asp:Button ID="btnDeleteRooms" runat="server" OnClick="btnDeleteRooms_Click" Text="Remove All Rooms" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4" colspan="2">
                <asp:GridView ID="grdRooms" runat="server" Width="459px" BackColor="White" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="dept_name" HeaderText="Department" />
                        <asp:BoundField DataField="room_no" HeaderText="Room Number" />
                        <asp:BoundField DataField="room_desk_pos" HeaderText="Desk Number" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

