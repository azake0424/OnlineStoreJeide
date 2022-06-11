<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#login").click(function () {
                event.preventDefault();
                var email = $("#email").val();
                var password = $("#password").val();
                $.ajax({
                    url: 'LoginServlet',
                    type: 'POST',
                    data: {
                        email: email,
                        password: password
                    },
                    cache: false,
                    success: function (data) {
                        if (data === 'True') {
                            window.location.href = "/";
                        } else {
                            document.getElementById("danger-alert").style.display = "block";
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>

<%@include file="includes/navbar.jsp"%>

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-12">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Login</span></h2>
            </div>
        </div>

        <div class="col-4 offset-4">
            <form >
                <div id="danger-alert" class="alert alert-danger" style="display: none">
                    Login or password is invalid
                </div>
                <div class="input-group">
                    <input type="email" autocomplete="off" placeholder="Email" class="form-control" id="email">
                </div>
                <br>
                <div class="input-group">
                    <input type="password" autocomplete="off" placeholder="Password" class="form-control" id="password">
                </div>
                <br>
                <button type="submit" id="login" class="btn btn-primary btn-block border-0 py-3">Login</button>
            </form>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>
