package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Department;
import models.Permission;
import models.Role;
import models.User;
import org.mindrot.jbcrypt.BCrypt;
import repositoriesImpl.*;
import servicesImpl.DepartmentServiceImpl;
import servicesImpl.PermissionServiceImpl;
import servicesImpl.RoleServiceImpl;
import servicesImpl.UserServiceImpl;
import utils.BreadcrumbUtils;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet({"/admin/user"})

public class UserServlet extends HttpServlet {
    private PermissionServiceImpl permissionService;
    private RoleServiceImpl roleService;
    private DepartmentServiceImpl departmentService;
    private UserServiceImpl userService;
    private final String breadcrumbTitle = "User management";

    public void init() throws ServletException {
        this.permissionService = new PermissionServiceImpl(new PermissionRepositoryImpl());

        this.roleService = new RoleServiceImpl(new RoleRepositoryImpl());
        this.departmentService = new DepartmentServiceImpl(new DepartmentRepositoryImpl());
        this.userService = new UserServiceImpl(new UserRepositoryImpl(), new UserRoleRepositoryImpl(), new UserDepartmentRepositoryImpl());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) action = "view";

//            String csrfToken = java.util.UUID.randomUUID().toString();
//            request.getSession().setAttribute("CSRF_TOKEN", csrfToken);
//            request.setAttribute("csrfToken", csrfToken);

            switch (action) {
                case "view":
                    // show list
                    String roleId = request.getParameter("id");

                    if (roleId != null) {
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
            resp.sendRedirect(req.getContextPath() + "/admin/user?error=" + URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8));
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

    private void doAddPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy dữ liệu từ request
        String username = req.getParameter("name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String type = req.getParameter("type");
        String[] roleIds = req.getParameterValues("roles[]");  // Các role liên kết với user
        String[] deptIds = req.getParameterValues("departments[]");  // Các phòng ban liên kết với user

        if (roleIds == null || roleIds.length == 0) {
            roleIds = new String[0];
        }

        if (deptIds == null || deptIds.length == 0) {
            deptIds = new String[0];
        }
        int getType = 0;
        if (type != null) {
            getType = Integer.parseInt(type);
        }

        // Kiểm tra dữ liệu hợp lệ
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            String errorMessage = "Tên người dùng và mật khẩu không thể để trống!";
            String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "/admin/user?action=add&error=" + encodedErrorMessage);
            return;
        }

        try {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Tạo đối tượng User với mật khẩu đã hash
            User user = new User(email, hashedPassword, username, getType);  // Giả sử bạn có lớp User với các tham số này

            // Gọi service để thêm user với các mối quan hệ (role và department)
            this.userService.createUserWithRelations(user, roleIds, deptIds);
            String msg = "Thêm user thành công!";
            String encodedErrorMessage = URLEncoder.encode(msg, StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "/admin/user?action=add&success=" + encodedErrorMessage);

        } catch (Exception e) {
            e.printStackTrace();

            // Xử lý lỗi khi thêm role hoặc phân quyền
            String errorMessage = "Có lỗi xảy ra khi thêm user: " + e.getMessage();
            String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "/admin/user?action=add&error=" + encodedErrorMessage);
        }
    }

    private void handleViewDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            int roleId = Integer.parseInt(request.getParameter("id"));
            Role role = roleService.getRoleById(roleId);
            Map<String, List<Permission>> groupedPermissions = role.getPermissions()
                    .stream()
                    .collect(Collectors.groupingBy(Permission::getModule));

            request.setAttribute("groupedPermissions", groupedPermissions);
            request.setAttribute("contentPage", "/views/admin/role/index.jsp");
            request.setAttribute("view", "/views/admin/role/view-role.jsp");
            request.setAttribute("role", role);
            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "?error=" + message);
        }

    }


    private void handleViewPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<User> users = this.userService.getUsersWithRelations();
        request.setAttribute("users", users);
        request.setAttribute("contentPage", "/views/admin/user/index.jsp");
        request.setAttribute("view", "/views/admin/user/view-list.jsp");
        request.setAttribute("breadcrumbTitle", breadcrumbTitle);
        request.setAttribute("cardTitle", "Users");

        request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: code thêm role
        try {
            String[][] breadcrumbs = {
                    {"User list", "/admin/user"},
                    {"Add user", null},
            };

            List<Role> roles = roleService.getRoles();
            List<Department> departments = departmentService.getAllDepartment();

            request.setAttribute("departments", departments);
            request.setAttribute("roles", roles);
            request.setAttribute("contentPage", "/views/admin/user/index.jsp");
            request.setAttribute("view", "/views/admin/user/add-user.jsp");
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", "Add user");

            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
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
