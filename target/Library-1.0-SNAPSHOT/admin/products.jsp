<%@ page import="models.CategoryModel" %>
<%@ page import="java.util.List" %>
<%@ page import="models.ProductModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/admin/head.jsp"%>

<body id="reportsPage">
<%@include file="../includes/admin/navbar.jsp"%>
<div class="container mt-5">
    <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-products">
                <div class="tm-product-table-container">
                    <table class="table table-hover tm-table-small tm-product-table">
                        <thead>
                        <tr>
                            <th scope="col">&nbsp;</th>
                            <th scope="col">PRODUCT NAME</th>
                            <th scope="col">BRAND</th>
                            <th scope="col">IN STOCK</th>
                            <th scope="col">TYPE</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<ProductModel> productModelList = (List<ProductModel>) request.getAttribute("products");
                            for (ProductModel p : productModelList) {
                                out.print("<tr><th scope=\"row\"><input type=\"checkbox\" disabled/></th>\n");
                                out.print("<td class='tm-product-name'>" + p.name + "</td>");
                                out.print("<td>" + p.brand + "</td>");
                                out.print("<td>" + p.amount + "</td>");
                                out.print("<td>" + p.type + "</td>");
                                out.print("<td>\n" +
                                        "<a href=\"/admin/delete?id=" + p.id + "\" class=\"tm-product-delete-link\">\n" +
                                        "   <i class=\"far fa-trash-alt tm-product-delete-icon\"></i>\n" +
                                        "</a></td></tr>");
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <a
                        href="/admin/AddProduct"
                        class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
            </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                <h2 class="tm-block-title">Product Categories</h2>
                <div class="tm-product-table-container">
                    <table class="table tm-table-small tm-product-table">
                        <tbody>
                        <%
                            List<CategoryModel> categoryModelsList = (List<CategoryModel>) request.getAttribute("categories");
                            for (CategoryModel c : categoryModelsList) {
                                out.print("<tr>\n" +
                                        "                            <td class=\"tm-product-name\">" + c.name + "</td>\n" +
                                        "                            <td class=\"text-center\">\n" +
                                        "                                <a href=\"/admin/category-delete?id=" + c.id + "\" class=\"tm-product-delete-link\">\n" +
                                        "                                    <i class=\"far fa-trash-alt tm-product-delete-icon\"></i>\n" +
                                        "                                </a>\n" +
                                        "                            </td>\n" +
                                        "                        </tr>");
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <!-- table container -->
                <button class="btn btn-primary btn-block text-uppercase mb-3">
                    Add new category (NOT IMPLEMENTED)
                </button>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="../includes/admin/footer.jsp"%>
</body>
