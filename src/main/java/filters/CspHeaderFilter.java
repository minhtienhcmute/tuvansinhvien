package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.UUID;


//@WebFilter("/admin/users/*")
@WebFilter("/*")
public class CspHeaderFilter implements Filter {
    private static final List<String> PROTECTED_METHODS = Arrays.asList("POST", "PUT", "DELETE");

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse resp = (HttpServletResponse) response;

        // Set Content Security Policy
        String cspNonce = Base64.getEncoder().encodeToString(UUID.randomUUID().toString().getBytes());
        request.setAttribute("cspNonce", cspNonce);

//        String cspPolicy = "default-src 'self'; "
//                + "script-src 'self' https://code.jquery.com 'nonce-" + cspNonce + "'; "
//                + "script-src-elem 'self' https://code.jquery.com 'nonce-" + cspNonce + "'; "
//                + "style-src 'self' https://fonts.googleapis.com; "
//                + "style-src-elem 'self' https://fonts.googleapis.com; "
//                + "img-src 'self' data: https://lh3.googleusercontent.com; "
//                + "font-src 'self' https://fonts.gstatic.com; "
//                + "connect-src 'self'; "
//                + "frame-src 'self'; "
//                + "object-src 'none'; "
//                + "base-uri 'self'; "
//                + "form-action 'self';";
        String cspPolicy = "default-src 'self'; "
                + "script-src 'self' https://code.jquery.com 'nonce-" + cspNonce + "'; "
                + "script-src-elem 'self' https://code.jquery.com 'nonce-" + cspNonce + "'; "
                + "script-src-attr 'self'; "                   // fallback cho inline/on* attribute
                + "style-src 'self' https://fonts.googleapis.com; "
                + "style-src-elem 'self' https://fonts.googleapis.com; "
                + "style-src-attr 'self'; "                    // fallback cho style="" attributes
                + "img-src 'self' data: https://lh3.googleusercontent.com; "
                + "font-src 'self' https://fonts.gstatic.com; "
                + "connect-src 'self'; "
                + "frame-src 'self'; "
                + "frame-ancestors 'self'; "                   // fallback cho iframe embedding
                + "object-src 'none'; "
                + "base-uri 'self'; "
                + "form-action 'self';";
        resp.setHeader("Content-Security-Policy", cspPolicy);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}