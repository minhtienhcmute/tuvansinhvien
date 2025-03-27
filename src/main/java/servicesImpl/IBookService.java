package servicesImpl;

import models.Book;

import java.util.List;

public interface IBookService
{
    void add(Book book);
    void update(Book book);
    void delete(Book book);
    List<Book> getByCategory(int category);
    Book getById(int id);
    List<Book> getAll();
}
