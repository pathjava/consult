package utils;

import ru.progwards.java2.db.DataBase;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

public class Utils {

    private static List<DataBase.Users.User> mentors;

    public static List<DataBase.Users.User> getMentors(){
        mentors = DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());
        return mentors;
    }

    public static Map<String, List<String>> getDaysTimeSchedule() {
        List<DataBase.Settings.Record> days = new ArrayList<>();
        for (DataBase.Users.User mentor : mentors) {
            DataBase.Settings.Record day = DataBase.INSTANCE.settings.findKey(mentor.login);
            if (day != null)
                days.add(DataBase.INSTANCE.settings.findKey(mentor.login));
        }
        return getDaysAndTime(days);
    }

    private static Map<String, List<String>> getDaysAndTime(List<DataBase.Settings.Record> days) {
        Map<String, List<String>> map = new LinkedHashMap<>();
        for (DataBase.Settings.Record day : days) {
            map.put(day.getName(), parseTime(day.getValue()));
        }
        return map;
    }

    private static List<String> parseTime(String value) {
        StringBuilder sb;
        List<String> list = new ArrayList<>();
        String[] daysAndTime = value.split("\\|");
        for (String s : daysAndTime) {
            sb = new StringBuilder();
            String time = s.substring(2, 7);
            String duration = s.substring(8);
            sb.append(dayOfWeek(s.substring(0, 1))).append(": с ")
                    .append(time).append(" до ").append(getEndTime(time, duration));
            list.add(sb.toString());
        }
        return list;
    }

    private static String dayOfWeek(String day) {
        List<String> daysOfWeek = new ArrayList<>(List.of("Понедельник",
                "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"));
        return daysOfWeek.get(Integer.parseInt(day) - 1);
    }

    private static String getEndTime(String time, String duration) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        Date startTime = new Date();
        Date durationTime = new Date();
        try {
            startTime = timeFormat.parse(time);
            durationTime = timeFormat.parse(duration);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long sum = startTime.getTime() + durationTime.getTime();
        return timeFormat.format(new Date(sum));
    }
}