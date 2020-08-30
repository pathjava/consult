package ru.progwards.advanced.business.utils;

import ru.progwards.java2.lib.DataBase;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

public class Utils {

    public static List<DataBase.Users.User> getMentors(){
        return DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());
    }

    public static Long getTime(String time) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        Date parseTime = new Date();
        try {
            parseTime = timeFormat.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return parseTime.getTime();
    }



    /* пока не используемые */
    public static List<String> dayOfWeek() {
        return new ArrayList<>(List.of("Понедельник",
                "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"));
    }

    public static Map<Integer, List<String>> getSchedules(){
        Map<Integer, List<String>> map = new LinkedHashMap<>();
        List<String> values;
        List<DataBase.Schedule.Value> schedules = new ArrayList<>(DataBase.INSTANCE.schedule.getAll());
        schedules.sort(Comparator.comparing(DataBase.Schedule.Value::getDay_of_week));

        int index = 0;
        for (DataBase.Schedule.Value schedule : schedules) {
            values = new ArrayList<>();
            values.add(schedule.mentor);
            values.add(getDayOfWeeks(schedule.day_of_week));
            values.add("с " + getStartTime(schedule.start) + " до "
                    + getEndTime(schedule.duration, schedule.start));
            map.put(index, values);
            index++;
        }
        return map;
    }

    private static String getDayOfWeeks(int day) {
        List<String> daysOfWeek = dayOfWeek();
        return daysOfWeek.get(day - 1);
    }

    private static String getStartTime(long time) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        return timeFormat.format(new Date(time));
    }

    private static String getEndTime(long time, long duration) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        return timeFormat.format(new Date(time + duration));
    }
}
