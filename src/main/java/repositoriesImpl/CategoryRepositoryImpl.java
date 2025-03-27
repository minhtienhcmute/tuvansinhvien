package repositoriesImpl;

import models.Category;
import repositories.ICategoryRepository;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepositoryImpl implements ICategoryRepository {
    private static final String INSERT = "INSERT INTO categories" + "  (name) VALUES " +
            " (?);";

    private static final String SELECT_BY_ID = "select id,name,status,category_id from categories where id =?";
    private static final String SELECT_ALL= "select * from categories";
    private static final String DELETE_BY_ID= "delete from categories where id = ?;";
    private static final String UPDATE_BY_ID= "update categories set name = ? where id = ?;";
    Connection conn = null;


    @Override
    public void add(Category item) {
        try(Connection conn= DBConnectionPool.getConnection();PreparedStatement ps = conn.prepareStatement(INSERT)){
            ps.setString(1, item.getName());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
    }

    @Override
    public void update(Category item) {
        try(Connection conn= DBConnectionPool.getConnection();PreparedStatement ps = conn.prepareStatement(UPDATE_BY_ID)){
            ps.setString(1, item.getName());
            ps.setInt(2, item.getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
    }

    @Override
    public void delete(Category item) {
        try(Connection conn= DBConnectionPool.getConnection();PreparedStatement ps = conn.prepareStatement(DELETE_BY_ID)){
            ps.setString(1, item.getName());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
    }

    @Override
    public Category getById(int id) {

        Category category = null;
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnectionPool.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int cateId = rs.getInt("id");
                String name = rs.getString("name");
                category = new Category(cateId, name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
        return category;
    }

    @Override
    public List<Category> getAll() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Category > categories = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnectionPool.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int cateId = rs.getInt("id");
                String name = rs.getString("name");

                categories.add( new Category(cateId, name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return categories;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }}
