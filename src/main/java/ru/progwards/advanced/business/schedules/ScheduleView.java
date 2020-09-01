package ru.progwards.advanced.business.schedules;

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

@WebServlet("/schedule-view")
public class ScheduleView extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean edit = "true".equals(req.getParameter("edit"));

        if (edit) {
            req.getRequestDispatcher("/schedules/schedule-edit.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean add = "true".equals(req.getParameter("add"));

        if (add) {
            List<DataBase.Users.User> mentors = Utils.getMentors();

            req.setAttribute("mentors", mentors);
            req.getRequestDispatcher("/schedules/schedule-add.jsp").forward(req, resp);
        } else {
            Map<Integer, List<SchedulesMentors>> schedules = getSchedulesMentors();

            req.setAttribute("schedules", schedules);
            req.getRequestDispatcher("/schedules/schedule-view.jsp").forward(req, resp);
        }
    }

    public static Map<Integer, List<SchedulesMentors>> getSchedulesMentors() {
        Map<Integer, List<SchedulesMentors>> map = new LinkedHashMap<>();
        List<SchedulesMentors> list;
        List<DataBase.Schedule.Value> schedules = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
        schedules.sort(Comparator.comparing(DataBase.Schedule.Value::getDay_of_week)
                .thenComparingLong(DataBase.Schedule.Value::getStart)
                .thenComparing(DataBase.Schedule.Value::getMentor));
        List<DataBase.Users.User> mentors = Utils.getMentors();

        int key = 1;
        for (DataBase.Schedule.Value schedule : schedules) {
            list = new ArrayList<>();
            String mentorName = "";
            for (DataBase.Users.User mentor : mentors) {
                if (mentor.login.equals(schedule.mentor))
                    mentorName = mentor.name;
            }
            String dayOfWeek = getDayOfWeek(schedule.day_of_week);
            String startAndEndTime = getStartAndEndTime(schedule.start, schedule.duration);

            list.add(new SchedulesMentors(schedule.mentor, mentorName, schedule.day_of_week,
                    dayOfWeek, schedule.start, schedule.duration, startAndEndTime));
            map.put(key, list);
            key++;
        }
        return map;
    }

    private static String getStartAndEndTime(long start, long duration) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        String startTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(start),
                ZoneId.of("UTC")).format(formatter);
        String endTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(start + duration),
                ZoneId.of("UTC")).format(formatter);
        return "с " + startTime + " до " + endTime;
    }

    private static String getDayOfWeek(int day_of_week) {
        String day = DayOfWeek.of(day_of_week)
                .getDisplayName(TextStyle.FULL_STANDALONE, new Locale("ru"));
        return day.substring(0, 1).toUpperCase() + day.substring(1);
    }

    public static class SchedulesMentors {
        public final String mentor;
        public final String mentorName;
        public final int day_of_week;
        public final String dayOfWeek;
        public final long start;
        public final long duration;
        public final String startAndEndTime;

        public SchedulesMentors(String mentor, String mentorName, int day_of_week, String dayOfWeek,
                                long start, long duration, String startAndEndTime) {
            this.mentor = mentor;
            this.mentorName = mentorName;
            this.day_of_week = day_of_week;
            this.dayOfWeek = dayOfWeek;
            this.start = start;
            this.duration = duration;
            this.startAndEndTime = startAndEndTime;
        }

        public String getMentor() {
            return mentor;
        }

        public String getMentorName() {
            return mentorName;
        }

        public int getDay_of_week() {
            return day_of_week;
        }

        public String getDayOfWeek() {
            return dayOfWeek;
        }

        public long getStart() {
            return start;
        }

        public long getDuration() {
            return duration;
        }

        public String getStartAndEndTime() {
            return startAndEndTime;
        }
    }
}
