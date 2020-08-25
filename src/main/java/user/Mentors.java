package user;

import ru.progwards.java2.db.DataBase;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/mentors")
public class Mentors extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<DataBase.Users.User> mentors =
                DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());

        List<DataBase.Settings.Record> days = new ArrayList<>();
        for (DataBase.Users.User mentor : mentors) {
            DataBase.Settings.Record day = DataBase.INSTANCE.settings.findKey(mentor.login);
            if (day != null)
                days.add(DataBase.INSTANCE.settings.findKey(mentor.login));
        }

        Map<String, List<String>> daysAndTime = Utils.getDaysAndTime(days);

        req.setAttribute("mentors", mentors);
        req.setAttribute("daysAndTime", daysAndTime);
        req.getRequestDispatcher("/users/mentors.jsp").forward(req, resp);

    }
}
