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
        return "INSERT INTO `categories` (`name`,`description`) VALUES (?, ?)";
    }

    @Override
    protected String getUpdateQuery() {
        return "UPDATE categories SET `name` = ?, `description` = ? WHERE `id` = ?";
    }

    @Override
    protected String getDeleteQuery() {
        return "DELETE FROM categories WHERE id = ?";

    }

    @Override
    protected String getSelectByIdQuery() {
        return "SELECT * FROM categories where id = ?";
    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT * FROM categories";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Category item) throws SQLException {
        stmt.setString(1, item.getName());
        stmt.setString(2, item.getDescription());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Category item) throws SQLException {
        stmt.setString(1, item.getName());
        stmt.setString(2, item.getDescription());
        stmt.setInt(3, item.getId());
    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Category item) throws SQLException {
        stmt.setInt(1, item.getId());
    }

    @Override
    protected Category mapResultSetToEntity(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));
        category.setCreated_at(rs.getTimestamp("created_at"));
        category.setUpdated_at(rs.getTimestamp("updated_at"));
        return category;
    }


    @Override
    public int addWithConnection(Connection conn, Category item) throws SQLException {
        return 0;
    }


    @Override
    public void insertBatchWithConnection(Connection conn, List<Category> items) throws SQLException {

    }
}
