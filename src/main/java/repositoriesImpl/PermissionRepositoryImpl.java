package repositoriesImpl;

import models.Permission;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PermissionRepositoryImpl extends BaseRepositoryImpl<Permission> {

    private static final String SELECT_BOOK_ID = "select id,name,status,category_id from book where id =?";
    private static final String SELECT_BOOKS_NAME = "select id,name,status,category_id from book where name =?";
    private static final String GET_ALL = "select * from permissions";
    private static final String DELETE_BOOKS_SQL = "delete from book where id = ?;";
    private static final String UPDATE_BOOKS_SQL = "update book set name = ?,status= ?, category_id =? where id = ?;";
    private static final String GET_BY_CATEGORY_ID = "select * FROM book where category_id = ?;";
    Connection conn = null;

    @Override
    public int add(Permission item) {
        return 0;
    }

    @Override
    protected String getInsertQuery() {
//        return INSERT_ROLE_SQL;
        return "";
    }

    @Override
    protected String getUpdateQuery() {
        return "";
    }

    @Override
    protected String getDeleteQuery() {
        return "";
    }

    @Override
    protected String getSelectByIdQuery() {
        return "";
    }

    @Override
    protected String getSelectAllQuery() {
        return GET_ALL;
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Permission item) throws SQLException {

    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Permission item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Permission item) throws SQLException {

    }

    @Override
    protected Permission mapResultSetToEntity(ResultSet rs) throws SQLException {
        Permission permission = new Permission();
        permission.setId(rs.getInt("id"));
        permission.setCode(rs.getString("code"));
        permission.setModule(rs.getString("module"));
        permission.setAction(rs.getString("action"));
        return permission;
    }

    @Override
    public void update(Permission item) {

    }

    @Override
    public void delete(Permission item) {

    }

    @Override
    public Permission getById(int id) {
        return null;
    }

}
