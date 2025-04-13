package repositoriesImpl;

import models.RolePermission;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class RolePermissionRepositoryImpl extends BaseRepositoryImpl<RolePermission> {

    private static final String INSERT = "INSERT INTO role_permission (role_id ,permission_id ) VALUES (?,?)";
    private static final String SELECT_BOOK_ID = "select id,name,status,category_id from book where id =?";
    private static final String SELECT_BOOKS_NAME = "select id,name,status,category_id from book where name =?";
    private static final String GET_ALL = "select * from permissions";
    private static final String DELETE_BOOKS_SQL = "delete from book where id = ?;";
    private static final String UPDATE_BOOKS_SQL = "update book set name = ?,status= ?, category_id =? where id = ?;";
    private static final String GET_BY_CATEGORY_ID = "select * FROM book where category_id = ?;";
    Connection conn = null;

    @Override
    protected String getInsertQuery() {
        return INSERT;
    }

    @Override
    protected String getUpdateQuery() {
        return "";
    }

    @Override
    protected String getDeleteQuery() {
        return "DELETE FROM role_permission WHERE role_id = ? ";
    }

    @Override
    protected String getSelectByIdQuery() {
        return "";
    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT rp.role_id, rp.permission_id, p.module, FROM role_permission rp " +
                "JOIN permission p ON rp.permission_id = p.id";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, RolePermission item) throws SQLException {
        stmt.setInt(1, item.getRoleId());
        stmt.setInt(2, item.getPermissionId());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, RolePermission item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, RolePermission item) throws SQLException {
        stmt.setInt(1, item.getRoleId());
    }

    @Override
    protected RolePermission mapResultSetToEntity(ResultSet rs) throws SQLException {
        return null;
    }

    public void deleteByRoleAndPermissionIds(int roleId, List<String> permissionIds) {
        if (permissionIds == null || permissionIds.isEmpty()) return;

        StringBuilder queryBuilder = new StringBuilder("DELETE FROM role_permission WHERE role_id = ? AND permission_id IN (");

        for (int i = 0; i < permissionIds.size(); i++) {
            queryBuilder.append("?");
            if (i < permissionIds.size() - 1) {
                queryBuilder.append(",");
            }
        }
        queryBuilder.append(")");

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {

            stmt.setInt(1, roleId);
            for (int i = 0; i < permissionIds.size(); i++) {
                stmt.setInt(i + 2, Integer.parseInt(permissionIds.get(i))); // +2 vì index 1 là roleId
            }

            System.out.println(stmt);
            stmt.executeUpdate();

        } catch (SQLException e) {
            super.printSQLException(e);
        }
    }
}
