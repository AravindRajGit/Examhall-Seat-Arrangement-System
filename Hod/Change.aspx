<%@ Page Title="" Language="C#" MasterPageFile="~/Hod/MasterPage.master" AutoEventWireup="true" CodeFile="Change.aspx.cs" Inherits="Hod_Default" %>

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
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Old Password</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtold" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtold" ErrorMessage="Enter the old password!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">New Password</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtnew" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnew" ErrorMessage="Enter the new password!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtnew" ErrorMessage="The password should contain atleast 6-10 digits!" ForeColor="Red" ValidationExpression="^[0-9A-Za-z]{6,10}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Confirm Password</td>
            <td>
                <asp:TextBox ID="txtconfirm" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirm" ErrorMessage="Enter the password to confirm!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnew" ControlToValidate="txtconfirm" ErrorMessage="The password don't match.Please reset!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Change" />
&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Font-Bold="True" OnClick="Button2_Click" Text="Cancel" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>

