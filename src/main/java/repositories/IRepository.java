package repositories;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface IRepository<T> {
    //    void add(T item);
    int add(T item) throws SQLException;

    int addWithConnection(Connection conn, T item) throws SQLException;

    void update(T item) throws SQLException;

    void delete(T item) throws SQLException;

    T getById(int id) throws SQLException;

    List<T> getAll() throws SQLException;

    void insertBatchWithConnection(Connection conn, List<T> items) throws SQLException;
}
