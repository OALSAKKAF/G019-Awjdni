<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPage.master" AutoEventWireup="true" CodeFile="Notes.aspx.cs" Inherits="hajj_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .txtcenter {
            text-align: center !important;
            font-size: 18px !important;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <asp:Panel ID="P1" runat="server">
                     <div class="box2">
                         <div class="box4">الملاحظات</div>
                         <br /><br />
                         <asp:GridView ID="GV1" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                         <Columns>
                            <asp:HyperLinkField HeaderText="QRID" HeaderStyle-CssClass="txtcenter" DataNavigateUrlFields="QRID" DataNavigateUrlFormatString="SearchPilgrim.aspx?details={0}" DataTextField="QRID"  />
                             <asp:BoundField DataField="OID" Visible="false" HeaderText="OID" />

                            <asp:TemplateField Visible="false" HeaderText="QRID" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblQRID" runat="server" Text='<%# Eval("QRID") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbQRID" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("NID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" HeaderText="NID" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblNID" runat="server" Text='<%# Eval("NID") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbNID" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("NID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" HeaderText="UID" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblUID" runat="server" Text='<%# Eval("UID") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbUID" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("UID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField Visible="True" HeaderText="آخر موظف" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblFULLNAME" runat="server" Text='<%# Eval("FULLNAME") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbFULLNAME" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("FULLNAME") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="True" HeaderText="تاريخ آخر تحديث" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblUPDATEDATE" runat="server" Text='<%# Eval("UPDATEDATE") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbUPDATEDATE" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("UPDATEDATE") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" HeaderText="TYPEN" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblTYPEN" runat="server" Text='<%# Eval("TYPEN") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbTYPEN" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("TYPEN") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField Visible="True" HeaderText="نوع الملاحظة" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblTYPEV" runat="server" Text='<%# Eval("TYPEV") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbTYPEV" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("TYPEV") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField Visible="True" HeaderText="نص الملاحظة" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblTXTNOTE" runat="server" Text='<%# Eval("TXTNOTE") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbTXTNOTE" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("TXTNOTE") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="True" HeaderText="عدد الملاحظات" HeaderStyle-CssClass="txtcenter">
                                <ItemTemplate>
                                    <asp:Label ID="lblCOUNTQRID" runat="server" Text='<%# Eval("COUNTQRID") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TbCOUNTQRID" CssClass="form-control" Enabled="false" runat="server" Text='<%# Eval("COUNTQRID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            

                            <asp:HyperLinkField HeaderText="الموقع" HeaderStyle-CssClass="txtcenter" DataNavigateUrlFields="LOC" DataNavigateUrlFormatString="https://www.google.com.sa/maps/place/{0}" Target="_blank" Text="الموقع"  />
                            <asp:HyperLinkField HeaderText="التفاصيل" HeaderStyle-CssClass="txtcenter" DataNavigateUrlFields="QRID" DataNavigateUrlFormatString="AddNotes.aspx?details={0}" Target="_blank" Text="التفاصيل"  />

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
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

