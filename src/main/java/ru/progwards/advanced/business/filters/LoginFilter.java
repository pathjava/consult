package ru.progwards.advanced.business.filters;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/users/user-auth")
public class LoginFilter implements Filter {

    private static final int minLoginName =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MIN_LENGTH_LOGIN_NAME").value);
    private static final int maxLoginName =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_LOGIN_NAME").value);

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        String login = req.getParameter("login").trim();

        if ("".equals(login) || login.length() < minLoginName || login.length() > maxLoginName) {
            req.setAttribute("error-description", "Логин отсутствует или пустой. Длина логина должна быть от "
                    + minLoginName + " до " + maxLoginName + " символов!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } else
            filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}