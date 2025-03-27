package services;

import models.Book;
import repositories.IBookRepository;
import servicesImpl.IBookService;

import java.util.List;

public class IBookServiceImpl implements IBookService {

    private final IBookRepository bookRepository ;

    public IBookServiceImpl(IBookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
    public List<Book> getByCategory(int categoryId) {
      return   this.bookRepository.getByCategory(categoryId);
    }

    @Override
    public void add(Book book) {
        this.bookRepository.add(book);
    }

    @Override
    public void update(Book book) {
this.bookRepository.update(book);
    }

    @Override
    public void delete(Book book) {
this.bookRepository.delete(book);
    }

    @Override
    public Book getById(int id) {
       return this.bookRepository.getById(id);
    }

    @Override
    public List<Book> getAll() {
        return this.bookRepository.getAll();
    }
}
