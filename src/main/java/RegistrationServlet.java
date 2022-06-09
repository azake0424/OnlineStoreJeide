import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
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