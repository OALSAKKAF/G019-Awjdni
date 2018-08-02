<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/CP/MasterPageCP.master" AutoEventWireup="true" CodeFile="EditUsers.aspx.cs" Inherits="CP_EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="box2">

            <div class="row">
                <div class="col-lg-12">
                    <div class="box4">تعديل بيانات المستخدمين</div>
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-5">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="TbUsername" class="control-label">اسم المستخدم</label>
                                        <asp:TextBox ID="TbUsername" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل اسم المستخدم"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbUsername" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="[A-Za-z][A-Za-z0-9._]{5,14}" runat="server" ControlToValidate="TbUsername" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="الرجاء ادخال اسم صالح للاستخدام"></asp:RegularExpressionValidator>

                                    </div>
                                    <div class="form-group">
                                        <label for="TbPassword" class="control-label">كلمة المرور</label>
                                        <asp:TextBox ID="TbPassword" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل كلمة المرور" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbPassword" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="TbFullNAME" class="control-label">الاسم الكامل</label>
                                <asp:TextBox ID="TbFullNAME" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل اسمك بالكامل"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TbFullNAME" Display="Dynamic" style="font-weight:700" runat="server" ValidationGroup="vg1" ForeColor="Red" ErrorMessage="هذا حقل مطلوب"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="TbType" class="control-label">نوع المستخدم</label>
                                <asp:DropDownList ID="TbType" CssClass="form-control center-block text-center" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged">
                                   <asp:ListItem Value="0">اختر نوع المستخدم</asp:ListItem>
                                   <asp:ListItem Value="1">مسؤول</asp:ListItem>
                                   <asp:ListItem Value="2">مكتب طوافة</asp:ListItem>
                                    <asp:ListItem Value="3">مستخدم عادي</asp:ListItem>
               
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" Display="Dynamic" style="font-weight:700" ControlToValidate="TbType" ValidationGroup="vg1" ForeColor="Red" runat="server" ErrorMessage="الرجاء الاختيار من القائمة"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblOffice" runat="server" Visible="false" class="control-label">المكتب</asp:Label>
                                <asp:DropDownList ID="TbOffice" CssClass="form-control center-block text-center" Visible="false" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" InitialValue="0" Display="Dynamic" style="font-weight:700" runat="server" ValidationGroup="vg1" ForeColor="Red" ControlToValidate="TbOffice" ErrorMessage="اختر المكتب"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="col-lg-5">
                            <br />
                            <br />
                            <div class="form-group">
                                <label for="TbEmail" class="control-label">البريد الالكتروني</label>
                                <asp:TextBox ID="TbEmail" runat="server" CssClass="form-control  text-center" Width="100%" placeholder="example@hotmail.com"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbEmail" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TbEmail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ForeColor="Red" ValidationGroup="vg1" runat="server" ErrorMessage="الرجاء ادخال الايميل بشكل صحيح"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="TbMobile" class="control-label">رقم الجوال</label>
                                <asp:TextBox ID="TbMobile" runat="server" CssClass="form-control  text-center" MaxLength="10" Width="100%" placeholder="رقم الجوال"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbMobile" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label for="TbActive" class="control-label">حالة الحساب</label>
                                    <asp:DropDownList ID="TbActive" CssClass="form-control center-block text-center" runat="server">
                                         <asp:ListItem Value="00">اختر حالة الحساب</asp:ListItem>
                                        <asp:ListItem Value="1">مفعل</asp:ListItem>
                                    <asp:ListItem Value="0">غير مفعل</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="00" runat="server" Display="Dynamic" style="font-weight:700" ValidationGroup="vg1" ForeColor="Red" ControlToValidate="TbActive" ErrorMessage="الرجاء اختيار خاصية التفعيل"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                        <label for="Tbtxtuser" class="control-label">الملاحظة</label>
                                <asp:TextBox ID="Tbtxtuser" runat="server" CssClass="form-control center-block text-center" TextMode="MultiLine" placeholder="ادخل الملاحظة"></asp:TextBox> 
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" style="font-weight:700" ValidationGroup="vg1" ForeColor="Red" ControlToValidate="Tbtxtuser" ErrorMessage="الرجاء ادخل الملاحظة"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-lg-1"></div>


                    </div>
                        <div class="form-group">
                        <asp:Label ID="LblError" runat="server" Text="" Style="color: #FF0000; font-weight: 700"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="BtnUpdate" runat="server" ValidationGroup="vg1" CssClass="btn btn-primary center-block" Text="حفظ البيانات" OnClick="BtnUpdate_Click" />
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
