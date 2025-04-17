package repositoriesImpl;

import models.Department;
import models.Role;
import models.User;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserRepositoryImpl extends BaseRepositoryImpl<User> {

    @Override
    protected String getInsertQuery() {
        return "INSERT INTO users (email,password,name,type) values (?,?,?,?)";
    }

    protected String getUpdateQueryWithoutPassword() {
        return "UPDATE users SET email = ?, name = ?, type = ? WHERE id = ?";
    }

    public void updateUserWithoutPassword(Connection conn, User user) throws SQLException {


        try (PreparedStatement stmt = conn.prepareStatement(getUpdateQueryWithoutPassword())) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getName());
            stmt.setInt(3, user.getType());
            stmt.setInt(4, user.getId());

            System.out.println("Query: " + stmt);

            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    protected String getUpdateQueryHavePassword() {
        return "UPDATE users SET email = ?, name = ?, type = ?, password = ? WHERE id = ?";
    }

    public void updateUserHavePassword(Connection conn, User user) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(getUpdateQueryHavePassword())) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getName());
            stmt.setInt(3, user.getType());
            stmt.setString(4, user.getPassword());
            stmt.setInt(5, user.getId());

            System.out.println("Query: " + stmt);

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
        return "DELETE FROM users WHERE id = ?";
    }

    @Override
    protected String getSelectByIdQuery() {
        return "SELECT u.id AS user_id, u.email, u.password, u.name, u.google_id, u.created_at, " +
                "u.updated_at, u.avatar, u.deleted_at, u.type, " +
                "r.id AS role_id, r.name AS role_name, " +
                "d.id AS dept_id, d.name AS dept_name " +
                "FROM users u " +
                "LEFT JOIN user_role ur ON u.id = ur.user_id " +
                "LEFT JOIN roles r ON ur.role_id = r.id " +
                "LEFT JOIN user_department ud ON u.id = ud.user_id " +
                "LEFT JOIN departments d ON ud.department_id = d.id " +
                "WHERE u.id = ?";
    }

    public User getUserById(int id) throws SQLException {
        User user = null;
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getSelectByIdQuery())
        ) {

            System.out.println(stmt);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                if (user == null) {
                    user = new User();
                    user.setId(rs.getInt("user_id"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setName(rs.getString("name"));
                    user.setGoogle_id(rs.getString("google_id"));
                    user.setCreated_at(rs.getString("created_at"));
                    user.setUpdated_at(rs.getString("updated_at"));
                    user.setAvatar(rs.getString("avatar"));
                    user.setDeleted_at(rs.getString("deleted_at"));
                    user.setType(rs.getInt("type"));
                    user.setRoles(new ArrayList<>());
                    user.setDepartments(new ArrayList<>());
                }

                // Thêm role vào user nếu có
                int roleId = rs.getInt("role_id");
                String roleName = rs.getString("role_name");
                if (roleName != null) {
                    Role role = new Role();
                    role.setId(roleId);
                    role.setName(roleName);
                    if (user.getRoles().stream().noneMatch(r -> r.getId() == roleId)) {
                        user.getRoles().add(role);
                    }
                }

                // Thêm department vào user nếu có
                int deptId = rs.getInt("dept_id");
                String deptName = rs.getString("dept_name");
                if (deptName != null) {
                    Department dept = new Department();
                    dept.setId(deptId);
                    dept.setName(deptName);
                    if (user.getDepartments().stream().noneMatch(d -> d.getId() == (deptId))) {
                        user.getDepartments().add(dept);
                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
        return user;
    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT u.id AS user_id, u.email, u.password, u.name, u.google_id, u.created_at, " +
                "u.updated_at, u.avatar, u.deleted_at, u.type, " +
                "r.id AS role_id, r.name AS role_name, " +
                "d.id AS dept_id, d.name AS dept_name " +
                "FROM users u " +
                "LEFT JOIN user_role ur ON u.id = ur.user_id " +
                "LEFT JOIN roles r ON ur.role_id = r.id " +
                "LEFT JOIN user_department ud ON u.id = ud.user_id " +
                "LEFT JOIN departments d ON ud.department_id = d.id";
    }

    public List<User> getAllWithRelations() throws SQLException {
        Map<String, User> userMap = new HashMap<>();

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getSelectAllQuery());
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int userId = rs.getInt("user_id");

                // Lấy hoặc tạo mới đối tượng User
                User user = userMap.get(String.valueOf(userId));
                if (user == null) {
                    user = new User();
                    user.setId(userId);
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setName(rs.getString("name"));
                    user.setGoogle_id(rs.getString("google_id"));
                    user.setCreated_at(rs.getString("created_at"));
                    user.setUpdated_at(rs.getString("updated_at"));
                    user.setAvatar(rs.getString("avatar"));
                    user.setDeleted_at(rs.getString("deleted_at"));
                    user.setType(rs.getInt("type"));
                    user.setRoles(new ArrayList<>());
                    user.setDepartments(new ArrayList<>());
                    userMap.put(String.valueOf(userId), user);
                }

                // Thêm role vào user nếu có
                int roleId = rs.getInt("role_id");
                String roleName = rs.getString("role_name");
                if (roleName != null) {
                    Role role = new Role();
                    role.setId(roleId);
                    role.setName(roleName);
                    if (user.getRoles().stream().noneMatch(r -> r.getId() == roleId)) {
                        user.getRoles().add(role);
                    }
                }

                // Thêm department vào user nếu có
                int deptId = rs.getInt("dept_id");
                String deptName = rs.getString("dept_name");
                if (deptName != null) {
                    Department dept = new Department();
                    dept.setId(deptId);
                    dept.setName(deptName);
                    if (user.getDepartments().stream().noneMatch(d -> d.getId() == deptId)) {
                        user.getDepartments().add(dept);
                    }
                }
            }
        }
        return new ArrayList<>(userMap.values());
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, User item) throws SQLException {
        stmt.setString(1, item.getEmail());
        stmt.setString(2, item.getPassword());
        stmt.setString(3, item.getName());
        stmt.setInt(4, item.getType());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, User item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, User item) throws SQLException {
        stmt.setInt(1, item.getId());
    }

    @Override
    protected User mapResultSetToEntity(ResultSet rs) throws SQLException {
        return null;
    }


}
