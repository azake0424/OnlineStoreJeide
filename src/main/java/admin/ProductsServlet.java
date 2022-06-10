package admin;

import models.CategoryModel;
import models.ProductModel;
import services.ProductService;
import services.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products")
public class ProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductModel> productModelList = ProductService.getInstance().getProducts();
        List<CategoryModel> categoryModelsList = CategoryService.getInstance().getCategories();
        req.setAttribute("products", productModelList);
        req.setAttribute("categories", categoryModelsList);
        req.getRequestDispatcher("/admin/products.jsp").forward(req, resp);
    }
}
