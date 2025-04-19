package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Category;
import models.Department;
import models.Question;
import models.User;
import repositoriesImpl.*;
import servicesImpl.CategoryServiceImpl;
import servicesImpl.DepartmentServiceImpl;
import servicesImpl.QuestionServiceImpl;
import servicesImpl.UserServiceImpl;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet({""})
public class ClientServlet extends HttpServlet {

    private CategoryServiceImpl categoryService;
    private DepartmentServiceImpl departmentService;
    private QuestionServiceImpl questionService;
    private final UserServiceImpl userService = new UserServiceImpl(
            new UserRepositoryImpl(), new UserRoleRepositoryImpl(), new UserDepartmentRepositoryImpl()
    );

    public void init() throws ServletException {
        this.categoryService = new CategoryServiceImpl(new CategoryRepositoryImpl());
        this.departmentService = new DepartmentServiceImpl(new DepartmentRepositoryImpl());
        this.questionService = new QuestionServiceImpl(new QuestionRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<Category> categories = this.categoryService.getAll();
            List<Department> departments = this.departmentService.getAllDepartment();

            // Các tham số lọc và phân trang
            String tab = req.getParameter("tab"); // ví dụ: "popular", "unanswered"...
            String categoryIdParam = req.getParameter("category");
            String departmentIdParam = req.getParameter("department_id");
            String pageParam = req.getParameter("page");
            String pageSizeParam = req.getParameter("perPage");
            String keyword = req.getParameter("keyword");


            int categoryId = categoryIdParam != null && !categoryIdParam.isEmpty() ? Integer.parseInt(categoryIdParam) : -1;
            int departmentId = departmentIdParam != null && !departmentIdParam.isEmpty() ? Integer.parseInt(departmentIdParam) : -1;

            int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
            int pageSize = pageSizeParam != null ? Integer.parseInt(pageSizeParam) : 5;

            // Tính offset
            int offset = (page - 1) * pageSize;

            // Lấy danh sách câu hỏi
            List<Question> questions = questionService.getQuestionsFiltered(
                    categoryId, departmentId, tab, keyword, pageSize, offset
            );

            // Tổng số lượng để phân trang
            int totalQuestions = questionService.countQuestionsFiltered(categoryId, departmentId, keyword);
            int totalPages = (int) Math.ceil((double) totalQuestions / pageSize);

            HttpSession session = req.getSession();

            boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

            if (isLoggedIn) {
                User currentUser = (User) session.getAttribute("user");

                User freshUser = userService.getUserByEmail(currentUser.getEmail());

                if (freshUser != null) {
                    userService.assignPermissionsToUserRoles(freshUser);
                    session.setAttribute("user", freshUser);
                }

            }


            // Truyền dữ liệu cho JSP
            req.setAttribute("questions", questions);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPage", totalPages);
            req.setAttribute("tab", tab);
            req.setAttribute("categoryId", categoryId);
            req.setAttribute("departmentId", departmentId);
            req.setAttribute("categories", categories);
            req.setAttribute("departments", departments);
            req.setAttribute("contentPage", "/views/client/home.jsp");
            req.getRequestDispatcher("/views/layouts/client.jsp").forward(req, resp);


        } catch (Exception e) {
            e.printStackTrace();
            String msg = URLEncoder.encode("Lỗi khi lấy danh sách câu hỏi", StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "?error=" + msg);
        }


    }
}
