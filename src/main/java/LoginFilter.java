import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/users/user-auth")
public class LoginFilter implements Filter {
    boolean isActive = false;

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        String login = req.getParameter("login");
        if (login == null || "".equals(login.trim())) {
            req.setAttribute("error-description", "Логин отсутствует или пустой. Логин должен быть установлен.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } else
            filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}