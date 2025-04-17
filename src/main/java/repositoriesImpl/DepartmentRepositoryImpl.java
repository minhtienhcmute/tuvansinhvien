package repositoriesImpl;

import models.Department;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DepartmentRepositoryImpl extends BaseRepositoryImpl<Department> {
    private static final String INSERT_ROLE_SQL = "INSERT INTO roles (name) VALUES (?)";

    @Override
    protected String getInsertQuery() {
        return "";
    }

    @Override
    protected String getUpdateQuery() {
        return "";
    }

    @Override
    protected String getDeleteQuery() {
        return "";
    }

    @Override
    protected String getSelectByIdQuery() {
        return "";
    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT * FROM departments";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Department item) throws SQLException {

    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Department item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Department item) throws SQLException {

    }

    @Override
    protected Department mapResultSetToEntity(ResultSet rs) throws SQLException {
        Department department = new Department();
        department.setId(rs.getInt("id"));
        department.setName(rs.getString("name"));
        department.setDescription(rs.getString("description"));
        department.setCreated_at(rs.getTimestamp("created_at"));
        return department;
    }
}
