<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Timetable.aspx.cs" Inherits="Admin_Default" %>

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
            <td class="auto-style4">Department</td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddldept" runat="server" OnSelectedIndexChanged="ddldept_SelectedIndexChanged" >
                </asp:DropDownList>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style7">Semester</td>
            <td class="auto-style8">
                <asp:DropDownList ID="ddlsem" runat="server">
                    <asp:ListItem>---Select---</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style4">Date</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style10">Scheme</td>
            <td class="auto-style11">
                <asp:DropDownList ID="ddlrevision" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style11"></td>
        </tr>
        <tr>
            <td class="auto-style13">Subject code</td>
            <td class="auto-style14">
                <asp:TextBox ID="txtcode" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="auto-style14"></td>
        </tr>
        <tr>
            <td class="auto-style7">Time</td>
            <td class="auto-style8">
                <asp:RadioButtonList ID="rbltime" runat="server" RepeatDirection="Horizontal" Height="21px" Width="232px">
                    <asp:ListItem>Forenoon</asp:ListItem>
                    <asp:ListItem>Afternoon</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style17">Exam Type</td>
            <td class="auto-style18">
                <asp:RadioButtonList ID="rbltype" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="R">Regular</asp:ListItem>
                    <asp:ListItem Value="S">Supply</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style17"></td>
            <td class="auto-style18"></td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btbsave" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Save" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btncancel" runat="server" Font-Bold="True" OnClick="btncancel_Click" Text="Cancel" />
                
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="3">
                <asp:GridView ID="grdtimetable" runat="server" AutoGenerateColumns="False" Width="931px" OnRowCommand="grdtimetable_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="dept_name" HeaderText="Department" />
                        <asp:BoundField DataField="timetable_sem" HeaderText="Semester" />
                        <asp:BoundField DataField="timetable_date" HeaderText="Date" DataFormatString="{0:d}" HtmlEncode="False"  />
                        <asp:BoundField DataField="re_name" HeaderText="Rivision Scheme" />
                        <asp:BoundField DataField="timetable_scode" HeaderText="Subject Code" />
                        <asp:BoundField DataField="timetable_time" HeaderText="Time" />
                        <asp:BoundField DataField="timetable_extype" HeaderText="Exam Type" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandName="del" CommandArgument='<%# Eval("timetable_id") %>' Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandName="ed" CommandArgument='<%# Eval("timetable_id") %>' Text="Edit" />
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
        <tr>
            <td  colspan="3">
                <asp:Button ID="btnDeleteAll" runat="server" Text="Delete All Data" OnClick="btnDeleteAll_Click" />
                  <asp:Button ID="btnPrintData" runat="server" Text="Print Sheet"  />

            </td>
        </tr>
        </table>
</asp:Content>

