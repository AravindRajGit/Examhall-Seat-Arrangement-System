<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PrintArrangement.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="Right"><asp:Button ID="Button1" runat="server" Text="Download Excel" OnClick="Button1_Click" /></div>
    
    <asp:GridView ID="grdArrangement" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="465px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="exam_regno" HeaderText="Register No" />
            <asp:BoundField DataField="exam_department" HeaderText="Exam Department" />
            <asp:BoundField DataField="room_no" HeaderText="Hall No" />
            <asp:BoundField DataField="room_desk_pos" HeaderText="Desk Label" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    
      
</asp:Content>

