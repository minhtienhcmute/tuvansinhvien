package servicesImpl;

import models.Book;

import java.sql.SQLException;
import java.util.List;

public interface IBookService {
    void add(Book book) throws SQLException;

    void update(Book book) throws SQLException;

    void delete(Book book) throws SQLException;

    List<Book> getByCategory(int category);

    Book getById(int id) throws SQLException;

    List<Book> getAll() throws SQLException;
}
