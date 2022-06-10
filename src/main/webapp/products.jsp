<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>



<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
        <form method="get">
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by type</h5>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" name="type" value="" id="type-all" class="custom-control-input" checked>
                    <label class="custom-control-label" for="type-all">All</label>
                </div>
                <c:forEach var="type" items="${types}">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="type" value="${type}" id="${type}" class="custom-control-input"
                            <c:if test="${param.type == type}">
                                checked
                            </c:if>
                        >
                        <label class="custom-control-label" for="${type}">${type}</label>
                    </div>
                </c:forEach>
            </div>
            <input type="text" name="category_id" value="${param.category_id}" hidden/>
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="range" value="" class="custom-control-input" checked id="price-all">
                        <label class="custom-control-label" for="price-all">All Price</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="range" value="0-100" class="custom-control-input" id="price-1"
                        <c:if test='${param.range == "0-100"}'>
                               checked
                        </c:if>
                        >
                        <label class="custom-control-label" for="price-1">$0 - $100</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="range" value="100-200" class="custom-control-input" id="price-2"
                        <c:if test='${param.range == "100-200"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="range" value="200-300" class="custom-control-input" id="price-3"
                        <c:if test='${param.range == "200-300"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="range" value="300-400" class="custom-control-input" id="price-4"
                        <c:if test='${param.range == "300-400"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="radio" name="range" value="400-500" class="custom-control-input" id="price-5"
                        <c:if test='${param.range == "400-500"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                    </div>
            </div>
            <!-- Price End -->

            <!-- Size Start -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="size" value="" class="custom-control-input" checked id="size-all">
                        <label class="custom-control-label" for="size-all">All Size</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="size" value="XS" class="custom-control-input" id="size-1"
                        <c:if test='${param.size == "XS"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="size-1">XS</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="size" value="S" class="custom-control-input" id="size-2"
                        <c:if test='${param.size == "S"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="size-2">S</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="size" value="M" class="custom-control-input" id="size-3"
                        <c:if test='${param.size == "M"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="size-3">M</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" name="size" value="L" class="custom-control-input" id="size-4"
                        <c:if test='${param.size == "L"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="size-4">L</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="radio" name="size" value="XL" class="custom-control-input" id="size-5"
                        <c:if test='${param.size == "XL"}'>
                               checked
                        </c:if>>
                        <label class="custom-control-label" for="size-5">XL</label>
                    </div>
            </div>
            <br>
            <button type="submit" class="btn btn-primary btn-block py-3">Filter</button>
        </form>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>

                <c:forEach var="product" items="${products}">
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="${product.image}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${product.name}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>${product.price}</h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="product?product_id=${product.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->

<%@include file="includes/footer.jsp" %>
</body>
</html>
