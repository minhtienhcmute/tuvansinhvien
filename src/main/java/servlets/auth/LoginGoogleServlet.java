package servlets.auth;


import auth.GooglePoJo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Permission;
import models.Role;
import models.User;
import repositoriesImpl.UserDepartmentRepositoryImpl;
import repositoriesImpl.UserRepositoryImpl;
import repositoriesImpl.UserRoleRepositoryImpl;
import servicesImpl.AuthService;
import servicesImpl.UserServiceImpl;
import utils.DBConnectionPool;
import utils.GoogleUtils;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/auth/callback"})

public class LoginGoogleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final AuthService authService = new AuthService();
    private final UserServiceImpl userService = new UserServiceImpl(new UserRepositoryImpl(), new UserRoleRepositoryImpl(), new UserDepartmentRepositoryImpl());

    public LoginGoogleServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String code = req.getParameter("code");
        String state = req.getParameter("state");

        if (code == null || code.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            String accessToken = GoogleUtils.getToken(code);
            GooglePoJo googlePojo = GoogleUtils.getUserInfo(accessToken);

            if (googlePojo == null || googlePojo.getEmail() == null) {
                resp.sendRedirect(req.getContextPath() + "/login?error=Lỗi khi lấy thông tin từ Google");
                return;
            }

            String email = googlePojo.getEmail();
            String googleId = googlePojo.getSub();
            String name = googlePojo.getName();
            String avatar = googlePojo.getPicture();


            User user = authService.loginWithGoogle(email, googleId, name, avatar);

            if (user != null) {
                userService.assignPermissionsToUserRoles(user);

                List<String> userPermissions = new ArrayList<>();
                for (Role role : user.getRoles()) {
                    for (Permission permission : role.getPermissions()) {
                        userPermissions.add(permission.getCode()); // Giả sử `getName()` trả về tên quyền
                    }
                }

                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userPermissions ", userPermissions);
            }

            if (state != null && !state.isEmpty()) {
                resp.sendRedirect(state);
            } else {
                resp.sendRedirect(req.getContextPath() + "/");
            }


        } catch (Exception e) {
            e.printStackTrace();
            String message = URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "/login?error=" + message);
//            resp.sendRedirect(req.getContextPath() + "/login?error=Đăng nhập Google thất bại");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("uname");
        String password = req.getParameter("psw");
        String SQL_GET_USER = "SELECT * FROM users WHERE name = ? AND password = ?";
        try (Connection connection = DBConnectionPool.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_USER)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession();
                System.out.println(rs.getString("role"));
                session.setAttribute("userRole", rs.getString("role"));
                session.setAttribute("user", rs.getString("name"));
            }
            resp.sendRedirect(req.getContextPath() + "/admin");


        } catch (SQLException e) {
            System.out.println(e);
        }

    }
}
