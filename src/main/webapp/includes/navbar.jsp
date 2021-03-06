<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark px-2" href="https://www.facebook.com/">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="https://twitter.com/?lang=ru">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="https://ru.linkedin.com/">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="https://www.instagram.com/">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="https://www.youtube.com/">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="/" class="text-decoration-none">
                <div  style="position: relative"><img src="images/jeide.png" width="200"></div>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form method="post" action="/search">
                <div class="input-group">
                    <input type="text" class="form-control" id="searchtext" name="searchtext" placeholder="Search for products">
                    <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">
            <a href="" class="btn border">
                <i class="fas fa-heart text-primary"></i>
                <span class="badge">0</span>
            </a>
            <a href="" class="btn border">


                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">0</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->

<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 100;">
                <div class="navbar-nav w-100 overflow-hidden">
                    <c:forEach var="category" items="${categories}">
                        <a href="/products?category_id=${category.id}" class="nav-item nav-link">${category.name}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/" class="nav-item nav-link">Home</a>
                        <a href="/products" class="nav-item nav-link">Shop</a>
                        <div class="nav-item dropdown">
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                <a href="checkout.html" class="dropdown-item">Checkout</a>
                            </div>
                        </div>
                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <c:if test="${sessionScope.email != null}">
                            <a href="/profile" class="nav-item nav-link">Cart</a>
                            <a href="/logout.jsp" class="nav-item nav-link">Logout</a>
                        </c:if>
                        <c:if test="${sessionScope.email == null}">
                            <a href="/LoginServlet" class="nav-item nav-link">Login</a>
                            <a href="/RegistrationServlet" class="nav-item nav-link">Register</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
