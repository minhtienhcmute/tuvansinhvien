package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import org.mindrot.jbcrypt.BCrypt;
import repositoriesImpl.UserDepartmentRepositoryImpl;
import repositoriesImpl.UserRepositoryImpl;
import repositoriesImpl.UserRoleRepositoryImpl;
import servicesImpl.UserServiceImpl;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet({ "/login" })

public class LoginServlet extends HttpServlet {
    private UserServiceImpl userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserServiceImpl(new UserRepositoryImpl(), new UserRoleRepositoryImpl(),
                new UserDepartmentRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String currentUrl = req.getRequestURL().toString();

        String query = req.getQueryString();
        String fullRedirectUrl = currentUrl + (query != null ? "?" + query : "");
        String encodedState = java.net.URLEncoder.encode(fullRedirectUrl, StandardCharsets.UTF_8);

        String googleLoginUrl = getGoogleLoginUrl(req, encodedState);

        req.setAttribute("googleLoginUrl", googleLoginUrl);
        req.setAttribute("contentPage", "/views/auth/login.jsp");
        req.setAttribute("hideAuthButton", true);
        req.getRequestDispatcher("/views/layouts/client.jsp").forward(req, resp);
    }

    private static String getGoogleLoginUrl(HttpServletRequest req, String encodedState) {
        String serverBase = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort();
        String fullBaseUrl = serverBase + req.getContextPath() + "/auth/callback";

        String googleLoginUrl = "https://accounts.google.com/o/oauth2/auth"
                + "?scope=openid profile email"
                + "&redirect_uri="
                + fullBaseUrl
                + "&response_type=code"
                + "&client_id=1092313228817-qhcl8pag3fgd19hfck31ailnc08ipncm.apps.googleusercontent.com"
                + "&approval_prompt=force"
                + "&state=" + encodedState;
        return googleLoginUrl;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String redirectUri = request.getParameter("redirectUri");
        if (redirectUri == null) {
            redirectUri = "";
        }

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Kiểm tra thông tin bắt buộc
            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                throw new Exception("Invalid email or password");
            }

            // Lấy user từ DB
            User user = userService.getUserByEmail(email);

            if (user == null) {
                // Email không tồn tại
                throw new Exception("User not found");
            }
            if (user != null && user.getGoogle_id() != null) {
                throw new Exception(
                        "Email này đã được tạo thông qua Google. Đăng nhập bằng Google để truy cập tài khoản.");
            }

            String hashedPasswordInDB = user.getPassword();

            // So sánh password đã hash
            if (BCrypt.checkpw(password, hashedPasswordInDB)) {
                // Đăng nhập thành công

                userService.assignPermissionsToUserRoles(user);

                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                redirectUri = !redirectUri.isEmpty() ? redirectUri
                        : (request.getContextPath().isEmpty() ? "/" : request.getContextPath());

                response.sendRedirect(redirectUri);
                return;

            } else {
                throw new Exception("Wrong password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            String err = URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8);
            if (redirectUri.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/login?error=" + err);
            } else {
                response.sendRedirect(
                        request.getContextPath() + "/login?redirect_uri=" + redirectUri + "&error=" + err);
            }
            return;

        }

    }
}
