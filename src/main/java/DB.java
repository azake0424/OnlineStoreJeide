import models.UserModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.HashMap;
import java.util.List;

public class DB {
    private static DB instance = new DB();

    public static DB getInstance() {
        return instance;
    }

    private DB() {
    }

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

    public UserModel login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email='" + email + "' and password='" + password + "' LIMIT 1";
        try {
            Connection connection = getConnection();
            Statement s = connection.createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                UserModel user = new UserModel();
                user.id = rs.getInt("id");
                user.email = rs.getString("email");
                user.fullName = rs.getString("full_name");
                user.password = rs.getString("password");
                user.isAdmin = rs.getBoolean("isAdmin");
                return user;
            }
            s.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int check(String email) {
        String sql = "SELECT id FROM users WHERE email='" + email + "'";
        try {
            Connection connection = getConnection();
            Statement s = connection.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                return rs.getInt("id");
            }
            s.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int insert(String email, String fio, String password) {
        String sql = "insert into users(email, full_name, password) values(?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, fio);
            preparedStatement.setString(3, password);
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

    public int buy(Integer userId, HashMap<Integer, List<String>> cart) {
        Date date = new Date(System.currentTimeMillis());
        String sql = "insert into orders(user_id, date_purchase) values(?, ?)";
        Integer orderId = 0;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);
            preparedStatement.setDate(2, date);
            if (preparedStatement.executeUpdate() > 0) {
                sql = "SELECT order_id FROM orders WHERE user_id='" + userId + "' and date_purchase='" + date + "'";
                Statement s = connection.createStatement();
                ResultSet rs = s.executeQuery(sql);
                while (rs.next()) {
                    orderId = rs.getInt("order_id");
                }
                s.close();
            }
            for (Integer id : cart.keySet()) {
                String orderSql = "insert into order_details(order_id, user_id, product_id, size) values(?, ?, ?, ?)";
                connection = getConnection();
                preparedStatement = connection.prepareStatement(orderSql);
                preparedStatement.setInt(1, orderId);
                preparedStatement.setInt(2, userId);
                preparedStatement.setInt(3, id);
                preparedStatement.setString(4, cart.get(id).get(0));
            }
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
}