package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({ "/login" })

public class LoginPageAccessFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        boolean isLoggedIn = session != null && session.getAttribute("user") != null;

        if (isLoggedIn) {
            // Nếu đã đăng nhập -> không cho vào /login, chuyển về trang chủ.
            String contextPath = req.getContextPath();
            String homePath = contextPath == null || contextPath.isEmpty() ? "/" : contextPath + "/";
            System.out.println("[LoginPageAccessFilter] logged-in user redirected from /login to: " + homePath);
            res.sendRedirect(homePath);
            return;
        } else {
            // Nếu chưa login → cho truy cập bình thường
            System.out.println("[LoginPageAccessFilter] guest access /login");
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên khi filter bị hủy
    }
}
