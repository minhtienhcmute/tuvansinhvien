package servicesImpl;

import models.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryService {
    void add(Category category) throws SQLException;

    void update(Category category) throws SQLException;

    void delete(Category category) throws SQLException;

    Category getById(int id) throws SQLException;

    List<Category> getAll() throws SQLException;
}
