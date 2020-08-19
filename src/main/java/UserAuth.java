import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/users/user-auth")
public class UserAuth extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);
        if (user == null || !user.password.equals(password)) {
            req.setAttribute("error-description", "Логин и пароль не совпадают");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        session.setAttribute("login", login);
        DataBase.Settings.Record rec = DataBase.INSTANCE.settings.findKey("MAX_INACTIVE_INTERVAL");
        int recInterval = -1;
        if (rec != null) {
            try {
                recInterval = Integer.parseInt(rec.value);
            } catch (NumberFormatException ignored) {
            }
        }

        session.setMaxInactiveInterval(recInterval); // секунды
        resp.sendRedirect("/");
    }
}