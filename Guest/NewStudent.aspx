<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/Guest.master" AutoEventWireup="true" CodeFile="NewStudent.aspx.cs" Inherits="Hod_Default" %>

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
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style4">Name</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Enter the name!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">Gender</td>
            <td class="auto-style5">
                <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rblgender" ErrorMessage="Enter the gender!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style4">Email</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter the email!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter the correct format of email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">Contact</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcontact" ErrorMessage="Enter the contact!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style4">Department</td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddldept" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddldept" ErrorMessage="Select the department!" ForeColor="Red" InitialValue="---select---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style4">Semester</td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddlsemester" runat="server">
                    <asp:ListItem>---Select---</asp:ListItem>
                    <asp:ListItem>Semester 1</asp:ListItem>
                    <asp:ListItem>Semester 2</asp:ListItem>
                    <asp:ListItem>Semester 3</asp:ListItem>
                    <asp:ListItem>Semester 4</asp:ListItem>
                    <asp:ListItem>Semester 5</asp:ListItem>
                    <asp:ListItem>Semester 6</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlsemester" ErrorMessage="Select the semester!" ForeColor="Red" InitialValue="---Select---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style4">Date of birth</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtdob" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtdob" ErrorMessage="Enter the date of birth!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style4">Register Number</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtreg" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtreg" ErrorMessage="Enter the register number!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style4">Re-Register Number</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtrereg" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtrereg" ErrorMessage="Enter the re-register number!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="btnsave" runat="server" Font-Bold="True" OnClick="btnsave_Click" Text="Save" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btncancel" runat="server" Font-Bold="True" Text="Cancel" OnClick="btncancel_Click" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

