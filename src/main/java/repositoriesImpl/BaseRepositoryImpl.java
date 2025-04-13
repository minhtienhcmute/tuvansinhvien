package repositoriesImpl;

import repositories.IRepository;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseRepositoryImpl<T> implements IRepository<T> {
    protected abstract String getInsertQuery();

    protected abstract String getUpdateQuery();

    protected abstract String getDeleteQuery();

    protected abstract String getSelectByIdQuery();

    protected abstract String getSelectAllQuery();

    protected abstract void setInsertParameters(PreparedStatement stmt, T item) throws SQLException;

    protected abstract void setUpdateParameters(PreparedStatement stmt, T item) throws SQLException;

    protected abstract void setDeleteParameters(PreparedStatement stmt, T item) throws SQLException;

    protected abstract T mapResultSetToEntity(ResultSet rs) throws SQLException;

    public void insertBatch(List<T> items) throws SQLException {
        if (items == null || items.isEmpty()) return;

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getInsertQuery())) {

            for (T item : items) {
                setInsertParameters(stmt, item);
                stmt.addBatch();
            }
            stmt.executeBatch();

        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    @Override
    public int add(T item) throws SQLException {
//        try (Connection conn = DBConnectionPool.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(getInsertQuery())) {
//            setInsertParameters(stmt, item);
//            stmt.executeUpdate();
//        } catch (SQLException e) {
//            this.printSQLException(e);
//
//        }
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getInsertQuery(), PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Thiết lập các tham số cho câu lệnh INSERT
            setInsertParameters(stmt, item);
            System.out.println("Query: " + getInsertQuery());
            System.out.println("Item: " + item); // hoặc log chi tiết các trường nếu cần
            // Thực thi câu lệnh INSERT
            int affectedRows = stmt.executeUpdate();

            // Kiểm tra nếu có bản ghi được thêm vào
            if (affectedRows > 0) {
                // Lấy các khóa đã được tạo (ID của bản ghi mới)
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        // Lấy ID vừa được tạo (thường là trường auto-increment)
                        int generatedId = generatedKeys.getInt(1);  // Lấy ID (có thể là trường "id" trong cơ sở dữ liệu)


                        return generatedId;  // Trả về đối tượng với ID đã được cập nhật
                    }
                }
            }
        } catch (SQLException e) {
            this.printSQLException(e);

            throw e;

        }
        return -99;
        // Trả về null nếu không thành công
    }

    @Override
    public void update(T item) throws SQLException {
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getUpdateQuery())) {
            setUpdateParameters(stmt, item);
            System.out.println("Query: " + stmt);
            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    public void delete(T item) throws SQLException {
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getDeleteQuery())) {
            setDeleteParameters(stmt, item);
            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    @Override
    public T getById(int id) throws SQLException {
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getSelectByIdQuery())) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToEntity(rs);
            }
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }

        return null;
    }

    @Override
    public List<T> getAll() {
        List<T> list = new ArrayList<>();
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getSelectAllQuery());
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSetToEntity(rs));
            }
        } catch (SQLException e) {
            this.printSQLException(e);

        }
        return list;
    }

    public void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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
