package repositoriesImpl;

import models.Book;
import repositories.IBookRepository;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepositoryImpl implements IBookRepository {
    private static final String INSERT_BOOK_SQL = "INSERT INTO book" + "  (name, status, category_id) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_BOOK_ID = "select id,name,status,category_id from book where id =?";
    private static final String SELECT_BOOKS_NAME = "select id,name,status,category_id from book where name =?";
    private static final String SELECT_ALL_BOOKS = "select * from book";
    private static final String DELETE_BOOKS_SQL = "delete from book where id = ?;";
    private static final String UPDATE_BOOKS_SQL = "update book set name = ?,status= ?, category_id =? where id = ?;";
    private static final String GET_BY_CATEGORY_ID = "select * FROM book where category_id = ?;";
    Connection conn = null;
    @Override
    public List<Book> getByName(String name) {

        List < Book > books = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnectionPool.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKS_NAME);) {
            preparedStatement.setString(1, name);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int book_id = rs.getInt("id");
                String book_name = rs.getString("name");
                Boolean status = rs.getBoolean("status");
                int category_id = rs.getInt("category_id");
                books.add( new Book(book_id, book_name, status, category_id));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;

    }

    @Override
    public List<Book> getByCategory(int categoryId) {
        List < Book > books = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnectionPool.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_CATEGORY_ID);) {
            preparedStatement.setInt(1, categoryId);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int book_id = rs.getInt("id");
                String book_name = rs.getString("name");
                Boolean status = rs.getBoolean("status");
                int category_id = rs.getInt("category_id");
                books.add( new Book(book_id, book_name, status, category_id));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;

    }

    @Override
    public void add(Book item) {
        try(Connection conn= DBConnectionPool.getConnection();PreparedStatement ps = conn.prepareStatement(INSERT_BOOK_SQL)){
            ps.setString(1, item.getName());

            ps.setBoolean(2, item.getStatus());
            ps.setInt(3, item.getCategory_id());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
    }

    @Override
    public void update(Book item) {
        try(Connection conn= DBConnectionPool.getConnection();PreparedStatement ps = conn.prepareStatement(UPDATE_BOOKS_SQL)){
            ps.setString(1, item.getName());

            ps.setBoolean(2, item.getStatus());
            ps.setInt(3, item.getCategory_id());
            ps.setInt(4, item.getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
    }

    @Override
    public void delete(Book item) {
        try(Connection conn= DBConnectionPool.getConnection();PreparedStatement ps = conn.prepareStatement(DELETE_BOOKS_SQL)){
            ps.setString(1, item.getName());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
    }

    @Override
    public Book getById(int id) {

        Book book = null;
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnectionPool.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int book_id = rs.getInt("id");
                String name = rs.getString("name");
                Boolean status = rs.getBoolean("status");
                int category_id = rs.getInt("category_id");
                book = new Book(book_id, name, status, category_id);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            DBConnectionPool.closeConnection(conn);
        }
        return book;
    }

    @Override
    public List<Book> getAll() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Book > books = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnectionPool.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int book_id = rs.getInt("id");
                String name = rs.getString("name");
                Boolean status = rs.getBoolean("status");
                int category_id = rs.getInt("category_id");
                books.add( new Book(book_id, name, status, category_id));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return books;
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
    }
}
