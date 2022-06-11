import models.CategoryModel;
import models.ProductModel;
import services.CategoryService;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/sort")
public class SortByLatest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductModel> products = ProductService.getInstance().getProductsBySort();

        req.setAttribute("products", products);

        req.getRequestDispatcher("/products.jsp").forward(req, resp);


    }
}
