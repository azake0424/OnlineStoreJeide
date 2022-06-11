package services;

import models.CategoryModel;
import models.ProductModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
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


    public int insertCategory(String catname) {
        String sql = "insert into categories(name) values(?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, catname);

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


    public int insertOrder(int user_id, int product_id) {
        String sql = "insert into order_details(user_id, product_id) values(?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, product_id);

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
                ProductModel productModel = this.createProductModel(resultSet);
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
     * @return
     */
    public List<ProductModel> getProductsBySearch(String name) {
        List<ProductModel> searchProducts = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE lower(name) LIKE lower(?) OR lower(brand) LIKE lower(?) OR lower(type) like lower(?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProductModel productModel = this.createProductModel(resultSet);
                searchProducts.add(productModel);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchProducts;
    }

    /**
     * returns products by category id
     * @param categoryId
     * @return
     */
    public List<ProductModel> getProductsByCategoryId(int categoryId) {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE category_id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProductModel productModel = this.createProductModel(resultSet);
                products.add(productModel);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     *
     */
    public List<String> getTypes() {
        List<String> types = new ArrayList<>();
        String sql = "SELECT DISTINCT type FROM product";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                types.add(resultSet.getString("type"));
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return types;
    }

    /**
     * returns products by filter
     * @param categoryId
     * @param to
     * @param from
     * @param type
     * @param size
     * @return
     */
    public List<ProductModel> getProductsByFilter(int categoryId, int from, int to, String type, String size) {
        String sql = "SELECT * FROM product WHERE";
        if (categoryId != 0) {
            sql += " category_id = " + categoryId + " AND";
        }
        if (from != 0) {
            sql += " price >= " + from + " AND";
        }
        if (to != 0) {
            sql += " price <= " + to + " AND";
        }
        if (type != null) {
            sql += " type LIKE '%" + type + "%' AND";
        }
        if (size != null) {
            sql += " size LIKE '%" + size + "%' AND";
        }
        sql = sql.substring(0, sql.lastIndexOf(" "));
        System.out.println(sql);
        List<ProductModel> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                products.add(createProductModel(resultSet));
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
     * @return
     */
    public List<ProductModel> getProductsBySort() {
        List<ProductModel> sortProducts = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER by id DESC";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                ProductModel productModel = this.createProductModel(resultSet);
                sortProducts.add(productModel);
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sortProducts;
    }

    /**
     * returns product by id
     * @param id
     * @return
     */
    public ProductModel getProductById(int id) {
        ProductModel product = new ProductModel();
        String sql = "SELECT * FROM product WHERE id = ? LIMIT 1";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                product = createProductModel(resultSet);
            }
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
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

    public void deleteProductFromBasket(int id) {
        String sql = "DELETE FROM order_details WHERE order_id = ?";
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
     *
     * @param resultSet
     * @return
     * @throws SQLException
     */
    private ProductModel createProductModel(ResultSet resultSet) throws SQLException {
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
        return productModel;
    }

}