package repositoriesImpl;

import models.Permission;
import models.RolePermission;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class RolePermissionRepositoryImpl extends BaseRepositoryImpl<RolePermission> {

    private static final String INSERT = "INSERT INTO role_permission (role_id ,permission_id ) VALUES (?,?)";

    public Map<Integer, List<Permission>> getPermissionsByRoleIds(List<Integer> roleIds) throws SQLException {
        Map<Integer, List<Permission>> permissionMap = new HashMap<>();

        if (roleIds == null || roleIds.isEmpty()) return permissionMap;

        String placeholders = String.join(",", Collections.nCopies(roleIds.size(), "?"));
        String query = "SELECT rp.role_id, p.id AS permission_id, p.code AS permission_code " +
                "FROM role_permission rp " +
                "JOIN permissions p ON rp.permission_id = p.id " +
                "WHERE rp.role_id IN (" + placeholders + ")";

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            for (int i = 0; i < roleIds.size(); i++) {
                stmt.setInt(i + 1, roleIds.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int roleId = rs.getInt("role_id");
                Permission permission = new Permission();
                permission.setId(rs.getInt("permission_id"));
                permission.setCode(rs.getString("permission_code"));

                permissionMap.computeIfAbsent(roleId, k -> new ArrayList<>()).add(permission);
            }
        }

        return permissionMap;
    }


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
