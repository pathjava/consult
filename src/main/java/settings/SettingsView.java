package settings;

import ru.progwards.java2.db.DataBase;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/settings-view")
public class SettingsView extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean edit = "true".equals(req.getParameter("edit"));

        if (edit) {
            req.getRequestDispatcher("/settings/settings-edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean add = "true".equals(req.getParameter("add"));

        List<DataBase.Settings.Record> settings = new ArrayList<>(DataBase.INSTANCE.settings.getAll());
        settings.sort(Comparator.comparing(o -> o.name));

        if (add) {
            List<DataBase.Users.User> mentors =
                    DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());

            List<String> daysOfWeek =
                    new ArrayList<>(List.of("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"));

            req.setAttribute("mentors", mentors);
            req.setAttribute("daysOfWeek", daysOfWeek);

            req.getRequestDispatcher("/settings/settings-add.jsp").forward(req, resp);
        } else {
            List<DataBase.Users.User> mentors = Utils.getMentors();
            Map<String, List<String>> daysAndTime = Utils.getDaysTimeSchedule();

            req.setAttribute("mentors", mentors);
            req.setAttribute("daysAndTime", daysAndTime);
            req.setAttribute("settings", settings);
            req.getRequestDispatcher("/settings/settings-view.jsp").forward(req, resp);
        }
    }

}
