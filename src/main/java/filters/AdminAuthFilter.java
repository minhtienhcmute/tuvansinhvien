package filters;

import config.MenuConfig;
import config.MenuItem;
import enums.RoutePermission;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Permission;
import models.Role;
import models.User;
import repositoriesImpl.UserDepartmentRepositoryImpl;
import repositoriesImpl.UserRepositoryImpl;
import repositoriesImpl.UserRoleRepositoryImpl;
import servicesImpl.UserServiceImpl;
import utils.PermissionUtils;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {
    private final UserServiceImpl userService = new UserServiceImpl(new UserRepositoryImpl(), new UserRoleRepositoryImpl(), new UserDepartmentRepositoryImpl());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String fullURL = httpRequest.getRequestURL().toString(); // lấy full URL
        String query = httpRequest.getQueryString();
        if (query != null) {
            fullURL += "?" + query;
        }
        String encodedURL = URLEncoder.encode(fullURL, StandardCharsets.UTF_8);

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (!isLoggedIn) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login?redirect_uri=" + encodedURL);
            return;
        }

        User user = (User) session.getAttribute("user");


        try {
            // Làm mới dữ liệu user từ DB
            User freshUser = userService.getUserByEmail(user.getEmail());
            if (freshUser != null) {
                userService.assignPermissionsToUserRoles(freshUser);

                List<String> userPermissions = new ArrayList<>();
                for (Role role : user.getRoles()) {
                    for (Permission permission : role.getPermissions()) {
                        userPermissions.add(permission.getCode());
                    }
                }

                session.setAttribute("user", freshUser);
                session.setAttribute("userPermissions", userPermissions);

                user = freshUser; // cập nhật lại biến user để dùng tiếp bên dưới
            }
        } catch (Exception e) {
            e.printStackTrace(); // hoặc ghi log
        }
        boolean isAdmin = user.getType() == 1;

        if (!isAdmin) {
            httpResponse.sendRedirect(httpRequest.getContextPath());
            return;
        }

        String path = ((HttpServletRequest) request).getServletPath();
        String actionParam = httpRequest.getParameter("action");

        String pathToCheck;
        if (actionParam != null && !actionParam.isEmpty()) {
            pathToCheck = path + "?action=" + actionParam;
        } else {
            pathToCheck = path;
        }
        String requiredPermission = RoutePermission.getPermissionByPath(pathToCheck);

        if (requiredPermission == null || userService.hasPermission(user, requiredPermission)) {
            List<MenuItem> menus = MenuConfig.getMenus();

            List<String> userPermissions = (List<String>) session.getAttribute("userPermissions");
            PermissionUtils.setPermissionFlags(httpRequest, userPermissions);
            request.setAttribute("menus", menus);


            chain.doFilter(request, response);
        } else {
            // Không có quyền
            String errorMessage = "Bạn không có quyền truy cập vào trang này!";
            String encodedMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin?error=" + encodedMessage);
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên khi filter bị hủy
    }
}