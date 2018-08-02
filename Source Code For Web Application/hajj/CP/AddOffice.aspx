<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/CP/MasterPageCP.master" AutoEventWireup="true" CodeFile="AddOffice.aspx.cs" Inherits="CP_AddOffice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="box2">

            <div class="row">
                <div class="col-lg-12">
                    <div class="box4">إضافة مكاتب شؤون الحاج</div>
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-5">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="TbOfficename" class="control-label">اسم المكتب</label>
                                        <asp:TextBox ID="TbOfficename" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل اسم المكتب"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbOfficename" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="TbOfficeNum" class="control-label">رقم المكتب</label>
                                        <asp:TextBox ID="TbOfficeNum" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل رقم المكتب"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbOfficeNum" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="TbAddress" class="control-label">عنوان المكتب</label>
                                <asp:TextBox ID="TbAddress" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل عنوان المكتب"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TbAddress" ForeColor="Red" Display="Dynamic" style="font-weight:700" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="TbPhone" class="control-label">هاتف المكتب</label>
                                <asp:TextBox ID="TbPhone" runat="server" CssClass="form-control text-center" Width="100%" placeholder="012XXXXXXX"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbPhone" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>


                            </div>
                            <div class="form-group">
                                 <label for="TbMobile" class="control-label">رقم الجوال</label>
                                <asp:TextBox ID="TbMobile" runat="server" CssClass="form-control text-center" Width="100%" placeholder="ادخل رقم جوال المكتب"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" style="font-weight:700" ControlToValidate="TbMobile" ForeColor="Red" ValidationGroup="vg1" ErrorMessage="هذا الحقل مطلوب"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="col-lg-5">
                        </div>

                        <div class="col-lg-1"></div>


                    </div>
                        <div class="form-group">
                            <asp:Label ID="LblConfirm" runat="server" Text="" Style="color:green; font-weight: 700;"></asp:Label>
                            <asp:Label ID="LblError" runat="server" Text="" Visible="false" Style="color: #FF0000; font-weight: 700;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="BtnAddOffice" runat="server" ValidationGroup="vg1" CssClass="btn btn-primary center-block" Text="حفظ البيانات" OnClick="BtnAddOffice_Click" />
                        <%--<asp:Button ID="BtnUpdate" runat="server" ValidationGroup="vg" CssClass="btn btn-primary center-block" Text="حفظ البيانات" Visible="false" OnClick="BtnUpdate_Click" />--%>

                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

