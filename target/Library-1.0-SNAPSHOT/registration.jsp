<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="includes/head.jsp" %>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#adding").click(function () {
                event.preventDefault();
                var email = $("#email").val();
                var fio = $("#fio").val();
                var password = $("#password").val();
                $.ajax({
                    url: 'RegistrationServlet',
                    type: 'POST',
                    data: {
                        email: email,
                        fio: fio,
                        password: password
                    },
                    cache: false,
                    success: function (data) {
                        if (data === 'True') {
                            alert("Регистрация прошла успешно!");
                            window.location.href = "main.jsp";
                        } else {
                            alert("Ошибка!");
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
                <h2 class="section-title px-5"><span class="px-2">Логин</span></h2>
            </div>
        </div>
        <div class="col-4 offset-4">
            <form>
                <div class="input-group">
                    <input type="email" placeholder="Email" class="form-control" id="email">
                </div>
                <br>
                <div class="input-group">
                    <input type="text" placeholder="Name" class="form-control" id="fio">
                </div>
                <br>
                <div class="input-group">
                    <input type="password" placeholder="Password" class="form-control" id="password">
                </div>
                <br>
                <button type="submit" id="adding" class="btn btn-primary btn-block border-0 py-3">Регистрация</button>
            </form>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>

