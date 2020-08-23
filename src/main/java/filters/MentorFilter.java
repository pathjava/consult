package filters;

import ru.progwards.java2.db.DataBase;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MentorFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) req).getSession();
        String login = (String) session.getAttribute("login");

        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);
        if (user == null || !user.is_mentor) {
            req.setAttribute("error-description", "Недостаточно прав для данной операции");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } else
            chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}