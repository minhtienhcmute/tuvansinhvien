package servicesImpl;

import models.Comment;
import models.Question;
import repositoriesImpl.CommentRepositoryImpl;
import repositoriesImpl.QuestionRepositoryImpl;
import services.IQuestionService;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class QuestionServiceImpl implements IQuestionService {

    private final QuestionRepositoryImpl questionRepository;
    private final CommentRepositoryImpl commentRepository;

    public QuestionServiceImpl(QuestionRepositoryImpl questionRepository) {
        this.commentRepository = new CommentRepositoryImpl();
        this.questionRepository = questionRepository;
    }

    public void handleAnswerQuestion(int questionId, Comment comment) throws SQLException {
        Connection conn = null;

        try {
            conn = DBConnectionPool.getConnection();
            conn.setAutoCommit(false);

            int idInserted = commentRepository.addWithConnection(conn, comment);
            if (idInserted != 99) {
                Question question = new Question();
                question.setId(questionId);
                question.setStatus(1);
                questionRepository.updateStatusQuestion(conn, question);
            }

            conn.commit();
        } catch (SQLException e) {
            if (conn != null) try {
                conn.rollback();
            } catch (SQLException ex) {
            }
            e.printStackTrace();
            throw e;
        } finally {
            if (conn != null) try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();

            }
        }
    }

    public Question findById(int id) throws SQLException {
        return questionRepository.getById(id);
    }

    public List<Question> getQuestionsFilteredForAdmin(String status, int categoryId, int departmentId, List<Integer> departmentIds) throws SQLException {
        return questionRepository.getQuestionsForAdmin(status, categoryId, departmentId, departmentIds);
    }

    public List<Question> getQuestionsFiltered(int categoryId, int departmentId, String tab, String keyword, int limit, int offset) throws SQLException {

        return questionRepository.getQuestionsFiltered(categoryId, departmentId, tab, keyword, limit, offset);
    }

    public int countQuestionsFiltered(int categoryId, int departmentId, String keyword) throws SQLException {
        return questionRepository.countQuestionsFiltered(categoryId, departmentId, keyword);
    }

    public void insertQuestion(Question item) throws SQLException {
        questionRepository.add(item);
    }

    public void updateQuestion(Question item) throws SQLException {
    }
}
