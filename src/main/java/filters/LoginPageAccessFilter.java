package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({"/login"})

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
            // Nếu đã đăng nhập → redirect về trang chủ
            res.sendRedirect(req.getContextPath());
        } else {
            // Nếu chưa login → cho truy cập bình thường
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên khi filter bị hủy
    }
}
