<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/CP/MasterPageCP.master" AutoEventWireup="true" CodeFile="UsersManag.aspx.cs" Inherits="CP_UsersManag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
        <div class="box2">
            <div class="row">
                 <div class="col-lg-12">
                <div class="box4" style="font-size:larger">إدارة المستخدمين</div>
                     <br />
                     <br />
                      <div class="row">
                          <div class="col-lg-11 center-block">
                              <asp:GridView ID="GridView1" runat="server" AllowPaging="false" OnPageIndexChanging="OnPaging" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" Width="100%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                  <Columns>
        <asp:BoundField HeaderText="اسم" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataField="UID"/>
    <asp:BoundField HeaderText="اسم المستخدم" DataField="USER"/>
    <asp:BoundField HeaderText="اسم بالكامل" DataField="FULLNAME"/>
    <asp:BoundField HeaderText="البريد الالكتروني" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataField="EMAIL"/>
    <asp:BoundField HeaderText="رقم الجوال" DataField="MOBILE"/>
        <asp:BoundField HeaderText="نوع المستخدم" DataField="TYPE"/>
    <asp:BoundField HeaderText="مكتب الطوافة" DataField="NAME"/>
    <asp:BoundField HeaderText=" عنوان مكتب الطوافة" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" DataField="ADDRESS"/>
    <asp:BoundField HeaderText="جوال مكتب الطوافة" DataField="OffMobile"/>
    <asp:BoundField HeaderText="حالة المستخدم" DataField="ACTIVE"/>

    
    <asp:HyperLinkField HeaderText="تعديل بيانات المستخدم" DataNavigateUrlFields="UID" DataNavigateUrlFormatString="EditUsers.aspx?details={0}" Text="تعديل"/>
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