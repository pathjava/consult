package ru.progwards.advanced.business.user;

import ru.progwards.java2.lib.DataBase;
import ru.progwards.advanced.business.utils.Utils;

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
        List<DataBase.Schedule.Value> schedules = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
        schedules.sort(Comparator.comparing(DataBase.Schedule.Value::getDay_of_week)
                .thenComparingLong(DataBase.Schedule.Value::getStart)
                .thenComparing(DataBase.Schedule.Value::getMentor));

        req.setAttribute("mentors", mentors);
        req.setAttribute("schedules", schedules);
        req.getRequestDispatcher("/users/mentors.jsp").forward(req, resp);

    }
}
