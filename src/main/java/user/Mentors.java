package user;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/mentors")
public class Mentors extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<DataBase.Users.User> mentors =
                DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());

        req.setAttribute("mentors", mentors);
        req.getRequestDispatcher("/users/mentors.jsp").forward(req, resp);

    }
}
