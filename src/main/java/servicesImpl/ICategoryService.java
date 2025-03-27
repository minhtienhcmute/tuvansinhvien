package servicesImpl;

import models.Category;

import java.util.List;

public interface ICategoryService
{
    void add(Category category);
    void update(Category category);
    void delete(Category category);
    Category getById(int id);
    List<Category> getAll();
}
