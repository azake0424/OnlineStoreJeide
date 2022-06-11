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

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                <tr>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Remove</th>
                </tr>
                </thead>
                <tbody class="align-middle">

                <sql:query var="products" dataSource="jdbc/testdb">

                    SELECT * FROM order_details
                    INNER JOIN product ON order_details.product_id=product.id
                    WHERE user_id = ${sessionScope.id}

                </sql:query>
                <c:forEach var="product" items="${products.rows}">
                <tr>
                    <td class="align-middle"><img src="<c:out value="${product.image}"/>" alt="" style="width: 50px;"><c:out value="${product.name}"/></td>
                    <td class="align-middle">$<c:out value="${product.price}"/></td>
                    <td class="align-middle"><a href="/order/delete?order_id=${product.order_id}" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                </div>
                <div class="card-body">
                <sql:query var="products" dataSource="jdbc/testdb">

                    SELECT * FROM order_details
                    INNER JOIN product ON order_details.product_id=product.id
                    WHERE user_id = ${sessionScope.id}

                </sql:query>
                <c:forEach var="product" items="${products.rows}">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium"><c:out value="${product.brand}"/></h6>
                        <h6 class="font-weight-medium">$<c:out value="${product.price}"/></h6>
                    </div>
                </c:forEach>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <sql:query var="products" dataSource="jdbc/testdb">

                            SELECT sum(price) FROM order_details
                            INNER JOIN product ON order_details.product_id=product.id
                            WHERE user_id = ${sessionScope.id}

                        </sql:query>
                        <h5 class="font-weight-bold">Total</h5>
                        <c:forEach var="product" items="${products.rows}">
                        <h5 class="font-weight-bold">$<c:out value="${product.sum}"/></h5>
                        </c:forEach>
                    </div>
                    <a href="checkout.jsp" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="includes/footer.jsp" %>
</body>
</html>
