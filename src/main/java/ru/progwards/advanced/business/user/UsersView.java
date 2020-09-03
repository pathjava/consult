package ru.progwards.advanced.business.user;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/users-view")
public class UsersView extends HttpServlet {

    private static final int MIN_PASS = Utils.getMinLengthPass();
    private static final int MAX_PASS = Utils.getMaxLengthPass();
    private static final int MIN_LOGIN_NAME = Utils.getMinLengthLoginName();
    private static final int MAX_LOGIN_NAME = Utils.getMaxLengthLoginName();
    private static final String FILE_DIRECTORY = Utils.getAvatarsDirectory();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean edit = "true".equals(req.getParameter("edit"));
        String editLogin = req.getParameter("el");

        if (edit) {
            DataBase.Users.User user = DataBase.INSTANCE.users.findKey(editLogin);
            req.setAttribute("user", user);
            req.setAttribute("minPass", MIN_PASS);
            req.setAttribute("maxPass", MAX_PASS);
            req.setAttribute("minLoginName", MIN_LOGIN_NAME);
            req.setAttribute("maxLoginName", MAX_LOGIN_NAME);
            req.setAttribute("avatarsDirectory", FILE_DIRECTORY);
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
            req.setAttribute("avatarsDirectory", FILE_DIRECTORY);
            req.getRequestDispatcher("/users/user-view.jsp").forward(req, resp);
        } else if (add) {
            req.setAttribute("minPass", MIN_PASS);
            req.setAttribute("maxPass", MAX_PASS);
            req.setAttribute("minLoginName", MIN_LOGIN_NAME);
            req.setAttribute("maxLoginName", MAX_LOGIN_NAME);
            req.getRequestDispatcher("/users/user-add.jsp").forward(req, resp);
        } else {
            List<DataBase.Users.User> users = new ArrayList<>(DataBase.INSTANCE.users.getAll());
            users.sort(Comparator.comparing(o -> o.name));
            req.setAttribute("users", users);
            req.setAttribute("avatarsDirectory", FILE_DIRECTORY);
            req.getRequestDispatcher("/users/users-view.jsp").forward(req, resp);
        }
    }
}
