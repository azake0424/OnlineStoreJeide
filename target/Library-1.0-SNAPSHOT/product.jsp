<%@ page import="org.postgresql.jdbc.PgArray" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="js/pay.js"></script>
    <script src="https://pay.fondy.eu/latest/checkout.js"></script>
    <script src="https://pay.fondy.eu/latest/i18n/ru.js"></script>
    <link rel="stylesheet" href="https://pay.fondy.eu/latest/checkout.css">
    <script>
        $(document).ready(function () {
            $("#addCart").click(function (event) {
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
                            alert("Successfully added!");
                        } else {
                            alert("Something went wrong!");
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
<%@include file="includes/navbar.jsp"%>

<!-- Shop Detail Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 pb-5">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner border">
                    <div class="carousel-item active">
                        <img class="w-100 h-100" src="${product.image}" alt="Image">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-7 pb-5">
            <h3 class="font-weight-semi-bold">${product.name} | $${product.price}</h3>
            <p class="mb-4">${product.article}</p>
            <div class="d-flex mb-3">
                <p class="text-dark font-weight-medium mb-0 mr-3">Sizes: ${product.size}</p>
            </div>
            <div class="d-flex align-items-center mb-4 pt-2">
                <div class="input-group quantity mr-3" style="width: 130px;">
                    <div class="input-group-btn">
                        <button class="btn btn-primary btn-minus" >
                            <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <input type="text" class="form-control bg-secondary text-center" value="1">
                    <div class="input-group-btn">
                        <button class="btn btn-primary btn-plus">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <a href="addtocart?product_id=<c:out value="${product.id}"/>" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</a>
            </div>
            <div class="d-flex pt-2">
                <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                <div class="d-inline-flex">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-pinterest"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h4 class="mb-3">Product Description</h4>
                    <p>${product.description}</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->


<%@include file="includes/footer.jsp"%>
</body>
</html>
