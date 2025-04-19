package repositoriesImpl;

import models.Category;
import models.Department;
import models.Question;
import models.User;
import utils.DBConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class QuestionRepositoryImpl extends BaseRepositoryImpl<Question> {


    public void increaseViewCount(int questionId) throws SQLException {
        String sql = "{CALL increase_question_views(?)}";

        try (Connection conn = DBConnectionPool.getConnection();
             CallableStatement stmt = conn.prepareCall(sql)) {

            stmt.setInt(1, questionId);
            stmt.execute();

        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;
        }
    }

    public void rejectQuestion(int questionId, String reason) throws SQLException {
        String sql = "UPDATE questions SET status = 2, reason = ? WHERE id = ?";

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, reason);
            stmt.setInt(2, questionId);
            System.out.println("Query: " + stmt);

            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    public void updateStatusQuestion(Connection conn, Question question) throws SQLException {


        try (PreparedStatement stmt = conn.prepareStatement(getQueryUpdateStatusQuestion())) {
            stmt.setInt(1, question.getStatus());
            stmt.setInt(2, question.getId());
            System.out.println("Query: " + stmt);

            stmt.executeUpdate();
        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }
    }

    public String getQueryUpdateStatusQuestion() {
        return "UPDATE questions SET status = ? WHERE id = ?";
    }

    public List<Question> getQuestionsForAdmin(String status, int categoryId, int departmentId, List<Integer> userDepartmentIds) throws SQLException {
        StringBuilder sql = new StringBuilder(
                "SELECT q.*, " +
                        "u.id AS user_id, u.name AS user_name, u.email as user_email, u.avatar as user_avatar, " +
                        "d.id AS dept_id, d.name AS dept_name, " +
                        "c.id AS cat_id, c.name AS cat_name " +
                        "FROM questions q " +
                        "JOIN users u ON q.user_id = u.id " +
                        "JOIN departments d ON q.department_id = d.id " +
                        "JOIN categories c ON q.category_id = c.id " +
                        "WHERE 1=1"
        );

        if (status != null && !status.isEmpty()) {
            sql.append(" AND q.status = ?");
        }

        if (categoryId != -1) {
            sql.append(" AND q.category_id = ?");
        }
        List<Integer> departmentFilterIds = new ArrayList<>();

        if (departmentId == -1) {
            // departmentId là "All" hoặc "-1" → lấy danh sách phòng ban của user
            if (userDepartmentIds != null && !userDepartmentIds.isEmpty()) {
                departmentFilterIds.addAll(userDepartmentIds);
            }
        } else {
            // departmentId cụ thể được gửi lên
            departmentFilterIds.add(departmentId);
        }
        if (!departmentFilterIds.isEmpty()) {
            String inClause = departmentFilterIds.stream()
                    .map(id -> "?")
                    .collect(Collectors.joining(", "));
            sql.append(" AND q.department_id IN (").append(inClause).append(")");
        }
        sql.append(" ORDER BY q.created_at DESC");

        List<Question> questions = new ArrayList<>();

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())
        ) {
            int index = 1;

            if (status != null && !status.isEmpty()) {
                ps.setString(index++, status);
            }

            if (categoryId != -1) {
                ps.setInt(index++, categoryId);
            }

            for (Integer depId : departmentFilterIds) {
                ps.setInt(index++, depId);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = mapResultSetToQuestion(rs);
                questions.add(q);
            }

        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;
        }

        return questions;
    }

    public int countQuestionsFiltered(int categoryId, int departmentId, String keyword) throws SQLException {
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(*) AS total " +
                        "FROM questions q " +
                        "JOIN users u ON q.user_id = u.id " +
                        "JOIN departments d ON q.department_id = d.id " +
                        "JOIN categories c ON q.category_id = c.id " +
                        "WHERE 1=1"
        );
        sql.append(" AND q.status = 1");

        if (categoryId != -1) {
            sql.append(" AND q.category_id = ?");
        }
        if (departmentId != -1) {
            sql.append(" AND q.department_id = ?");
        }
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND q.title LIKE ?");
        }

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())
        ) {
            int index = 1;
            if (categoryId != -1) ps.setInt(index++, categoryId);
            if (departmentId != -1) ps.setInt(index++, departmentId);
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(index++, "%" + keyword.trim() + "%");
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;
        }

        return 0;
    }

    public List<Question> getQuestionsFiltered(int categoryId, int departmentId, String tab, String keyword, int limit, int offset) throws SQLException {
        StringBuilder sql = new StringBuilder(
                "SELECT q.*, " +
                        "u.id AS user_id, u.name AS user_name, u.email as user_email, u.avatar as user_avatar, " +
                        "d.id AS dept_id, d.name AS dept_name, " +
                        "c.id AS cat_id, c.name AS cat_name " +
                        "FROM questions q " +
                        "JOIN users u ON q.user_id = u.id " +
                        "JOIN departments d ON q.department_id = d.id " +
                        "JOIN categories c ON q.category_id = c.id " +
                        "WHERE 1=1"
        );
        sql.append(" AND q.status = 1");

        if (categoryId != -1) {
            sql.append(" AND q.category_id = ?");
        }
        if (departmentId != -1) {
            sql.append(" AND q.department_id = ?");
        }
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND q.title LIKE ?");
        }

        if ("most_view".equals(tab)) {
            sql.append(" ORDER BY q.views DESC");
        } else if ("highest_vote".equals(tab)) {
            sql.append(" ORDER BY q.vote_cnt DESC");
        } else {
            sql.append(" ORDER BY q.created_at DESC");
        }

        sql.append(" LIMIT ? OFFSET ?");
        List<Question> questions = new ArrayList<>();

        try (Connection conn = DBConnectionPool.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())
        ) {
            int index = 1;
            if (categoryId != -1) ps.setInt(index++, categoryId);
            if (departmentId != -1) ps.setInt(index++, departmentId);
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(index++, "%" + keyword.trim() + "%");
            }

            ps.setInt(index++, limit);
            ps.setInt(index, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = mapResultSetToQuestion(rs);
                // Bổ sung thêm nếu cần gán user info vào question
//                User u = new User();
//                u.setId(rs.getInt("user_id"));
//                u.setName(rs.getString("user_name"));
//                q.setUser(u);
                questions.add(q);
            }

        } catch (SQLException e) {
            this.printSQLException(e);
            throw e;

        }

        return questions;

    }

    private Question mapResultSetToQuestion(ResultSet rs) throws SQLException {
        Question q = new Question();

        // Cột cơ bản
        q.setId(rs.getInt("id"));
        q.setTitle(rs.getString("title"));
        q.setContent(rs.getString("content"));
        q.setCategory_id(rs.getInt("category_id"));
        q.setDepartment_id(rs.getInt("department_id"));
        q.setUser_id(rs.getInt("user_id"));
        q.setCreated_at(rs.getTimestamp("created_at"));
        q.setUpdated_at(rs.getTimestamp("updated_at"));
        q.setVote_cnt(rs.getInt("vote_cnt"));
        q.setViews(rs.getInt("views"));
        q.setStatus(rs.getInt("status"));
        q.setReason(rs.getString("reason"));

        // Gán User
        User u = new User();
        u.setId(rs.getInt("user_id"));
        u.setName(rs.getString("user_name"));
        u.setEmail(rs.getString("user_email"));
        u.setAvatar(rs.getString("user_avatar"));
        q.setUser(u);

        // Gán Department
        Department d = new Department();
        d.setId(rs.getInt("dept_id"));
        d.setName(rs.getString("dept_name"));
        q.setDepartment(d);

        // Gán Category
        Category c = new Category();
        c.setId(rs.getInt("cat_id"));
        c.setName(rs.getString("cat_name"));
        q.setCategory(c);

        return q;
    }

    @Override
    protected String getInsertQuery() {
        return "INSERT INTO questions (user_id,category_id,department_id,title,content) VALUES (?,?,?,?,?)";
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
        return "SELECT q.*, " +
                "u.id AS user_id, u.name AS user_name, u.email as user_email, u.avatar as user_avatar, " +
                "d.id AS dept_id, d.name AS dept_name, " +
                "c.id AS cat_id, c.name AS cat_name " +
                "FROM questions q " +
                "JOIN users u ON q.user_id = u.id " +
                "JOIN departments d ON q.department_id = d.id " +
                "JOIN categories c ON q.category_id = c.id " +
                "WHERE q.id = ?";
    }

    @Override
    protected String getSelectAllQuery() {
        return "SELECT * FROM departments";
    }

    @Override
    protected void setInsertParameters(PreparedStatement stmt, Question item) throws SQLException {
        stmt.setInt(1, item.getUser_id());
        stmt.setInt(2, item.getCategory_id());
        stmt.setInt(3, item.getDepartment_id());
        stmt.setString(4, item.getTitle());
        stmt.setString(5, item.getContent());

    }

    @Override
    protected void setUpdateParameters(PreparedStatement stmt, Question item) throws SQLException {

    }

    @Override
    protected void setDeleteParameters(PreparedStatement stmt, Question item) throws SQLException {

    }

    @Override
    protected Question mapResultSetToEntity(ResultSet rs) throws SQLException {
//        Question question = new Question();
//        question.setUser_id(rs.getInt("user_i"));
//        question.setName(rs.getString("name"));
//        question.setDescription(rs.getString("description"));
//        question.setCreated_at(rs.getTimestamp("created_at"));
        return mapResultSetToQuestion(rs);
    }
}
