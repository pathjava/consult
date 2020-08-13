package user;

import ru.progwards.java2.db.DataBase;

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DataBase.Users.User> users = new ArrayList<>(DataBase.INSTANCE.users.getAll());
        users.sort(Comparator.comparing(o -> o.name));

        String param = req.getParameter("login");

        if (param != null) {
            for (DataBase.Users.User user : users) {
                if (param.equals(user.login)) {
                    req.setAttribute("users", user);
                    req.getRequestDispatcher("/users/users-info.jsp").forward(req, resp);
                }
            }
        } else {
            req.setAttribute("users", users);
            req.getRequestDispatcher("/users/users-info.jsp").forward(req, resp);
        }
    }

}
