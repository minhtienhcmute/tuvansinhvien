package servicesImpl;

import models.Category;
import repositoriesImpl.CategoryRepositoryImpl;
import services.ICategoryService;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImpl implements ICategoryService {

    private final CategoryRepositoryImpl categoryRepository;

    public CategoryServiceImpl(CategoryRepositoryImpl categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override

    public void add(Category category) throws SQLException {
        this.categoryRepository.add(category);
    }

    @Override
    public void update(Category category) throws SQLException {
        this.categoryRepository.update(category);
    }

    @Override
    public void delete(Category category) throws SQLException {
        this.categoryRepository.delete(category);
    }

    @Override
    public Category getById(int id) throws SQLException {
        return this.categoryRepository.getById(id);
    }

    @Override
    public List<Category> getAll() throws SQLException {
        return this.categoryRepository.getAll();
    }
}
