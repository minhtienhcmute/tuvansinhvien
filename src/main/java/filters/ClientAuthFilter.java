package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebFilter({"/question", "/profile"})

public class ClientAuthFilter implements Filter {

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

        String action = httpRequest.getParameter("action");

        // Nếu là view công khai (không có action hoặc action=view), thì bỏ qua check login
        if (action == null || action.equals("view")) {
            chain.doFilter(request, response); // Bỏ qua filter
            return;
        }

        String fullURL = httpRequest.getRequestURL().toString(); // lấy full URL
        String query = httpRequest.getQueryString();

        if (query != null) {
            fullURL += "?" + query;
        }
        System.out.println(fullURL);

        String encodedURL = URLEncoder.encode(fullURL, StandardCharsets.UTF_8);

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else {
            // Redirect về trang login nếu chưa đăng nhập hoặc không có quyền admin
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login?redirect_uri=" + encodedURL);
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên khi filter bị hủy
    }
}
