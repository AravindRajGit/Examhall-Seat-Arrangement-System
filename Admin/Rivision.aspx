<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Rivision.aspx.cs" Inherits="Admin_Default" %>

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
    <table class="nav-justified">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Rivision</td>
            <td>
                <asp:TextBox ID="txtrivision" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
            <td class="auto-style10"></td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style8">
                <asp:Button ID="btnsave" runat="server" Font-Bold="True" OnClick="btnsave_Click" Text="Save" Width="75px" />
                <asp:Button ID="btnCancel" runat="server" Font-Bold="True" OnClick="btnCancel_Click" Text="Cancel" />
            </td>
            <td class="auto-style11"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

