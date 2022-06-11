<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/admin/head.jsp"%>
<body>
<%@include file="../includes/admin/navbar.jsp"%>
<div class="container tm-mt-big tm-mb-big"style="background-color: #EDF1FF" >
    <br>
    <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Add Category</h2>
                        <%
                            if (request.getAttribute("message") != null) {
                                out.print("<div class='alert alert-secondary' role='alert'>");
                                out.print("<b>" + request.getAttribute("message") + "</b>");
                                out.print("</div>");
                            }
                        %>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <form action="/admin/AddCategory" method="POST" class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label
                                        for="catname"
                                >Category name
                                </label>
                                <input
                                        id="catname"
                                        name="catname"
                                        type="text"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Category Now</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../includes/admin/footer.jsp"%>
    </body>
    </html>
