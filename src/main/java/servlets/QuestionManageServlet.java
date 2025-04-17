package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.*;
import org.mindrot.jbcrypt.BCrypt;
import repositoriesImpl.*;
import servicesImpl.*;
import utils.BreadcrumbUtils;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@WebServlet({"/admin/question"})

public class QuestionManageServlet extends HttpServlet {
    private RoleServiceImpl roleService;
    private DepartmentServiceImpl departmentService;
    private CategoryServiceImpl categoryService;
    private UserServiceImpl userService;
    private QuestionServiceImpl questionService;
    private CommentServiceImpl commentService;
    private final String breadcrumbTitle = "Question management";

    public void init() throws ServletException {
        this.questionService = new QuestionServiceImpl(new QuestionRepositoryImpl());
        this.categoryService = new CategoryServiceImpl(new CategoryRepositoryImpl());
        this.departmentService = new DepartmentServiceImpl(new DepartmentRepositoryImpl());
        this.userService = new UserServiceImpl(new UserRepositoryImpl(), new UserRoleRepositoryImpl(), new UserDepartmentRepositoryImpl());
        this.commentService = new CommentServiceImpl(new CommentRepositoryImpl());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) action = "view";

            switch (action) {
                case "view":
                    // show list
                    String questionId = request.getParameter("id");

                    if (questionId != null) {
                        handleViewDetail(request, response);
                    } else {
                        handleViewPage(request, response); // hiển thị trang JSP
                    }
                    break;
                case "add":
                    handleAdd(request, response);
                    break;
                case "edit":
                    handleEdit(request, response);
                    break;
                default:
                    response.sendError(404);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            switch (action) {
                case "add":
                    doAddPost(req, resp);
                    break;
                case "edit":
                    doPut(req, resp);
                    break;
                case "delete":
                    doDelete(req, resp);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            if (id == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/user?error=" + URLEncoder.encode("ID không hợp lệ", StandardCharsets.UTF_8));
                return;
            }
            userService.deleteUser(id);
            resp.sendRedirect(req.getContextPath() + "/admin/user?success=" + URLEncoder.encode("Xóa người dùng thành công", StandardCharsets.UTF_8));
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/user?error=" + URLEncoder.encode("Đã có lỗi xảy ra", StandardCharsets.UTF_8));
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));

        String[] roleIds = request.getParameterValues("roles[]");
        String[] deptIds = request.getParameterValues("departments[]");

        if (name == null || name.trim().isEmpty()) {
            String errorMessage = "Tên người dùng không thể để trống!";
            String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
            resp.sendRedirect(request.getContextPath() + "/admin/user?action=edit&id=" + userId + "&error=" + encodedErrorMessage);
            return;
        }
        try {
            String hashedPassword = (password != null && !password.isEmpty())
                    ? BCrypt.hashpw(password, BCrypt.gensalt())
                    : null;

            // Tạo User object (bạn có thể cần constructor phù hợp)
            User user = new User();
            user.setId(userId);
            user.setName(name);
            user.setEmail(email);
            user.setType(type);
            user.setPassword(hashedPassword);

            // Gọi service để update
            userService.updateUserWithRelations(user, roleIds, deptIds);

            String msg = "Cập nhật user thành công!";
            String encoded = URLEncoder.encode(msg, StandardCharsets.UTF_8);
            resp.sendRedirect(request.getContextPath() + "/admin/user?action=edit&id=" + userId + "&success=" + encoded);
        } catch (Exception e) {
            e.printStackTrace();
            String err = URLEncoder.encode("Lỗi khi cập nhật: " + e.getMessage(), StandardCharsets.UTF_8);
            resp.sendRedirect(request.getContextPath() + "/admin/user?action=edit&id=" + userId + "&error=" + err);
        }
    }

    private void doAddPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int questionId = -1;
        try {
            String questionIdParam = request.getParameter("question_id");

            String contentParam = request.getParameter("content");

            questionId = questionIdParam != null && !questionIdParam.isEmpty() ? Integer.parseInt(questionIdParam) : -1;

            if (questionId == -1) {
                throw new Exception("Empty question id");
            }
            if (contentParam == null || contentParam.isEmpty()) {
                throw new Exception("Empty content");
            }
            int userId = 1;
            Comment comment = new Comment(userId, questionId, contentParam);

            // Tạo đối tượng User với mật khẩu đã hash
            this.questionService.handleAnswerQuestion(questionId, comment);
            String msg = "Reply content have been send";
            String encodedErrorMessage = URLEncoder.encode(msg, StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/question?id=" + questionId + "&success=" + encodedErrorMessage);

        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = "Error: " + e.getMessage();
            String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);

            // questionId có thể vẫn là -1 nếu lỗi ở đoạn parse -> nên check trước khi dùng
            String redirectUrl = questionId != -1
                    ? request.getContextPath() + "/admin/question?id=" + questionId + "&error=" + encodedErrorMessage
                    : request.getContextPath() + "/admin/question?error=" + encodedErrorMessage;

            response.sendRedirect(redirectUrl);
        }
    }

    private void handleViewDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pageDesc = "View question";
            String[][] breadcrumbs = {
                    {"Questions", "/admin/question"},
                    {pageDesc, null},
            };
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", pageDesc);
            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));


            int questionId = Integer.parseInt(request.getParameter("id"));

            Question question = questionService.findById(questionId);
            List<Comment> comments = commentService.getCommentByQuestionId(questionId);
            if (question == null) {
                throw new Exception("Không tìm thấy câu hỏi với ID = " + questionId);
            }
            request.setAttribute("question", question);
            request.setAttribute("comments", comments);

            request.setAttribute("contentPage", "/views/admin/question/index.jsp");
            request.setAttribute("view", "/views/admin/question/view-detail.jsp");

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/question" + "?error=" + message);

        }

    }


    private void handleViewPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        try {
            List<Category> categories = this.categoryService.getAll();
            List<Department> departments = this.departmentService.getAllDepartment();

            String statusParam = request.getParameter("status"); // ví dụ: "popular", "unanswered"...
            String categoryIdParam = request.getParameter("category");
            String departmentIdParam = request.getParameter("department");

            int categoryId = categoryIdParam != null && !categoryIdParam.isEmpty() ? Integer.parseInt(categoryIdParam) : -1;
            int departmentId = departmentIdParam != null && !departmentIdParam.isEmpty() ? Integer.parseInt(departmentIdParam) : -1;
            String status = statusParam != null && !statusParam.isEmpty() ? statusParam : "0";

            List<Integer> userDeptIds = Arrays.asList(1, 2); // Ví dụ user quản lý 3 phòng
            List<Question> questions = this.questionService.getQuestionsFilteredForAdmin(status, categoryId, departmentId, userDeptIds);

            request.setAttribute("questions", questions);
            request.setAttribute("categories", categories);
            request.setAttribute("departments", departments);
            request.setAttribute("contentPage", "/views/admin/question/index.jsp");
            request.setAttribute("view", "/views/admin/question/view-list.jsp");
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", "Questions");

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            String msg = URLEncoder.encode("Lỗi khi lấy danh sách câu hỏi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/question" + "?error=" + msg);
        }

    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: code thêm role
        try {
            String[][] breadcrumbs = {
                    {"User list", "/admin/user"},
                    {"Add user", null},
            };

//            List<Role> roles = roleService.getRoles();
            List<Department> departments = departmentService.getAllDepartment();
            List<Category> categories = categoryService.getAll();
//
            request.setAttribute("departments", departments);
            request.setAttribute("categories", categories);
//            request.setAttribute("roles", roles);
//            request.setAttribute("contentPage", "/views/admin/user/index.jsp");
//            request.setAttribute("view", "/views/admin/user/add-user.jsp");
//            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
//            request.setAttribute("cardTitle", "Add user");

//            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));
            request.setAttribute("contentPage", "/views/client/add-post.jsp");
            request.getRequestDispatcher("/views/layouts/client.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin" + "?error=" + message);
        }


    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: code sửa role
        String[][] breadcrumbs = {
                {"User list", "/admin/user"},
                {"Edit user", null},
        };
        try {
            String userId = request.getParameter("id");

            if (userId != null) {
                User user = userService.getUser(Integer.parseInt(userId));
                List<Role> roles = roleService.getRoles();
                List<Department> departments = departmentService.getAllDepartment();

                request.setAttribute("departments", departments);
                request.setAttribute("roles", roles);
                request.setAttribute("user", user);

                request.setAttribute("contentPage", "/views/admin/user/index.jsp");
                request.setAttribute("view", "/views/admin/user/edit-user.jsp");
                request.setAttribute("breadcrumbTitle", breadcrumbTitle);
                request.setAttribute("cardTitle", "Edit user");

                request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));
                request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
            }


        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/user?" + "error=" + message);
        }

    }

    private static class DataTableResponse {
        private final int draw;
        private final int recordsTotal;
        private final int recordsFiltered;
        private final List<Map<String, String>> data;

        public DataTableResponse(int draw, int recordsTotal, int recordsFiltered, List<Map<String, String>> data) {
            this.draw = draw;
            this.recordsTotal = recordsTotal;
            this.recordsFiltered = recordsFiltered;
            this.data = data;
        }
    }
}
