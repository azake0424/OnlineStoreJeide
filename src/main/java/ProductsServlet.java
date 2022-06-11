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

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        req.setAttribute("categories", categories);

        List<String> types = ProductService.getInstance().getTypes();
        req.setAttribute("types", types);

        int categoryId = 0;
        if (req.getParameter("category_id") != null) {
            try {
                categoryId = Integer.valueOf(req.getParameter("category_id"));
            } catch (NumberFormatException e) {
                categoryId = 0;
            }
        }

        int to = 0;
        int from = 0;
        if (req.getParameter("range") != null && req.getParameter("range") != "") {
            System.out.println(req.getParameter("range"));
            String[] spl = req.getParameter("range").split("-");
            System.out.println(spl);
            to = Integer.valueOf(spl[1]);
            from = Integer.valueOf(spl[0]);
        }
        String type = req.getParameter("type");
        String size = req.getParameter("size");

        List<ProductModel> products = ProductService.getInstance().getProductsByFilter(categoryId, from, to, type, size);

        req.setAttribute("products", products);

        req.getRequestDispatcher("/products.jsp").forward(req, resp);
    }
}
