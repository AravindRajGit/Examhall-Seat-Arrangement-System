<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/guest.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Guest_Default" %>

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
            <td class="auto-style2" colspan="2">
                <h2 class="auto-style5"><strong>Login</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2"></td>
        </tr>
        <tr>
            <td class="auto-style6"><strong>Username/Student DOB</strong></td>
            <td class="auto-style4">
                <asp:TextBox ID="txt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt" ErrorMessage="Enter the username!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Password</strong></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter the password!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click"  Text="Login" Font-Bold="True" />
                &nbsp;
                <asp:Button ID="btncancel" runat="server" Text="Cancel" Font-Bold="True" CausesValidation="False" OnClick="btncancel_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

