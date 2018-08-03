<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPage.master" AutoEventWireup="true" CodeFile="AddNotes.aspx.cs" Inherits="hajj_AddNotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .txtcenter {
            text-align: center !important;
            font-size: 18px !important;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>



            <div class="container">
                <div class="box2">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="box4">إضافة ملاحظة</div>
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <div class="col-lg-5">
                                    <br />
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="TbPass" class="control-label">رقم الجواز</label>
                                                <asp:TextBox ID="TbPass" runat="server" CssClass="form-control text-center" Enabled="false" Width="100%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="يجب كتابة رقم الجواز" ControlToValidate="TbPass" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label for="TbName" class="control-label">اسم الحاج</label>
                                                <asp:TextBox ID="TbName" runat="server" CssClass="form-control text-center" Enabled="false" Width="100%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="يجب كتابة إسم الحاج" ControlToValidate="TbName" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="TbNatio" class="control-label">الجنسية</label>
                                        <asp:TextBox ID="TbNatio" runat="server" Enabled="false" CssClass="form-control text-center" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="يجب إختيار الجنسية" ControlToValidate="TbNatio" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="TbBlood" class="control-label">فصيلة الدم</label>
                                        <asp:TextBox ID="TbBlood" runat="server" Enabled="false" CssClass="form-control text-center" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="يجب كتابة إختيار فصيلة الدم" ControlToValidate="TbBlood" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="TbAddress" class="control-label">عنوان السكن</label>
                                        <asp:TextBox ID="TbAddress" runat="server" Enabled="false" CssClass="form-control text-center" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="يجب كتابة عنوان السكن" ControlToValidate="TbAddress" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <div class="col-lg-5">
                                    <br />
                                    <br />

                                    <div class="form-group">
                                        <label for="DDLStatus" class="control-label">حالة الحاج</label>
                                        <asp:DropDownList ID="DDLStatus" CssClass="form-control center-block text-center" runat="server">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="يجب إختيار حالة الحاج" ControlToValidate="DDLStatus" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                        <label for="TbDate" class="control-label">تاريخ الملاحظة</label>
                                        <asp:TextBox ID="TbDate" Enabled="false" runat="server" CssClass="form-control  text-center" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="TextNote" class="control-label">الملاحظة</label>
                                        <%--                                <textarea id="TextNote" class="form-control  text-center" name="TextNote" cols="30" rows="2"></textarea>--%>
                                        <asp:TextBox ID="TbTextNote" CssClass="form-control" Rows="4" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="يجب كتابة الملاحظة" ControlToValidate="TbTextNote" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="TextNote" class="control-label">الموقع</label>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TbLatitude" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TbLongitude" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-lg-2">
                                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="جلب الإحداثيات" OnClick="Button1_Click" />
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="يجب الضغط على زر جلب الإحداثيات" ControlToValidate="TbLatitude" Display="Dynamic" ForeColor="Red" Style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>--%>

                                    <div class="form-group">
                                    </div>
                                </div>

                                <div class="col-lg-1"></div>


                            </div>
                            <div class="form-group">
                                <center>

                                <asp:Label ID="LblConfirm" CssClass="text-center" runat="server" Text="" Style="color:green; font-weight: 700;"></asp:Label>
                                <asp:Label ID="LblError" CssClass="text-center" runat="server" Visible="false" Text="" Style="color: #FF0000; font-weight: 700; text-align: center;"></asp:Label>
                            
                            </center>

                            </div>
                            <div class="form-group">
                                <asp:Button ID="BtnUpdate" runat="server" ValidationGroup="vg" CssClass="btn btn-primary center-block" Text="حفظ الملاحظة" OnClick="BtnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <br />


                    <div class="row">
                        <div class="col-lg-12">
                            <div class="box4">تفاصيل الملاحظات</div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:GridView ID="GV1" Width="100%" AllowPaging="false" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                <Columns>
                                    <asp:BoundField Visible="false" HeaderText="NID" DataField="NID" SortExpression="NID" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField HeaderText="QRID" DataField="QRID" SortExpression="QRID" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField Visible="false" HeaderText="UID" DataField="UID" SortExpression="UID" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField HeaderText="اسم الموظف" DataField="FULLNAME" SortExpression="FULLNAME" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField HeaderText="تاريخ التحديث" DataField="UPDATEDATE" SortExpression="UPDATEDATE" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField Visible="false" HeaderText="TYPEN" DataField="TYPEN" SortExpression="TYPEN" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField HeaderText="نوع الملاحظة" DataField="TYPEV" SortExpression="TYPEV" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField HeaderText="نص الملاحظة" DataField="TXTNOTE" SortExpression="TXTNOTE" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
                                    <asp:BoundField HeaderText="الموقع" DataField="LOC" SortExpression="LOC" HeaderStyle-CssClass="txtcenter"></asp:BoundField>
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
                    </div>
                </div>
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>

    <%-- Script Get Geolocation -- Start --%>
    <%--<script>
        var x = document.getElementById("demo");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                x.innerHTML = "Geolocation is not supported by this browser.";
            }
        }

        function showPosition(position) {
            document.getElementById("<%=TbLatitude.ClientID %>").value = position.coords.latitude;
            document.getElementById("<%=TbLongitude.ClientID %>").value = position.coords.longitude;
        }
    </script>--%>
    <%-- Script Get Geolocation -- End --%>
</asp:Content>



