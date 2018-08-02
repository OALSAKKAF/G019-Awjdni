<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPageLogin.master" AutoEventWireup="true" CodeFile="AboutSystem.aspx.cs" Inherits="hajj_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="box2">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-primary">
                            <div class="panel-heading ">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                        <p class="font1 text-center"><span class="glyphicon glyphicon-user"></span>مدير النظام </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <img src="Content/img/Info1.jpg" width="100%" class="center-block" />
                                    <br />
                                    توفر هذه المنصة الدخول الى النظام لادخال بيانات مكاتب شؤون الحاج وإعطاء الصلاحيات من قبل مدير النظام.

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                        <p class="font1 text-center"><span class="glyphicon glyphicon-tower"></span>مكاتب شؤون الحج </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <img src="Content/img/Info2.jpg" width="100%" class="center-block" />
                                    <br />
                                    هذه المنصة تعطي الصلاحية لمكاتب شؤون الحج لادخال بيانات الحجاج, ادخال البيانات الطبية وبناء على ذلك يتم انشاء
QR ID 
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                        <p class="font1 text-center"><span class="glyphicon glyphicon-qrcode"></span>طباعة وتوزيع الـ QR ID </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <img src="Content/img/Info3.jpg" width="100%" class="center-block" />
                                    <br />
                                    يتم طباعة الـ QR IDs وتسليمها للحاج.  
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
                                        <p class="font1 text-center"><span class="glyphicon glyphicon-phone"></span>مشرفي التطبيق </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <img src="Content/img/Info4.jpg" width="100%" class="center-block" />
                                    <br />
                                    من خلال مسح QR ID  سيتم اظهار بيانات الحاج والمكتب. كما يمكن للمستخدم اضافة  
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>
</asp:Content>

