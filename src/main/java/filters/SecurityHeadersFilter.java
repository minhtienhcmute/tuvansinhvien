package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebFilter("/*")
public class SecurityHeadersFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse resp = (HttpServletResponse) response;

//        if (response instanceof HttpServletResponse httpResponse) {
//            // Ngăn clickjacking
//            httpResponse.setHeader("X-Frame-Options", "SAMEORIGIN");
//            // Cải thiện hơn nữa (dùng thêm CSP nếu muốn)
//            httpResponse.setHeader("Content-Security-Policy", "frame-ancestors 'self'");
//        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}