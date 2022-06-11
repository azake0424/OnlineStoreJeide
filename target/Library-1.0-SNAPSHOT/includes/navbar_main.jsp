<%--
  Created by IntelliJ IDEA.
  User: zangar
  Date: 10.06.2022
  Time: 2:06
  To change this template use File | Settings | File Templates.
--%>
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
      <form  action="/search" method="post">
        <div class="input-group">
          <div id="danger-alert" class="alert alert-danger" style="display: none">
            Заполните поле
          </div>
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


<!-- Navbar Start -->
<div class="container-fluid mb-5">
  <div class="row border-top px-xl-5">
    <div class="col-lg-3 d-none d-lg-block">
      <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
        <h6 class="m-0">Categories</h6>
        <i class="fa fa-angle-down text-dark"></i>
      </a>
      <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
        <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
          <%--                    <div class="nav-item dropdown">--%>
          <%--                        <a href="#" class="nav-link" data-toggle="dropdown">Dresses <i class="fa fa-angle-down float-right mt-1"></i></a>--%>
          <%--                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">--%>
          <%--                            <a href="" class="dropdown-item">Men's Dresses</a>--%>
          <%--                            <a href="" class="dropdown-item">Women's Dresses</a>--%>
          <%--                            <a href="" class="dropdown-item">Baby's Dresses</a>--%>
          <%--                        </div>--%>
          <%--                    </div>--%>
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
            <a href="/" class="nav-item nav-link active">Home</a>
            <a href="/products" class="nav-item nav-link">Shop</a>
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
      <div id="header-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active" style="height: 410px;">
            <img class="img-fluid" src="images/image%202.png" alt="Image">
            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
              <div class="p-3" style="max-width: 700px;">
                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Dress</h3>
                <a href="/products" class="btn btn-light py-2 px-3">Shop Now</a>
              </div>
            </div>
          </div>
          <div class="carousel-item" style="height: 410px;">
            <img class="img-fluid" src="img/carousel-1.jpg" alt="Image">
            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
              <div class="p-3" style="max-width: 700px;">
                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                <a href="/products" class="btn btn-light py-2 px-3">Shop Now</a>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
          <div class="btn btn-dark" style="width: 45px; height: 45px;">
            <span class="carousel-control-prev-icon mb-n2"></span>
          </div>
        </a>
        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
          <div class="btn btn-dark" style="width: 45px; height: 45px;">
            <span class="carousel-control-next-icon mb-n2"></span>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>
<!-- Navbar End -->
