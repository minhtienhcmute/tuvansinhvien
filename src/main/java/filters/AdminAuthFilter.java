package filters;

import config.MenuConfig;
import config.MenuItem;
import enums.RoutePermission;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {

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

        String path = ((HttpServletRequest) request).getServletPath();
        String requiredPermission = RoutePermission.getPermissionByPath(path);

        List<MenuItem> menus = MenuConfig.getMenus();
        request.setAttribute("menus", menus);

//        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        boolean isLoggedIn = true;
        boolean isAdmin = true;

//        if (isLoggedIn) {
//            // Giả sử 'userRole' là một thuộc tính trong session lưu vai trò của người dùng
//            String userRole = (String) session.getAttribute("userRole");
//            isAdmin = "admin".equals(userRole);
//        }

        if (isLoggedIn && isAdmin) {
            // Nếu đã đăng nhập và có quyền admin, cho phép tiếp tục
            chain.doFilter(request, response);
        } else {
            // Redirect về trang login nếu chưa đăng nhập hoặc không có quyền admin
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên khi filter bị hủy
    }
}