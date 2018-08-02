<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/CP/MasterPageCP.master" AutoEventWireup="true" CodeFile="OfficeManag.aspx.cs" Inherits="CP_OfficeManag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
        <div class="box2">
            <div class="row">
                 <div class="col-lg-12">
                <div class="box4" style="font-size:larger">إدارة مكاتب شؤون الحاج</div>
                     <br />
                     <br />
                      <div class="row">
                          <div class="col-lg-1"></div>
                          <div class="col-lg-10 center-block">
                              <asp:GridView ID="GridView1" AllowPaging="false" OnPageIndexChanging="OnPaging" OnRowDeleting="GridView1_RowDeleting" runat="server" AutoGenerateColumns="false" Width="100%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                  <Columns>
            <asp:BoundField HeaderText="اسم " HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataField="OID"/>
    <asp:BoundField HeaderText="رقم المكتب" DataField="LIC_NUM"/>
    <asp:BoundField HeaderText="اسم المكتب" DataField="NAME"/>
    <asp:BoundField HeaderText="عنوان المكتب" DataField="ADDRESS"/>
    <asp:BoundField HeaderText="رقم هاتف المكتب" DataField="PHONE"/>
    <asp:BoundField HeaderText="رقم جوال المكتب" DataField="MOBILE"/>
    
    <asp:HyperLinkField HeaderText="تعديل بيانات المكتب " DataNavigateUrlFields="OID" DataNavigateUrlFormatString="EditOffice.aspx?details={0}" Text="تعديل"/>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" ForeColor="Red" runat="server" CausesValidation="False" CommandName="Delete" Text="حذف" OnClientClick="return confirm('هل أنت متأكد أنك تريد الحذف ؟');"></asp:LinkButton>
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
                          <div class="col-lg-1"></div>
                          </div>
                     <br />
                     <br />

                     </div>
                </div>

     </div>
    </div>
</asp:Content>

