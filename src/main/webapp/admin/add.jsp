<%@ page import="models.CategoryModel" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/admin/head.jsp"%>
<body>
<%@include file="../includes/admin/navbar.jsp"%>
<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Add Product</h2>
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
                        <form action="/admin/AddProduct" method="POST" class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label
                                        for="name"
                                >Product Name
                                </label>
                                <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <!-- article -->
                            <div class="form-group mb-3">
                                <label
                                        for="article"
                                >Article
                                </label>
                                <input
                                        id="article"
                                        name="article"
                                        type="text"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <!-- brand -->
                            <div class="form-group mb-3">
                                <label
                                        for="brand"
                                >Brand
                                </label>
                                <input
                                        id="brand"
                                        name="brand"
                                        type="text"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <!-- type -->
                            <div class="form-group mb-3">
                                <label
                                        for="type"
                                >Type
                                </label>
                                <input
                                        id="type"
                                        name="type"
                                        type="text"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label
                                        for="amount"
                                >Amount
                                </label>
                                <input
                                        id="amount"
                                        name="amount"
                                        type="number"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label
                                        for="image"
                                >Image Link
                                </label>
                                <input
                                        id="image"
                                        name="image"
                                        type="text"
                                        class="form-control validate"
                                        required
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label
                                        for="description"
                                >Description</label
                                >
                                <textarea
                                        class="form-control validate"
                                        id="description"
                                        name="description"
                                        rows="3"
                                        required
                                ></textarea>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="category"
                                >Category</label
                                >
                                <select
                                        class="custom-select tm-select-accounts"
                                        name="category_id"
                                        id="category"
                                >
                                    <option selected>Select category</option>
                                    <%
                                        List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");
                                        for (CategoryModel c : categories) {
                                            out.print("<option value=" + c.id + " >" + c.name + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label
                                            for="price"
                                    >Price
                                    </label>
                                    <input
                                            id="price"
                                            name="price"
                                            type="number"
                                            class="form-control validate"
                                            data-large-mode="true"
                                    />
                                </div>
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label
                                            for="size"
                                    >Size
                                    </label>
                                    <input
                                            id="size"
                                            name="size"
                                            type="text"
                                            class="form-control validate"
                                            required
                                    />
                                </div>
                            </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
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
