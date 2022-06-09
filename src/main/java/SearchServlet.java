import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String text = request.getParameter("searchText");
        String searchText = "%";
        searchText += text;
        searchText += "%";
        System.out.println(searchText);
        request.setAttribute("searchText", searchText);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
