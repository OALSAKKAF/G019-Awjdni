<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPage.master" AutoEventWireup="true" CodeFile="ViewPligmNote.aspx.cs" Inherits="hajj_ViewPligmNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
        <div class="box2">
            <div class="row">
                 <div class="col-lg-12">
                <div class="box4" style="font-size:larger">متابعة الحجيج</div>
                     <br />
                     <br />
                      <div class="row">
                          <div class="col-lg-11 center-block">
                              <asp:GridView ID="GridView1" runat="server" CssClass="table-responsive" CellPadding="10" AutoGenerateColumns="false" ForeColor="#333333" GridLines="None">
                                  <Columns>
    <asp:BoundField HeaderText="رقم الجواز" DataField="PASSPORTID"/>
    <asp:BoundField HeaderText="اسم الحاج" DataField="PNAME"/>
    <asp:BoundField HeaderText="الجنسية" DataField="NATIONALITY"/>
    <asp:BoundField HeaderText="فصيلة الدم" DataField="BLOOD"/>
    <asp:BoundField HeaderText="عنوان الفندق" DataField="HOTEL"/>
    <asp:BoundField HeaderText="حالة الحاج" DataField="TYPEN"/>
    <asp:BoundField HeaderText="الملاحظة" DataField="TXTNOTE"/>
    <asp:BoundField HeaderText="محرر الملاحظة" DataField="writter"/>
    <asp:BoundField HeaderText="رقم جوال محرر الملاحظة" DataField="Wmobile"/>
    <asp:BoundField HeaderText="تاريخ الملاحظة" DataField="UPDATEDATE"/>
    
    <asp:HyperLinkField HeaderText="" DataNavigateUrlFields="NID" DataNavigateUrlFormatString="AddNotes.aspx?details={0}" Text="إضافة ملاحظة"/>

    </Columns>
                                  <AlternatingRowStyle BackColor="White" />
                                  <EditRowStyle BackColor="#2461BF" />
                                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Size="Medium" ForeColor="White" />
                                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="#EFF3FB"  Font-Size="14px"/>
                                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                  <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                  <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                  <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                  <SortedDescendingHeaderStyle BackColor="#4870BE" />
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

