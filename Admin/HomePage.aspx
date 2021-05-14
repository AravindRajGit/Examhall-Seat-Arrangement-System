<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/UploadExcel.aspx">UploadExcelSheet</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/SetRooms.aspx">SetRooms</asp:HyperLink>
</asp:Content>

