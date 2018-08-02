<%@ Page Title="" Language="C#" MasterPageFile="~/hajj/MasterPageLogin.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="hajj_Home" %>

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
                                        <p class="font1 text-center"><span class="glyphicon glyphicon-user"></span>المطورون </p>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <%--                                    <img src="Content/img/Info1.jpg" width="100%" class="center-block" />--%>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-4 text-center">
                                            <div class="boxAbout">
                                                <img src="Content/img/user.png" />
                                                <br />
                                                <br />
                                                <p style="font-size: large;">عادل الجابري</p>
                                                <p>خريج جامعة أم القرى , بكالوريوس علوم حاسوب</p>
                                                <p>مطور برمجيات</p>
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-4 text-center ">
                                            <div class="boxAbout">
                                                <img src="Content/img/user.png" />
                                                <br />
                                                <br />
                                                <p style="font-size: large;">عمر السقاف</p>
                                                <p>خريج ومعيد سابق بجامعة العلوم والتكنولوجيا - عدن , بكالوريوس تقنية معلومات</p>
                                                <p>مطور برمجيات بتقنية .Net مطور ومصمم مواقع ويب . </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 text-center">
                                            <div class="boxAbout">
                                                <img src="Content/img/user.png" />
                                                <br />
                                                <br />
                                                <p style="font-size: large;">عبدالله العسيري</p>
                                                <p>خريج جامعة California State University Dominguez Hills , ماجستير هندسة برمجيات</p>
                                                <p>مطور تطبيقات الموبايل  </p>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2"></div>
                                        <div class="col-lg-4 text-center">
                                            <div class="boxAbout">
                                                <img src="Content/img/girl.png" />
                                                <br />
                                                <br />
                                                <p style="font-size: large;">فاطمة عدنان الريا</p>
                                                <p>بكالوريوس علوم حاسوب آلي , خريجة جامعة الملك فيصل</p>
                                                <p>تعمل بمجال محلل أمن معلومات , باحث ماجستير في علوم الحاسب</p>
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-4 text-center">
                                            <div class="boxAbout">
                                                <img src="Content/img/girl.png" />
                                                <br />
                                                <br />
                                                <p style="font-size: large;">عائشة عبدالمنعم الصياح</p>
                                                <p>بكالوريوس أمن معلومات , خريجة جامعة الملك فيصل</p>
                                                <p>تعمل بمجال أمن المعلومات وتطوير التطبيقات</p>
                                                <br /><br />
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-2"></div>

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

