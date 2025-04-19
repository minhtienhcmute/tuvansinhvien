package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import models.User;
import repositoriesImpl.UserDepartmentRepositoryImpl;
import repositoriesImpl.UserRepositoryImpl;
import repositoriesImpl.UserRoleRepositoryImpl;
import servicesImpl.UserServiceImpl;

import java.io.IOException;

@WebFilter({""})

public class HomeAuthRefreshFilter implements Filter {
    private final UserServiceImpl userService = new UserServiceImpl(
            new UserRepositoryImpl(), new UserRoleRepositoryImpl(), new UserDepartmentRepositoryImpl()
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn) {
            User currentUser = (User) session.getAttribute("user");

            try {
                User freshUser = userService.getUserByEmail(currentUser.getEmail());

                if (freshUser != null) {
                    userService.assignPermissionsToUserRoles(freshUser);
                    session.setAttribute("user", freshUser);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên khi filter bị hủy
    }
}
