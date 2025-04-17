package servicesImpl;

import models.Comment;
import repositoriesImpl.CommentRepositoryImpl;
import services.ICommentService;

import java.sql.SQLException;
import java.util.List;

public class CommentServiceImpl implements ICommentService {

    private final CommentRepositoryImpl commentRepository;

    public CommentServiceImpl(CommentRepositoryImpl commentRepository) {
        this.commentRepository = commentRepository;
    }

    public List<Comment> getCommentByQuestionId(int id) throws SQLException {
        return commentRepository.getCommentsByQuestionId(id);
    }
}
