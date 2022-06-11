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



<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">

        <sql:query var="products" dataSource="jdbc/testdb">
            SELECT * FROM product ORDER BY id DESC limit 4
        </sql:query>
        <c:forEach var="product" items="${products.rows}">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="<c:out value="${product.image}"/>" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3"><c:out value="${product.name}"/></h6>
                    <div class="d-flex justify-content-center">
                        <h6>$<c:out value="${product.price}"/></h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="product?product_id=<c:out value="${product.id}"/>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                    <a href="/addtocart?product_id=<c:out value="${product.id}"/>" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>


<%@include file="includes/footer.jsp"%>
</body>
</html>
