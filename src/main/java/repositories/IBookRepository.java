package repositories;

import models.Book;

import java.util.List;

public interface IBookRepository extends IRepository<Book>{
    List<Book> getByName(String name);

    List<Book> getByCategory(int categoryId);
}
