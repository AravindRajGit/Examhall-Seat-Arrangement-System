<%@ Page Title="" Language="C#" MasterPageFile="~/Hod/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Hod_Default" %>

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
            <td class="auto-style2">Welcome</td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

