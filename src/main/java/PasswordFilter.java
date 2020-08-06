import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

//@WebFilter(servletNames = "Show", urlPatterns = "/show1")
@WebFilter("/show")
public class PasswordFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("PasswordFilter.doFilter");
        String password = req.getParameter("password");
        if (password == null || password.length() < 5) {
            req.setAttribute("error-description", "Пароль отсутствует или слишком короткий. Длина пароля должна быть не менее 5 символов.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } else
            filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {}
}
