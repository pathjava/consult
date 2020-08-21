import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizedFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) req).getSession();

        String path = ((HttpServletRequest) req).getRequestURI().toLowerCase();
        if (path.startsWith("/login") || path.startsWith("/") && path.length() == 1) {
            chain.doFilter(req, resp);
        } else if (session.getAttribute("login") == null) {
            ((HttpServletResponse) resp).sendRedirect("/login");
        } else
            chain.doFilter(req, resp);

//        HttpServletRequest request = (HttpServletRequest) req;
//        HttpServletResponse response = (HttpServletResponse) resp;
//        HttpSession session = request.getSession(false);
//
//        String loginURI = request.getContextPath() + "/login";
//
//        boolean loggedIn = session != null && session.getAttribute("login") != null;
//        boolean loginRequest = request.getRequestURI().equals(loginURI);
//
//        if (loggedIn || loginRequest) {
//            chain.doFilter(req, resp);
//        } else {
//            response.sendRedirect(loginURI);
//        }
    }

    @Override
    public void destroy() {
    }
}