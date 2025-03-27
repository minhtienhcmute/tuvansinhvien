package repositories;

import java.util.List;

public interface IRepository<T> {
    void add(T item);
    void update(T item);
    void delete(T item);
T getById(int id);
List<T> getAll();
}
