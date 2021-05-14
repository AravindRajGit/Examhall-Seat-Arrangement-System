<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/Admin.master" AutoEventWireup="true" CodeFile="AddDepartmnet.aspx.cs" Inherits="ADMIN_Default" %>

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
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style11">Name</td>
            <td class="auto-style12">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtname" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter the name!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Contact</td>
            <td class="auto-style6">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtcontact" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcontact" ErrorMessage="Enter the contact!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><strong>Email</strong></td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtemail" runat="server" Width="180px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter the email!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"><strong>Gender</strong></td>
            <td class="auto-style9">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButtonList ID="rblgender" runat="server" Width="180px" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rblgender" ErrorMessage="Enter the gender!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style17"><strong>Department</strong></td>
            <td class="auto-style18">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlDept" runat="server" Width="180px" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlDept" ErrorMessage="Select the department!" ForeColor="Red" InitialValue="---select---"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><strong>Username</strong></td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtusername" runat="server" Width="180px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter the username!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><strong>Password</strong></td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter the password!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtpassword" ErrorMessage="The password should contain atleast 6-10 digits!" ForeColor="Red" ValidationExpression="^[0-9A-Za-z]{6,10}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14"></td>
            <td class="auto-style15">
                <asp:Button ID="btnsave" runat="server" Font-Bold="True" Text="SAVE" OnClick="btnsave_Click"  Width="68px"/>
&nbsp;&nbsp;
                <asp:Button ID="btncanel" runat="server" Font-Bold="True" Text="CANCEL" Width="68px" OnClick="btncanel_Click" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="2">
                <asp:GridView ID="grdhod" runat="server" AutoGenerateColumns="False" OnRowCommand="grdhod_RowCommand" Width="733px" >
                    <Columns>
                        <asp:BoundField DataField="hod_name" HeaderText="NAME" />
                        <asp:BoundField DataField="hod_contact" HeaderText="CONTACT" />
                        <asp:BoundField DataField="hod_email" HeaderText="EMAIL" />
                        <asp:BoundField DataField="hod_gender" HeaderText="GENDER" />
                        <asp:BoundField DataField="dept_name" HeaderText="DEPARTMENT" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btndelete" runat="server" CommandArgument='<%# Eval("hod_id") %>' CommandName="del" Text="Delete" CausesValidation="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
            </td>
        </tr>
        </table>
</asp:Content>

