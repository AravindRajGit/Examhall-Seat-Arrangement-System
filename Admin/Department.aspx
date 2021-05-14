<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/Admin.master" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="ADMIN_Default" %>

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
            <td class="auto-style35"><h4 class="auto-style38"><strong>Department</strong></h4></td>
            <td class="auto-style30">
               
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                <asp:TextBox ID="txtdept" runat="server" Width="143px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtdept" ErrorMessage="Enter the department!" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
                
        <tr>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style30">
               
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style36"></td>
            <td class="auto-style15"><asp:Button ID="btnsave" runat="server"  OnClick="btnsave_Click"  Text="SAVE" Width="78px" Font-Bold="True" />
                <asp:Button ID="btncancel" runat="server"  OnClick="btncancel_Click"  Text="CANCEL" Width="82px" CausesValidation="False" Font-Bold="True"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style36">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style33" colspan="2"> 
                <asp:GridView ID="grddept" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"  Width="509px" CellSpacing="2" BackColor="White" OnSelectedIndexChanged="grddept_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="dept_name" HeaderText="Department"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btndelete" runat="server" CommandArgument='<%# Eval("dept_id") %>' CommandName="del" Font-Bold="True" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                </asp:GridView>
            </td>
        </tr>
        </table>
</asp:Content>

