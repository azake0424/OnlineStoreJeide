import models.CategoryModel;
import services.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("registration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String email = request.getParameter("email");
        String fio = request.getParameter("fio");
        String password = request.getParameter("password");

        if (DB.getInstance().check(email) == -1) {
            int i = DB.getInstance().insert(email, fio, password);
            if (i == 1) {
                response.getWriter().write("True");
            }
        }
    }
}