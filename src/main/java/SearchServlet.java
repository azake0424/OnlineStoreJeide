import models.CategoryModel;
import models.ProductModel;
import services.CategoryService;
import services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchtext = request.getParameter("searchtext");

        List<ProductModel> products = ProductService.getInstance().getProductsBySearch(searchtext);

        request.setAttribute("products", products);

        request.getRequestDispatcher("/products.jsp").forward(request, response);

    }
}
