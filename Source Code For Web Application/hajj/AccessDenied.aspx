<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessDenied.aspx.cs" Inherits="AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Content/js/jquery.min.js"></script>
    <script src="Content/js/bootstrap.min.js"></script>
    <link href="Content/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="Content/CSS.css" rel="stylesheet" />
    <%--  --%>
    <script type="text/javascript">
        function DelayRedirect() {
            var seconds = 5;
            var dvCountDown = document.getElementById("dvCountDown");
            var lblCount = document.getElementById("lblCount");
            dvCountDown.style.display = "block";
            lblCount.innerHTML = seconds;
            setInterval(function () {
                seconds--;
                lblCount.innerHTML = seconds;
                if (seconds == 0) {
                    dvCountDown.style.display = "none";
                    window.location = "LoginUsers.aspx";
                }
            }, 1000);
        }
        window.onload = DelayRedirect;
    </script>
    <%--  --%>
</head>
<body>

    <br />
    <br />
    <br />
    <br />
    <div class="box2 text-center">
        <br />
        <img src="Content/img/Access_Denied.png" width="250px" height="250px" />
        <br />
        <br />
        <h3 style="color: red">حدث خطأ .. ليس لديك صلاحية للدخول لهذا الرابط</h3>
        <br />
        <div id="dvCountDown" style = "display:none">
            <a href="LoginUsers.aspx">
                <h4>
                    <b>
                         سيتم تحويلك لصفحة تسجيل الدخول بعد <span id="lblCount"></span>&nbsp;ثواني&nbsp;
                    </b>
                </h4>
            </a>
        </div>




    </div>


</body>
</html>
