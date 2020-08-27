package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizedFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) req).getSession();
        if (session.getAttribute("login") == null) {
            session.setAttribute("targetUrl", ((HttpServletRequest) req).getRequestURI());
            ((HttpServletResponse)resp).sendRedirect("login");
        } else
            chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {}
}