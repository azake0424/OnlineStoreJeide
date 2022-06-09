<%@ page import="org.postgresql.jdbc.PgArray" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jeide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="js/pay.js"></script>
    <script src="https://pay.fondy.eu/latest/checkout.js"></script>
    <script src="https://pay.fondy.eu/latest/i18n/ru.js"></script>
    <link rel="stylesheet" href="https://pay.fondy.eu/latest/checkout.css">
    <script>
        $(document).ready(function () {
            $("#addCart").click(function () {
                event.preventDefault();
                var productId = $("#productId").val();
                var size = $("#size").val();
                $.ajax({
                    url: '/product',
                    type: 'POST',
                    data: {
                        productId: productId,
                        size: size
                    },
                    cache: false,
                    success: function (data) {
                        if (data === 'True') {
                            alert("Успешно добавили!");
                        } else {
                            alert("Ошибка!");
                        }
                    }
                });
            });
        });
    </script>
    <style>
        .zoom {
            transition: transform .2s;
            overflow: hidden;
        }
    .photo{
        overflow: hidden;
    }
        .zoom:hover {
            transform: scale(1.5);
            /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
        }
    </style>
</head>
<body>
<div class="navbar navbar-dark shadow-sm" style="background: #71A915; height: 70px">
    <div class="container align-items-center">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" style="margin-top: -50px" href="/"><img src="images/jeide.png" width="100px" ></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto align-items-center">
                    <li class="nav-item" style="margin-top: -27px;margin-left: -30px">
                        <a class="nav-link" href="/" style="color: white">8700-700-7070</a>
                    </li>
                    <li class="nav-item" style="margin-top: -10px">
                        <form action="SearchServlet" method="post" class="d-flex">
                            <input type="text" class="form-control" style="border-radius: 20px" id="searchText" name="searchText">
                            <input type="submit" style="background: none; border: none;" id="search" value="">
                        </form>
                    </li>
                    <li class="nav-item dropdown" style="color: white; margin-top: -27px">
                        <button  class="nav-link dropdown-toggle" style="background: none; border: none;color: white" type="button"
                                 id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            Каталог
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="color: white">
                            <li><a class="dropdown-item" href="men.jsp">Мужские одежды</a></li>
                            <li><a class="dropdown-item" href="women.jsp">Женские одежды</a></li>
                            <li><a class="dropdown-item" href="baby.jsp">Детские одежды</a></li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.email != null}">
                        <li class="nav-item"  style="margin-left: 300px;margin-top: -27px">
                            <a class="nav-link" href="logout.jsp">Выйти</a>
                        </li>
                        <li class="nav-item" style="margin-top: -27px">
                            <a class="nav-link" href="profile.jsp">Корзина</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.email == null}">

                        <li class="nav-item" style="margin-left: 300px;margin-top: -27px">
                            <a class="btn btn-outline-light" href="login.jsp">Логин</a>
                        </li>
                        <li class="nav-item" style="margin-top: -27px">
                            <a class="btn btn-success" href="registration.jsp">Регистрация</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </div>
</div>
<%
    request.setAttribute("product_id", Integer.parseInt(request.getParameter("product_id")));
%>
<sql:query var="products" dataSource="jdbc/testdb">
    SELECT * FROM product WHERE id = ?
    <sql:param value="${requestScope.get('product_id')}"/>
</sql:query>
<c:forEach var="product" items="${products.rows}">
    <div class="container p-1 text-center" style="width: 80%">
        <h1 class="m-5"><c:out value="${product.name}"/> <c:out value="${product.brand}"/></h1>
        <div class="row"    >
            <div class="col">
                <div class="photo"><center><img class="rounded zoom" height="600" src="<c:out value="${product.image}"/>"></center></div>
            </div>
            <div class="col" >
                <div class="row m-2" style="">
                    <h4>Размеры:</h4>
                    <select id="size" >
                        <c:set var="sizes" value="${product.size}"/>
                        <%
                            PgArray array = (PgArray) pageContext.getAttribute("sizes");
                            String[] strings = (String[]) array.getArray();
                            for (String s : strings) {
                        %>
                        <option value="<%=s%>"><%=s%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="row m-2">
                    <input style="display: none;" type="text" id="productId" class="form-control"
                           value="<c:out value="${requestScope.get('product_id')}"/>">
                    <h4>Цена:</h4>
                    <h4><c:out value="${product.price}"/> ₸</h4>
                </div>
                <div class="row m-2">
                    <input style="display: none;" type="text" id="article" class="form-control"
                           value="<c:out value="${requestScope.get('article')}"/>">
                    <p>Артикул: <c:out value="${product.article}"/></p>
                </div>
                <div class="row m-2">
                    <div class="col align-items-center">
                        <img src="images/image%2014.png" height="28"> Бесплатная доставка
                    </div>
                </div>
                <div class="row m-2">
                    <button id="addCart" class="btn btn-success" style="background: #71A915">Добавить в корзину</button>
                </div>
                <div class="row m-2">
                    <h3>Описание</h3>
                    <p><c:out value="${product.description}"/></p>
                </div>
            </div>
            <div class="container"  >
                <h2 class="my-5" style="text-align: left">Похожие товары</h2>
                <hr>
                <div class="row" >
                    <sql:query var="products" dataSource="jdbc/testdb">
                        select * from product where name like 'Платье' OR brand like 'Lichi'  limit 6
                    </sql:query>
                    <c:forEach var="product" items="${products.rows}">
                        <div class="card m-3" style="width: 9rem; display: flex">
                            <a href="/product?product_id=<c:out value="${product.id}"/>"><img src="<c:out value="${product.image}"/>" class="card-img-top" alt="..."></a>
                            <div class="card-body">
                                <p class="card-title" style="font-family: 'Dosis', sans-serif;"><c:out value="${product.name}"/></p>
                                <p class="card-title" style="font-family: 'Dosis', sans-serif; margin-top: -5px"><c:out value="${product.brand}"/></p>
                                <p class="card-text"><c:out value="${product.price}"/> ₸</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div id=app></div>
</c:forEach>

<div class="container-fluid" style="height: 200px;background: #F5F5F5"></div>

<div class="container-fluid p-5">
    <div class="row">
        <div class="col">
            <p>О компании</p>
            <p>lorem ipsum by students Astana IT University</p>
        </div>
        <div class="col">
            <p>Контакты</p>
            <p>z.ali@astanait.edu.kz</p>
            <p>z.ali@astanait.edu.kz</p>
            <p>87007007070</p>
        </div>
        <div class="col"><a href="/"><img style="margin-top: -50px" src="images/jeide.png" width="100px"></a></div>
        <div class="col"><p>Способы оплаты</p>
            <img src="images/visa.png" width="50" alt="">
            <img src="images/mastercard.png" width="50" alt="">
        </div>

    </div>

    <div style="margin: 50px;border-radius: 1px; height: 3px;background: black"></div>
    <div class="row mt-3 text-dark">
        <h4>&copy; Jeide 2022</h4>
    </div>
</div>
</body>
</html>
