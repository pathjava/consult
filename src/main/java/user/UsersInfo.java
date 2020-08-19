package user;

import ru.progwards.java2.db.DataBase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/user/users-info")
public class UsersInfo extends HttpServlet {

    private static final String minPass = DataBase.INSTANCE.settings.findKey("MIN_LENGTH_PASS").value;
    private static final String maxPass = DataBase.INSTANCE.settings.findKey("MAX_LENGTH_PASS").value;
    private static final String minLoginName = DataBase.INSTANCE.settings.findKey("MIN_LENGTH_LOGIN_NAME").value;
    private static final String maxLoginName = DataBase.INSTANCE.settings.findKey("MAX_LENGTH_LOGIN_NAME").value;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean edit = "true".equals(req.getParameter("edit"));
        String editLogin = req.getParameter("el");

        if (edit) {
            DataBase.Users.User user = DataBase.INSTANCE.users.findKey(editLogin);
            req.setAttribute("user", user);
            req.setAttribute("minPass", minPass);
            req.setAttribute("maxPass", maxPass);
            req.setAttribute("minLoginName", minLoginName);
            req.setAttribute("maxLoginName", maxLoginName);
            req.getRequestDispatcher("/users/user-edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        boolean add = "true".equals(req.getParameter("add"));

        if (login != null) {
            DataBase.Users.User user = DataBase.INSTANCE.users.findKey(login);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/users/user-info.jsp").forward(req, resp);
        } else if (add) {
            req.setAttribute("minPass", minPass);
            req.setAttribute("maxPass", maxPass);
            req.setAttribute("minLoginName", minLoginName);
            req.setAttribute("maxLoginName", maxLoginName);
            req.getRequestDispatcher("/users/user-add.jsp").forward(req, resp);
        } else {
            List<DataBase.Users.User> users = new ArrayList<>(DataBase.INSTANCE.users.getAll());
            users.sort(Comparator.comparing(o -> o.name));
            req.setAttribute("users", users);
            req.getRequestDispatcher("/users/users-info.jsp").forward(req, resp);
        }
    }

}
