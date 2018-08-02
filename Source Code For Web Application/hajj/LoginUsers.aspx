<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPageLogin.master" AutoEventWireup="true" CodeFile="LoginUsers.aspx.cs" Inherits="hajj_LoginUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container">
    <div class="row">
        <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <br />
                <br />
                <div class="login text-center">
                    <div class="form-group">
                        <img src="Content/img/logo.png" width="60%"/>
                    </div>
                    <div class="form-group">
                        <label for="TextBox1" class="control-label" style="color:#00639C; font:bold; font-size:medium;">إسم المستخدم</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control center-block text-center" style="color:#00639C; font:bold; font-size:medium;" Width="75%" placeholder="اسم المستخدم"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="يجب كتابة إسم المستخدم" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="TextBox2" class="control-label"  style="color:#00639C; font:bold; font-size:medium;">كلمة المرور</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control center-block text-center"  style="color:#00639C; font:bold; font-size:medium;" Width="75%" placeholder="كلمة المرور" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="يجب كتابة كلمة المرور" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" style="font-weight: 700" ValidationGroup="vg"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="LblError" runat="server" Text="" Style="color: #FF0000; font-weight: 700"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="Button1" runat="server" ValidationGroup="vg" CssClass="btn btn-primary" Text="تسجيل دخول" OnClick="Button1_Click" />
                    </div>
                </div>
                <br />
                <br />
            </div>
            <div class="col-sm-4"></div>

       
    </div>
</div>

</asp:Content>

