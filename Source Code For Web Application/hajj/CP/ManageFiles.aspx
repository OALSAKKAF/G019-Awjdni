<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/CP/MasterPageCP.master" AutoEventWireup="true" CodeFile="ManageFiles.aspx.cs" Inherits="CP_ManageFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="box2">
                 <div class="box4">إدارة ملفات QR Code</div>
                    <br />
                    <br />
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" />
<hr />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded" Width="100%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID = "lnkDelete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                    <HeaderStyle BackColor="#00639C" HorizontalAlign="Center" CssClass="txtcenter" Font-Bold="True" ForeColor="#ffffff" />
                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#003399" />
                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                    <SortedDescendingHeaderStyle BackColor="#002876" />
</asp:GridView>
        </div>
        <div class="col-lg-4"></div>
        </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

