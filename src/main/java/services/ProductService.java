package services;

import models.CategoryModel;
import models.ProductModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;
import java.io.IOException;
import java.net.ConnectException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductService {
    private static ProductService instance = new ProductService();

    public static ProductService getInstance() {
        return instance;
    }

    private ProductService() {
    }

    /**
     *
     * @return
     */
    private Connection getConnection() {
        Context initialContext;
        Connection connection = null;
        try {
            initialContext = new InitialContext();
            Context envCtx = (Context) initialContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/testdb");
            connection = ds.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * returns categories from db
     */
    public List<CategoryModel> getCategories() {
        List<CategoryModel> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories ORDER BY id";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                categories.add(new CategoryModel(id, name));
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    /**
     *
     * @param name
     * @param article
     * @param brand
     * @param image
     * @param description
     * @param categoryId
     * @param price
     * @param size
     * @param type
     * @return
     */
    public int insert(String name, String article, String brand, String image, String description, int categoryId, int price, String size, String type, int amount) {
        String sql = "insert into product(name, article, brand, image, description, category_id, price, size, type, amount) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, article);
            preparedStatement.setString(3, brand);
            preparedStatement.setString(4, image);
            preparedStatement.setString(5, description);
            preparedStatement.setInt(6, categoryId);
            preparedStatement.setInt(7, price);
            preparedStatement.setString(8, size);
            preparedStatement.setString(9, type);
            preparedStatement.setInt(10, amount);

            if (preparedStatement.executeUpdate() > 0) {
                return 1;
            }
            connection.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     *
     * @return
     */
    public List<ProductModel> getProducts() {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER by id ASC";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                ProductModel productModel = new ProductModel();
                productModel.id = resultSet.getInt("id");
                productModel.name = resultSet.getString("name");
                productModel.type = resultSet.getString("type");
                productModel.article = resultSet.getString("article");
                productModel.brand = resultSet.getString("brand");
                productModel.size = resultSet.getString("size");
                productModel.description = resultSet.getString("description");
                productModel.price = resultSet.getInt("price");
                productModel.image = resultSet.getString("image");
                productModel.categoryId = resultSet.getInt("category_id");
                productModel.amount = resultSet.getInt("amount");
                products.add(productModel);
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     *
     * @param id
     */
    public void deleteProduct(int id) {
        String sql = "DELETE FROM product WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * @param id
     */
    public void deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}