package user;

import org.apache.taglibs.standard.tag.common.xml.ParseSupport;
import ru.progwards.java2.db.DataBase;

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

        Map<String, List<String>> daysAndTime = getDaysAndTime(days);

        req.setAttribute("mentors", mentors);
        req.setAttribute("days", days);
        req.getRequestDispatcher("/users/mentors.jsp").forward(req, resp);

    }

    private static Map<String, List<String>> getDaysAndTime(List<DataBase.Settings.Record> days) {
        Map<String, List<String>> map = new LinkedHashMap<>();
        for (DataBase.Settings.Record day : days) {
            map.put(day.getName(), parseTime(day.getValue()));
        }
        return map;
    }

    private static List<String> parseTime(String value) {
        List<String> list = new ArrayList<>();
        String[] daysAndTime = value.split("\\|");
        for (String s : daysAndTime) {
            String day = s.substring(0, 1);
            String time = s.substring(2, 7);
            String duration = s.substring(8);
            list.add(dayOfWeek(day));
            list.add(time);
            list.add(duration);
        }
        return list;
    }

    private static String dayOfWeek(String day) {
        List<String> daysOfWeek = new ArrayList<>(List.of("Понедельник",
                "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"));
        return daysOfWeek.get(Integer.parseInt(day) - 1);
    }
}
