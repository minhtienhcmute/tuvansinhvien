package repositoriesImpl;

import models.Department;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartmentRepositoryImpl extends BaseRepositoryImpl<Department> {
    private static final String INSERT_ROLE_SQL = "INSERT INTO roles (name) VALUES (?)";

    public List<Department> getDepartmentsByUserId(int userId) {
        String sql = "SELECT d.* FROM departments d " +
                "JOIN user_department ud ON d.id = ud.department_id " +
                "WHERE ud.user_id = ?";

        List<Department> list = new ArrayList<>();
        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            System.out.println(stmt);

            while (rs.next()) {
                list.add(mapResultSetToEntity(rs));
            }
        } catch (SQLException e) {
            this.printSQLException(e);

        }
        return list;

    }

    @Override
    protected String getInsertQuery() {
        return "INSERT INTO `departments` (`name`,`description`) VALUES (?, ?)";
    }

    @Override
    protected String getUpdateQuery() {
        return "UPDATE departments SET `name` = ?, `description` = ? WHERE `id` = ?";

    }

    @Override
    protected String getDeleteQuery() {
        return "DELETE FROM departments WHERE id = ?";

    }

    @Override
    protected String getSelectByIdQuery() {
        return "SELECT * FROM departments where id = ?";

    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT * FROM departments";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Department item) throws SQLException {
        stmt.setString(1, item.getName());
        stmt.setString(2, item.getDescription());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Department item) throws SQLException {
        stmt.setString(1, item.getName());
        stmt.setString(2, item.getDescription());
        stmt.setInt(3, item.getId());
    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Department item) throws SQLException {
        stmt.setInt(1, item.getId());
    }

    @Override
    protected Department mapResultSetToEntity(ResultSet rs) throws SQLException {
        Department department = new Department();
        department.setId(rs.getInt("id"));
        department.setName(rs.getString("name"));
        department.setDescription(rs.getString("description"));
        department.setCreated_at(rs.getTimestamp("created_at"));
        department.setUpdated_at(rs.getTimestamp("updated_at"));
        return department;
    }
}
