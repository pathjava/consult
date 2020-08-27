package examples;

import ru.progwards.java2.db.DataBase;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

//@WebFilter("/users/user-auth")
public class PasswordFilter implements Filter {

    private static final int minPass =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MIN_LENGTH_PASS").value);
    private static final int maxPass =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_PASS").value);

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("examples.PasswordFilter.doFilter");
        String password = req.getParameter("password");

        if (password == null || password.length() < minPass || password.length() > maxPass) {
            req.setAttribute("error-description", "Пароль отсутствует или слишком короткий. Длина пароля должна быть от "
                    + minPass + " до " + maxPass + " символов!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } else
            filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
