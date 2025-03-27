package services;

import models.Category;
import repositories.ICategoryRepository;
import servicesImpl.ICategoryService;

import java.util.List;

public class ICategoryServiceImpl implements ICategoryService {

    private final ICategoryRepository categoryRepository ;

    public ICategoryServiceImpl(ICategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override

    public void add(Category category) {
        this.categoryRepository.add(category);
    }

    @Override
    public void update(Category category) {
this.categoryRepository.update(category);
    }

    @Override
    public void delete(Category category) {
this.categoryRepository.delete(category);
    }

    @Override
    public Category getById(int id) {
     return   this.categoryRepository.getById(id);
    }

    @Override
    public List<Category> getAll() {
        return this.categoryRepository.getAll();
    }
}
