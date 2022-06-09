<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Jeide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="js/modal.js"></script>
    <link rel="stylesheet" href="css/modal.css">
    <link rel="stylesheet" href="css/pay.css">
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
                            <img src="">
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
<div class="container">
    <div class="row">
        <h1 class="m-3">Корзина</h1>
        <div class="col">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Название</th>
                    <th scope="col">Размер</th>
                    <th scope="col">Цена</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (session.getAttribute("cart") != null) {
                        HashMap<Integer, List<String>> cart = (HashMap<Integer, List<String>>) session.getAttribute("cart");
                        Set<Integer> ids = cart.keySet();
                        request.setAttribute("ids", ids);
                %>
                <c:forEach var="productId" items="${requestScope.get('ids')}" varStatus="loop">
                    <sql:query var="products" dataSource="jdbc/testdb">
                        SELECT * FROM product WHERE id = ?
                        <sql:param value="${productId}"/>
                    </sql:query>
                    <c:forEach var="product" items="${products.rows}">
                        <tr>
                            <th scope="row"><c:out value="${product.name}"/></th>
                            <td><%=cart.get((Integer) pageContext.getAttribute("productId")).get(0)%></td>
                            <td><c:out value="${product.price}"/></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <div>
        <button class="js-open-modal1 btn btn-success" data-modal="1" type="submit" id="next">Купить</button>
    </div>
    <div class="modal1" data-modal="1">
        <svg class="modal1__cross js-modal1-close" xmlns="http://www.w3.org/2000/svg"               viewBox="0 0 24 24"><path d="M23.954 21.03l-9.184-9.095 9.092-9.174-2.832-2.807-9.09 9.179-9.176-9.088-2.81 2.81 9.186 9.105-9.095 9.184 2.81 2.81 9.112-9.192 9.18 9.1z"/></svg>
        <div class="container p-0 paysystem">
            <div class="card px-4">
                <p class="h8 py-3">Payment Details</p>
                <div class="row gx-3">
                    <div class="col-12">
                        <div class="d-flex flex-column">
                            <p class="text mb-1">Имя человека</p>
                            <input class="form-control mb-3 input1" type="text" placeholder="">
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="d-flex flex-column">
                            <p class="text mb-1">Номер карты</p>
                            <input class="form-control mb-3 input1" type="text" placeholder="1234 5678 435678">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex flex-column">
                            <p class="text mb-1">Дата</p>
                            <input class="form-control mb-3 input1" type="text" placeholder="MM/YYYY">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex flex-column">
                            <p class="text mb-1">CVV/CVC</p>
                            <input class="form-control mb-3 pt-2 input1" type="password" placeholder="***">
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="btn btn-primary mb-3">
                            <span class="ps-3">Оплатить 15000 ₸</span>
                            <span class="fas fa-arrow-right"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="overlay js-overlay-modal1"></div>
</div>

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
