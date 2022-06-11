<%--
  Created by IntelliJ IDEA.
  User: zangar
  Date: 09.06.2022
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <div style="position: relative"><img src="images/jeide.png" width="200"></div>
            </a>
            <p>This website was made by students of Astana IT University.</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Turkistan street, Nur-Sultan,
                Kazakhstan</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>infojeide@gmial..com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+7(700)-700-7070</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-5 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="/"><i class="fa fa-angle-right mr-2"></i>Home</a>
                        <a class="text-dark mb-2" href="/products"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                        <a class="text-dark" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-5 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                    <form action="">
                        <div class="form-group">
                            <input type="text" class="form-control border-0 py-4" placeholder="Your Name"
                                   required="required"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                   required="required"/>
                        </div>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-dark">
                &copy; <a class="text-dark font-weight-semi-bold" href="/">Jeide</a>. All Rights Reserved.
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="img/payments.png" alt="">
        </div>
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script>
    <%@include file="../lib/easing/easing.min.js" %>
</script>
<script>
    <%@include file="../lib/owlcarousel/owl.carousel.js" %>
</script>
<script>
    <%@include file="../mail/jqBootstrapValidation.min.js" %>
</script>
<script>
    <%@include file="../mail/contact.js" %>
</script>
<script>
    <%@include file="../js/main.js" %>
</script>