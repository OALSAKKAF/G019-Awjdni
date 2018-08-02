<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="hajj_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <div class="box2">
                    <div class="row">
                        <div class="col-lg-3"></div>

                        <div class="col-lg-6">
                            <%--<asp:Button ID="BtnAddPilgrim" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="إدخال بيانات الحجاج" />
                            <asp:Button ID="BtnManagePligrim" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="إدارة بيانات الحجاج" />
                            <asp:Button ID="BtnNotes" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="متابعة الملاحظات" />--%>
                        </div>

                        <div class="col-lg-3"></div>

                    </div>

                    <div class="row">
                        <div class="col-lg-4">

                            <div class="panel panel-primary">
                            <div class="panel-heading ">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                        <img src="Content/img/logo.png" width="50%" class="center-block" />
                                        <p class="font1 text-center" style="font-size:20px;"><span class=" glyphicon glyphicon-plus"></span> إدخال بيانات الحجاج </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <br />
                                    هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
                                    <br /><br />
                                    <asp:Button ID="BtnAddPilgrim" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="إدخال بيانات الحجاج" OnClick="BtnAddPilgrim_Click" />
                                </div>
                            </div>
                        </div>

                        </div>

                        <div class="col-lg-4">
                            
                            <div class="panel panel-primary">
                            <div class="panel-heading ">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                        <img src="Content/img/logo.png" width="50%" class="center-block" />
                                        <p class="font1 text-center" style="font-size:20px"><span class="glyphicon glyphicon-search"></span> إدارة بيانات الحجاج</p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <br />
                                    هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
                                    <br /><br />
                                    <asp:Button ID="BtnManagePligrim" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="إدارة بيانات الحجاج" OnClick="BtnManagePligrim_Click" />
                                </div>
                            </div>
                        </div>

                        </div>

                        <div class="col-lg-4">

                            <div class="panel panel-primary">
                            <div class="panel-heading ">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                        <img src="Content/img/logo.png" width="50%" class="center-block" />
                                        <p class="font1 text-center" style="font-size:20px"><span class="glyphicon glyphicon-file"></span> الملاحظات </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <br />
                                    هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
                                    <br /><br />
                                    <asp:Button ID="BtnNotes" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="متابعة الملاحظات" OnClick="BtnNotes_Click" />
                                </div>
                            </div>
                        </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>

