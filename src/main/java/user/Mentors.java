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

@WebServlet("/mentors")
public class Mentors extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<DataBase.Users.User> mentors = Utils.getMentors();
//        Map<String, List<String>> daysAndTime = Utils.getDaysTimeSchedule();

        req.setAttribute("mentors", mentors);
//        req.setAttribute("daysAndTime", daysAndTime);
        req.getRequestDispatcher("/users/mentors.jsp").forward(req, resp);

    }
}
