import models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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