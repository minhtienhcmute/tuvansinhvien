package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;


@WebFilter("/*")
public class CsrfTokenValidation implements Filter {
    private static final List<String> PROTECTED_METHODS = Arrays.asList("POST", "PUT", "DELETE");

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);

        if (session.getAttribute("CSRF_TOKEN") == null) {
            session.setAttribute("CSRF_TOKEN", java.util.UUID.randomUUID().toString());
        }
        request.setAttribute("csrfToken", session.getAttribute("CSRF_TOKEN"));
        String method = ((HttpServletRequest) request).getMethod();

        if (PROTECTED_METHODS.contains(req.getMethod().toUpperCase())) {
            String sessionToken = (String) session.getAttribute("CSRF_TOKEN");
            String formToken = req.getParameter("csrfToken");

            if (sessionToken == null || !sessionToken.equals(formToken)) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF token");
                return;
            }

            session.setAttribute("CSRF_TOKEN", java.util.UUID.randomUUID().toString());
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}