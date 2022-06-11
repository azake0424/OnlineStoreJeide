<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: zangar
  Date: 11.06.2022
  Time: 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div class="mb-4">
                <h4 class="font-weight-semi-bold mb-4">Checkout</h4>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>First Name</label>
                        <input class="form-control" type="text" placeholder="John">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Last Name</label>
                        <input class="form-control" type="text" placeholder="Doe">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Card Number</label>
                        <input class="form-control" type="text" placeholder="1234 5678 9012 4567">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Expiry</label>
                        <input class="form-control" type="text" placeholder="MM/YYYY">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>CVV/CVC</label>
                        <input class="form-control" type="text" placeholder="123">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                </div>
                <div class="card-body">
                    <h5 class="font-weight-medium mb-3">Products</h5>
                    <hr class="mt-0">
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

                <sql:query var="products1" dataSource="jdbc/testdb">

                    SELECT sum(price) FROM order_details
                    INNER JOIN product ON order_details.product_id=product.id
                    WHERE user_id = ${sessionScope.id}

                </sql:query>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <c:forEach var="product" items="${products1.rows}">
                            <h5 class="font-weight-bold">$<c:out value="${product.sum}"/></h5>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Payment</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="paypal">
                            <label class="custom-control-label" for="paypal">Visa</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                            <label class="custom-control-label" for="directcheck">MasterCard</label>
                        </div>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</button>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="includes/footer.jsp" %>
</body>
</html>
