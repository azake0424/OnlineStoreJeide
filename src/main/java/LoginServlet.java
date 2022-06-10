import models.CategoryModel;
import models.UserModel;
import services.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserModel user = DB.getInstance().login(email, password);
        if (user == null) {
            request.setAttribute("message", "Логин или пароль неверный");
            return;
        }
        session.setAttribute("email", user.email);
        session.setAttribute("fullName", user.fullName);
        session.setAttribute("isAdmin", user.isAdmin);
        session.setAttribute("id", user.id);
        response.getWriter().print("True");
    }
}