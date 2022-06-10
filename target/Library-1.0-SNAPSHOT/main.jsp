<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar_main.jsp"%>

<div class="container" style="width: 80%;">
    <div class="row">
        <c:forEach var="category" items="${categories}">
            <div class="col m-3" style="background: #ededed;height: 200px">
                <a href="/products?category_id=${category.id}"><img src="${category.image}" width="265px" alt=""></a>
                <h4 style="font-family: 'Poppins', sans-serif;"><span style="height: 30px; width: 140px;background-color: white;margin-top: -110px;margin-left: 90px;position: absolute;text-align: center">${category.name}'S</span></h4>
            </div>
        </c:forEach>
    </div>
</div>

<div class="container" style="width: 80%;text-align: left" >
    <h2 class="my-5">Популярные</h2>
    <hr>
    <div class="row">
        <sql:query var="products" dataSource="jdbc/testdb">
            SELECT * FROM product ORDER BY id DESC limit 4
        </sql:query>
        <c:forEach var="product" items="${products.rows}">
            <div class="card m-3" style="width: 9rem;">
                <a href="/product?product_id=<c:out value="${product.id}"/>"><img src="<c:out value="${product.image}"/>" class="card-img-top" alt="..."></a>
                <div class="card-body">
                    <p class="card-title" style="font-family: 'Dosis', sans-serif; margin-top: -5px"><c:out value="${product.brand}"/></p>
                    <p class="card-text"><c:out value="${product.price}"/> ₸</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<%@include file="includes/footer.jsp"%>
</body>
</html>
