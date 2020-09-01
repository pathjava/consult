package ru.progwards.advanced.business.user;

import ru.progwards.java2.lib.DataBase;
import ru.progwards.advanced.business.utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.*;

@WebServlet("/mentors")
public class Mentors extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<DataBase.Users.User> mentors = Utils.getMentors();
        Map<String, List<String>> schedules = getSchedulesMentors();

        req.setAttribute("mentors", mentors);
        req.setAttribute("schedules", schedules);
        req.getRequestDispatcher("/users/mentors.jsp").forward(req, resp);
    }

    public static Map<String, List<String>> getSchedulesMentors() {
        Map<String, List<String>> map = new LinkedHashMap<>();
        List<String> list = new ArrayList<>();
        List<DataBase.Schedule.Value> schedules = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
        schedules.sort(Comparator.comparing(DataBase.Schedule.Value::getMentor)
                .thenComparingLong(DataBase.Schedule.Value::getDay_of_week)
                .thenComparing(DataBase.Schedule.Value::getStart));

        String tempLogin = "";
        for (DataBase.Schedule.Value schedule : schedules) {
            String mentor = schedule.mentor;
            String dayTime = getDayTime(schedule.day_of_week, schedule.start, schedule.duration);
            if (!tempLogin.equals(mentor)) {
                list = new ArrayList<>();
                tempLogin = mentor;
            }
            list.add(dayTime);
            map.put(mentor, list);
        }
        return map;
    }

    private static String getDayTime(int day_of_week, long start, long duration) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        String startTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(start),
                ZoneId.of("UTC")).format(formatter);
        String endTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(start + duration),
                ZoneId.of("UTC")).format(formatter);
        String day = DayOfWeek.of(day_of_week)
                .getDisplayName(TextStyle.FULL_STANDALONE, new Locale("ru"));
        day = day.substring(0, 1).toUpperCase() + day.substring(1);
        return day + " с " + startTime + " до " + endTime;
    }
}
