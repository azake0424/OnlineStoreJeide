package admin;

import com.google.gson.Gson;
import models.CategoryModel;
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

@WebServlet("/admin/AddProduct")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryModel> categories = ProductService.getInstance().getCategories();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/admin/add.jsp").forward(req, resp);
    }

    /**
     * returns categories
     * @param req
     * @param res
     * @throws ServletException
     * @throws IOException
     */
    public void getCategories(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException  {
        List<CategoryModel> categories = ProductService.getInstance().getCategories();
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
        List<CategoryModel> categories = ProductService.getInstance().getCategories();
        request.setAttribute("categories", categories);

        HttpSession session = request.getSession(true);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");
        String article = request.getParameter("article");
        Integer price = Integer.valueOf(request.getParameter("price"));
        String size = request.getParameter("size");
        int categoryId = Integer.valueOf(request.getParameter("category_id"));
        String image = request.getParameter("image");
        String type = request.getParameter("type");
        int amount = Integer.valueOf(request.getParameter("amount"));

        // save db
        int result = ProductService.getInstance().insert(name, article, brand, image, description, categoryId, price, size, type, amount);
        if (result == 0) {
            request.setAttribute("message", "Oops... something got wrong =(");
        } else {
            request.setAttribute("message", "Product was added");
        }

        request.getRequestDispatcher("/admin/add.jsp").forward(request, response);
    }
}