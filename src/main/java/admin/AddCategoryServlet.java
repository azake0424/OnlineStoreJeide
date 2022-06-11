package admin;

import com.google.gson.Gson;
import models.CategoryModel;
import services.CategoryService;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/admin/AddCategory")
public class AddCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/admin/addcategory.jsp").forward(req, resp);
    }

    /**
     * returns categories
     * @param req
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    public void getCategories(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException  {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        String json = new Gson().toJson(categories);
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        PrintWriter out = res.getWriter();
        System.out.println(json);
        out.print(json);
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryModel> categories = CategoryService.getInstance().getCategories();
        request.setAttribute("categories", categories);

        HttpSession session = request.getSession(true);
        String catname = request.getParameter("catname");

        // save db
        int result = ProductService.getInstance().insertCategory(catname);
        if (result == 0) {
            request.setAttribute("message", "Oops... something got wrong =(");
        } else {
            request.setAttribute("message", "Product was added");
        }

        response.sendRedirect("http://localhost:8080/admin/products");
    }
}