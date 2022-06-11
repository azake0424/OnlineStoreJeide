import models.ProductModel;
import services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/addtocart")
public class BasketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        int user_id = (Integer) session.getAttribute("id");

        int product_id = 0;
        if (req.getParameter("product_id") != null) {
            try {
                product_id = Integer.valueOf(req.getParameter("product_id"));
            } catch (NumberFormatException e) {
                product_id = 0;
            }
        }


        int result = ProductService.getInstance().insertOrder(user_id, product_id);
        if (result == 0) {
            req.setAttribute("message", "Oops... something got wrong =(");
        } else {
            req.setAttribute("message", "Product was added");
        }

        resp.sendRedirect("/products");
    }
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
