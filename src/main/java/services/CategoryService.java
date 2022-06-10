package services;

import models.CategoryModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    private static CategoryService instance = new CategoryService();

    public static CategoryService getInstance() {
        return instance;
    }

    private CategoryService() {
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

    /**
     *
     * @param categoryId
     * @return
     */
    public CategoryModel getCategoryById(int categoryId) {
        String sql = "SELECT * FROM categories WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return createCategoryModel(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
                categories.add(createCategoryModel(resultSet));
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    /**
     * creates category object by result set
     * @param resultSet
     * @return
     * @throws SQLException
     */
    private CategoryModel createCategoryModel(ResultSet resultSet) throws SQLException {
        CategoryModel categoryModel = new CategoryModel(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("image")
        );
        return categoryModel;
    }
}