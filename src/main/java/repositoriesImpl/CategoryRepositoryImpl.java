package repositoriesImpl;

import models.Category;
import repositories.ICategoryRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CategoryRepositoryImpl extends BaseRepositoryImpl<Category> implements ICategoryRepository {

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
        return "SELECT * FROM categories";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Category item) throws SQLException {

    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Category item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Category item) throws SQLException {

    }

    @Override
    protected Category mapResultSetToEntity(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));
        category.setDescription(rs.getString("created_at"));
        category.setCreated_at(rs.getTimestamp("updated_at"));
        return category;
    }

    @Override
    public int add(Category item) throws SQLException {
        return 0;
    }

    @Override
    public int addWithConnection(Connection conn, Category item) throws SQLException {
        return 0;
    }

    @Override
    public void update(Category item) throws SQLException {

    }

    @Override
    public void delete(Category item) throws SQLException {

    }

    @Override
    public Category getById(int id) throws SQLException {
        return null;
    }


    @Override
    public void insertBatchWithConnection(Connection conn, List<Category> items) throws SQLException {

    }
}
