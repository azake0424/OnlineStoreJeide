<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Jeide</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200&family=Poppins:ital,wght@0,300;1,800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="js/slide.js" ></script>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="navbar navbar-dark shadow-sm" style="background: #71A915; height: 70px">
    <div class="container align-items-center">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" style="margin-top: -50px" href="/"><img src="images/jeide.png" width="100px" ></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto align-items-center">
                    <li class="nav-item" style="margin-top: -27px;margin-left: -30px">
                        <a class="nav-link" href="/" style="color: white">8700-700-7070</a>
                    </li>
                    <li class="nav-item" style="margin-top: -10px">
                        <form action="SearchServlet" method="post" class="d-flex">
                            <input type="text" class="form-control" style="border-radius: 20px" id="searchText" name="searchText">
                            <img src="">
                        </form>
                    </li>
                    <li class="nav-item dropdown" style="color: white; margin-top: -27px">
                        <button  class="nav-link dropdown-toggle" style="background: none; border: none;color: white" type="button"
                                id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            Каталог
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="color: white">
                            <li><a class="dropdown-item" href="men.jsp">Мужские одежды</a></li>
                            <li><a class="dropdown-item" href="women.jsp">Женские одежды</a></li>
                            <li><a class="dropdown-item" href="baby.jsp">Детские одежды</a></li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.email != null}">
                        <li class="nav-item"  style="margin-left: 300px;margin-top: -27px">
                            <a class="nav-link" href="logout.jsp">Выйти</a>
                        </li>
                        <li class="nav-item" style="margin-top: -27px">
                            <a class="nav-link" href="profile.jsp">Корзина</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.email == null}">

                        <li class="nav-item" style="margin-left: 300px;margin-top: -27px">
                            <a class="btn btn-outline-light" href="login.jsp">Логин</a>
                        </li>
                        <li class="nav-item" style="margin-top: -27px">
                            <a class="btn btn-success" href="registration.jsp">Регистрация</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </div>
</div>
<div class="container-fluid">
    <!-- Define the slideshow container -->
    <div class="slide1" id="slideshow">
        <div class="slide-wrapper">

            <!-- Define each of the slides
         and write the content -->
            <div class="slide">
                <img class="slide-number" src="images/image%202.png" width="1200">
            </div>
            <div class="slide">
                <img class="slide-number" src="images/IMG_18799.jpg">
            </div>
            <div class="slide">
                <img class="slide-number" src="images/dets.jpg">
            </div>
        </div>
    </div>
    <div class="row text-left my-3" style="margin-left: 50px">
        <h1 style="font-family: 'Poppins', sans-serif;">Лучшие цены в Казахстане</h1>
    </div>
</div>

<div class="container" style="width: 80%;">
    <div class="row">
        <div class="col m-3" style="background: #ededed;height: 200px">
            <a href="men.jsp"><img src="images/man.png" width="265px" alt=""></a>
            <h4 style="font-family: 'Poppins', sans-serif;"><span style="height: 30px; width: 140px;background-color: white;margin-top: -110px;margin-left: 90px;position: absolute;text-align: center">MEN'S</span></h4>
        </div>
        <div class="col m-3" style="background: #ededed;height: 200px">
            <a href="baby.jsp"><img src="images/baby.png" width="265px" alt=""></a>
            <h4 style="font-family: 'Poppins', sans-serif;"><span style="height: 30px; width: 140px;background-color: white;margin-top: -110px;margin-left: 90px;position: absolute;text-align: center">BABIE'S</span></h4>
        </div>
        <div class="col m-3" style="background: #ededed;height: 200px">
            <a href="women.jsp"><img src="images/women.png" width="265px" alt=""></a>
            <h4 style="font-family: 'Poppins', sans-serif;"><span style="height: 30px; width: 140px;background-color: white;margin-top: -110px;margin-left: 90px;position: absolute;text-align: center">WOMEN'S</span></h4>
        </div>

    </div>
</div>

<div class="container" style="width: 80%;text-align: left" >
    <h2 class="my-5">Популярные</h2>
    <hr>
    <div class="row">
        <sql:query var="products" dataSource="jdbc/testdb">
            SELECT * FROM product WHERE id < 7
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
