package consults;

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
import java.util.stream.Collectors;

@WebServlet("/schedule-view")
public class ScheduleView extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean edit = "true".equals(req.getParameter("edit"));

        if (edit) {
            req.getRequestDispatcher("/consults/schedule-edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean add = "true".equals(req.getParameter("add"));

        if (add) {
            List<DataBase.Users.User> mentors =
                    DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());
            List<String> daysOfWeek =
                    new ArrayList<>(List.of("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"));

            req.setAttribute("mentors", mentors);
            req.setAttribute("daysOfWeek", daysOfWeek);
            req.getRequestDispatcher("/consults/schedule-add.jsp").forward(req, resp);
        } else {
            List<DataBase.Schedule.Value> schedules = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
            schedules.sort(Comparator.comparing(DataBase.Schedule.Value::getMentor)
                    .thenComparingInt(DataBase.Schedule.Value::getDay_of_week));

            req.setAttribute("schedules", schedules);

            req.getRequestDispatcher("/consults/schedule-view.jsp").forward(req, resp);
        }
    }
}
