<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container text-center">
    <h2 class="my-5">Результаты поиска</h2>
    <hr>
    <div class="row">
        <sql:query var="products" dataSource="jdbc/testdb">
            SELECT * FROM product WHERE name like ? or brand like ?
            <sql:param value="${requestScope.get('searchText')}"/>
            <sql:param value="${requestScope.get('searchText')}"/>
        </sql:query>
        <%
            System.out.println(request.getParameter("searchText"));
        %>
        <c:forEach var="product" items="${products.rows}">
            <div class="card m-2" style="width: 15rem;">
                <img src="<c:out value="${product.image}"/>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${product.name}"/></h5>
                    <p class="card-text"><c:out value="${product.price}"/> ₸</p>
                    <a href="/product?product_id=<c:out value="${product.id}"/>" class="btn btn-primary">Смотреть
                        подробнее</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
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