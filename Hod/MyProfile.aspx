<%@ Page Title="" Language="C#" MasterPageFile="~/Hod/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Hod_Default" %>

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
            <td class="auto-style2" colspan="3">
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">HOD Details </span></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                &nbsp;<asp:DetailsView ID="dtshod" runat="server" AutoGenerateRows="False" Height="50px" Width="303px" OnPageIndexChanging="dtshod_PageIndexChanging">
                    <Fields>
                        <asp:BoundField DataField="hod_name" HeaderText="Name" />
                        <asp:BoundField DataField="dept_name" HeaderText="Department" />
                        <asp:BoundField DataField="hod_contact" HeaderText="Contact" />
                        <asp:BoundField DataField="hod_email" HeaderText="E-mail" />
                        <asp:BoundField DataField="hod_gender" HeaderText="Gender" />
                    </Fields>
                </asp:DetailsView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

