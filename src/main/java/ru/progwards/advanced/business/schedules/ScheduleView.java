package ru.progwards.advanced.business.schedules;

import ru.progwards.java2.lib.DataBase;
import ru.progwards.advanced.business.utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/schedule-view")
public class ScheduleView extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean edit = "true".equals(req.getParameter("edit"));

        if (edit) {
            req.getRequestDispatcher("/ru/progwards/advanced/business/schedules/schedule-edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean add = "true".equals(req.getParameter("add"));

        if (add) {
            List<DataBase.Users.User> mentors = Utils.getMentors();

            req.setAttribute("mentors", mentors);
            req.getRequestDispatcher("/ru/progwards/advanced/business/schedules/schedule-add.jsp").forward(req, resp);
        } else {
            List<DataBase.Schedule.Value> schedules = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
            schedules.sort(Comparator.comparing(DataBase.Schedule.Value::getDay_of_week)
                    .thenComparingLong(DataBase.Schedule.Value::getStart)
                    .thenComparing(DataBase.Schedule.Value::getMentor));
            List<DataBase.Users.User> mentors = Utils.getMentors();

            req.setAttribute("mentors", mentors);
            req.setAttribute("schedules", schedules);
            req.getRequestDispatcher("/ru/progwards/advanced/business/schedules/schedule-view.jsp").forward(req, resp);
        }
    }
}
