<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeFile="SearchSeat.aspx.cs" Inherits="Student_Default" %>

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
            <td class="auto-style6">
                <asp:Label ID="Label" runat="server" Text="Enter RegNo"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtRegNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRegNo" ErrorMessage="Enter Valid Regnumber" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4">
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">Name</td>
            <td class="auto-style3">
                <asp:Label ID="lblStuname" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">Department</td>
            <td class="auto-style9">
                <asp:Label ID="lblDepartment" runat="server"></asp:Label>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">Room No</td>
            <td class="auto-style9">
                <asp:Label ID="lblRoomNo" runat="server"></asp:Label>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">Desk Label</td>
            <td class="auto-style9">
                <asp:Label ID="lblDeskNumber" runat="server"></asp:Label>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

