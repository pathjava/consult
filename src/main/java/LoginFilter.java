import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.stream.Stream;

//@WebFilter(servletNames = "trial.Show", urlPatterns = "/show1", initParams = {@WebInitParam(name = "", value = "")})
//@WebFilter("/show")
public class LoginFilter implements Filter {
    boolean isActive = false;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("LoginFilter.init");
        String activeStr = filterConfig.getInitParameter("active");
        isActive = "true".equalsIgnoreCase(activeStr);
        System.out.println("activeStr = " + activeStr);
        System.out.println("isActive = " + isActive);
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("LoginFilter.doFilter start");

        String login = req.getParameter("login");
        if (login == null || "".equals(login.trim())) {
            req.setAttribute("error-description", "Логин отсутствует или пустой. Логин должен быть установлен.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } else
            filterChain.doFilter(req, resp);

        System.out.println("LoginFilter.doFilter finish");
    }

    @Override
    public void destroy() {
        System.out.println("LoginFilter.destroy");
    }
}
