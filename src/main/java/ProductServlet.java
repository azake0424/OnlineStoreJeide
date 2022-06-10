import models.CategoryModel;
import models.ProductModel;
import services.CategoryService;
import services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        request.setAttribute("categories", categories);

        int productId = Integer.valueOf(request.getParameter("product_id"));

        ProductModel product = ProductService.getInstance().getProductById(productId);

        request.setAttribute("product", product);

        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);
        if (session.getAttribute("id") != null) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String size = request.getParameter("size");
            if (session.getAttribute("cart") == null) {
                session.setAttribute("cart", new HashMap<Integer, List<String>>());
            }
            HashMap<Integer, List<String>> cart = (HashMap<Integer, List<String>>) session.getAttribute("cart");
            List<String> list = new ArrayList<>();
            list.add(size);
            cart.put(productId, list);
            session.removeAttribute("cart");
            session.setAttribute("cart", cart);
            response.getWriter().write("True");
        }
    }
}
