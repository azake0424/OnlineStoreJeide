import models.CategoryModel;
import services.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);
        if (session.getAttribute("id") != null) {
            if (session.getAttribute("cart") != null) {
                Integer userId = (Integer) session.getAttribute("id");
                HashMap<Integer, List<String>> cart = (HashMap<Integer, List<String>>) session.getAttribute("cart");
                int result = DB.getInstance().buy(userId, cart);
                session.removeAttribute("cart");
                response.getWriter().write("True");
            }
        }
    }
}
