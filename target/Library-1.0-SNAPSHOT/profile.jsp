<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
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
