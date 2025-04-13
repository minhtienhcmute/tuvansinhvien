package repositoriesImpl;

import models.Permission;
import models.Role;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoleRepositoryImpl extends BaseRepositoryImpl<Role> {
    private static final String INSERT_ROLE_SQL = "INSERT INTO roles (name) VALUES (?)";


    @Override
    public Role getById(int id) {
        String query = getSelectByIdQuery();
        Role role = null;
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                if (role == null) {
                    role = new Role();
                    role.setId(rs.getInt("role_id"));
                    role.setName(rs.getString("role_name"));
                    role.setPermissions(new ArrayList<>());
                }

                int permissionId = rs.getInt("permission_id");
                if (!rs.wasNull()) {
                    Permission permission = new Permission();
                    permission.setId(permissionId);
                    permission.setModule(rs.getString("permission_module"));
                    permission.setCode(rs.getString("permission_code"));
                    permission.setAction(rs.getString("permission_action"));

                    role.getPermissions().add(permission);
                }
            }

        } catch (SQLException e) {
            super.printSQLException(e);
        }

        return role;
    }

    @Override
    public List<Role> getAll() {
        String query = getSelectAllQuery();
        System.out.println(query);
        Map<Integer, Role> roleMap = new HashMap<>();

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int roleId = rs.getInt("role_id");

                // Nếu role chưa tồn tại thì tạo mới
                Role role = roleMap.get(roleId);

                if (role == null) {
                    role = new Role();
                    role.setId(roleId);
                    role.setName(rs.getString("role_name"));
                    role.setPermissions(new ArrayList<>());
                    roleMap.put(roleId, role);
                }

                // Nếu permission có tồn tại thì thêm vào danh sách
                int permissionId = rs.getInt("permission_id");
                if (!rs.wasNull()) {
                    Permission permission = new Permission();
                    permission.setId(permissionId);
                    permission.setModule(rs.getString("permission_module"));
                    permission.setCode(rs.getString("permission_code"));
                    permission.setAction(rs.getString("permission_action"));

                    role.getPermissions().add(permission);
                }
            }
        } catch (SQLException e) {
            super.printSQLException(e);
        }

        return new ArrayList<>(roleMap.values());
    }

    @Override
    protected String getInsertQuery() {
        return INSERT_ROLE_SQL;
    }

    @Override
    protected String getUpdateQuery() {
        return "UPDATE roles SET name = ? WHERE id = ?";
    }

    @Override
    protected String getDeleteQuery() {
        return "DELETE FROM roles WHERE id = ?";
    }

    @Override
    protected String getSelectByIdQuery() {
        return "SELECT r.id AS role_id, r.name AS role_name, " +
                "p.id AS permission_id, p.module AS permission_module, " +
                "p.code AS permission_code, p.action AS permission_action " +
                "FROM roles r " +
                "LEFT JOIN role_permission rp ON r.id = rp.role_id " +
                "LEFT JOIN permissions p ON rp.permission_id = p.id " +
                "WHERE r.id = (?)";

    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT r.id AS role_id, r.name AS role_name, " +
                "p.id AS permission_id, p.module AS permission_module, " +
                "p.code AS permission_code, p.action AS permission_action " +
                "FROM roles r " +
                "LEFT JOIN role_permission rp ON r.id = rp.role_id " +
                "LEFT JOIN permissions p ON rp.permission_id = p.id";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Role item) throws SQLException {
        stmt.setString(1, item.getName());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Role item) throws SQLException {
        stmt.setString(1, item.getName());
        stmt.setInt(2, item.getId());
    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Role item) throws SQLException {
        stmt.setInt(1, item.getId());
    }

    @Override
    protected Role mapResultSetToEntity(ResultSet rs) throws SQLException {
        return null;
    }
}
