package repositoriesImpl;

import models.Comment;
import models.User;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentRepositoryImpl extends BaseRepositoryImpl<Comment> {
    public CommentRepositoryImpl() {
    }

    public List<Comment> getCommentsByQuestionId(int questionId) throws SQLException {
        List<Comment> list = new ArrayList<>();

        try (Connection connection = DBConnectionPool.getConnection();
             PreparedStatement stmt = connection.prepareStatement(getCommentByQuestionIdQuery())
        ) {
            stmt.setInt(1, questionId);
            System.out.println(stmt);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToEntity(rs));
            }
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;
        }
        return list;

    }

    public String getCommentByQuestionIdQuery() {
        return "Select comments.*, users.name as user_name, users.email as user_email, users.avatar as user_avatar from comments JOIN users ON " +
                "users.id = comments.user_id " +
                "where comments.question_id = ? ORDER BY created_at DESC";
    }

    @Override
    protected String getInsertQuery() {
        return "INSERT INTO comments (user_id, question_id, content) VALUES (?, ?, ?)";
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
        return "";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Comment item) throws SQLException {
        stmt.setInt(1, item.getUser_id());
        stmt.setInt(2, item.getQuestion_id());
        stmt.setString(3, item.getContent());
    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Comment item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Comment item) throws SQLException {

    }

    @Override
    protected Comment mapResultSetToEntity(ResultSet rs) throws SQLException {
        Comment comment = new Comment();
        comment.setId(rs.getInt("id"));
        comment.setUser_id(rs.getInt("user_id"));
        comment.setQuestion_id(rs.getInt("question_id"));
        comment.setContent(rs.getString("content"));
        comment.setCreated_at(rs.getTimestamp("created_at"));
        comment.setUpdated_at(rs.getTimestamp("updated_at"));

        User user = new User();
        user.setId(rs.getInt("user_id"));
        user.setName(rs.getString("user_name"));
        user.setEmail(rs.getString("user_email"));
        user.setAvatar(rs.getString("user_avatar"));
        comment.setUser(user);
        return comment;
    }
}
