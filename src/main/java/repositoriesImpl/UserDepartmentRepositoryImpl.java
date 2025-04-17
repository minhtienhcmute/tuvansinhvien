package repositoriesImpl;

import models.UserDepartment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDepartmentRepositoryImpl extends BaseRepositoryImpl<UserDepartment> {
    private static final String INSERT_ROLE_SQL = "INSERT INTO roles (name) VALUES (?)";

    @Override
    protected String getInsertQuery() {
        return "INSERT INTO user_department (user_id, department_id) VALUES (?, ?)";
    }

    public void deleteUserDepartmentByUserId(Connection conn, UserDepartment user) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(getDeleteQuery())) {
            setDeleteParameters(stmt, user);
            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    @Override
    protected String getUpdateQuery() {
        return "";
    }

    @Override
    protected String getDeleteQuery() {
        return "DELETE FROM user_department WHERE user_id = ?";
    }

    @Override
    protected String getSelectByIdQuery() {
        return "";
    }

    @Override
    protected String getSelectAllQuery() {
        return "";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, UserDepartment item) throws SQLException {
        stmt.setInt(1, item.getUserId());
        stmt.setInt(2, item.getDepartmentId());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, UserDepartment item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, UserDepartment item) throws SQLException {
        stmt.setInt(1, item.getUserId());
    }

    @Override
    protected UserDepartment mapResultSetToEntity(ResultSet rs) throws SQLException {
        return null;
    }
}
