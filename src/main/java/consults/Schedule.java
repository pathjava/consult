package consults;

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

@WebServlet("/schedule")
public class Schedule extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<DataBase.Settings.Record> settings = new ArrayList<>(DataBase.INSTANCE.settings.getAll());
        settings.sort(Comparator.comparing(o -> o.name));
        List<DataBase.Users.User> mentors = Utils.getMentors();
        Map<String, List<String>> daysAndTime = Utils.getDaysTimeSchedule();

        req.setAttribute("mentors", mentors);
        req.setAttribute("daysAndTime", daysAndTime);
        req.setAttribute("settings", settings);

        req.getRequestDispatcher("/consults/schedule.jsp").forward(req, resp);
    }
}
