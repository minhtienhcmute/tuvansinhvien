package servicesImpl;

import models.Book;
import repositories.IBookRepository;
import services.IBookService;

import java.sql.SQLException;
import java.util.List;

public class BookServiceImpl implements IBookService {

    private final IBookRepository bookRepository;

    public BookServiceImpl(IBookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
    public List<Book> getByCategory(int categoryId) {
        return this.bookRepository.getByCategory(categoryId);
    }

    @Override
    public void add(Book book) throws SQLException {
        this.bookRepository.add(book);
    }

    @Override
    public void update(Book book) throws SQLException {
        this.bookRepository.update(book);
    }

    @Override
    public void delete(Book book) throws SQLException {
        this.bookRepository.delete(book);
    }

    @Override
    public Book getById(int id) throws SQLException {
        return this.bookRepository.getById(id);
    }

    @Override
    public List<Book> getAll() throws SQLException {
        return this.bookRepository.getAll();
    }
}
