package repositoriesImpl;

import models.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRoleRepositoryImpl extends BaseRepositoryImpl<UserRole> {

    @Override
    protected String getInsertQuery() {
        return "INSERT INTO user_role (user_id, role_id) VALUES (?, ?) ";
    }

    public void deleteUserRoleUserId(Connection conn, UserRole user) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(getDeleteQuery())) {
            setDeleteParameters(stmt, user);
            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    @Override
    protected String getDeleteQuery() {
        return "DELETE FROM user_role WHERE user_id = ?";
    }

    @Override
    protected String getUpdateQuery() {
        return "";
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
    protected void setInsertParameters(PreparedStatement stmt, UserRole item) throws SQLException {
        stmt.setInt(1, item.getUserId());
        stmt.setInt(2, item.getRoleId());
        System.out.println(stmt);
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, UserRole item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, UserRole item) throws SQLException {
        stmt.setInt(1, item.getUserId());
    }

    @Override
    protected UserRole mapResultSetToEntity(ResultSet rs) throws SQLException {
        return null;
    }
}
