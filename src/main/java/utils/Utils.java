package utils;

import ru.progwards.java2.db.DataBase;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

public class Utils {

    public static List<DataBase.Users.User> getMentors(){
        return DataBase.INSTANCE.users.getAll().stream().filter(user -> user.is_mentor).collect(Collectors.toList());
    }

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
            values.add(getStartTime(schedule.start));
            values.add(getEndTime(schedule.duration, schedule.start));
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


//    private static List<DataBase.Users.User> mentors;
//    public static Map<String, List<String>> getDaysTimeSchedule() {
//        List<DataBase.Settings.Record> days = new ArrayList<>();
//        for (DataBase.Users.User mentor : mentors) {
//            DataBase.Settings.Record day = DataBase.INSTANCE.settings.findKey(mentor.login);
//            if (day != null)
//                days.add(DataBase.INSTANCE.settings.findKey(mentor.login));
//        }
//        return getDaysAndTime(days);
//    }
//
//    private static Map<String, List<String>> getDaysAndTime(List<DataBase.Settings.Record> days) {
//        Map<String, List<String>> map = new LinkedHashMap<>();
//        for (DataBase.Settings.Record day : days) {
//            map.put(day.getName(), parseTime(day.getValue()));
//        }
//        return map;
//    }
//
//    private static List<String> parseTime(String value) {
//        StringBuilder sb;
//        List<String> list = new ArrayList<>();
//        String[] daysAndTime = value.split("\\|");
//        for (String s : daysAndTime) {
//            sb = new StringBuilder();
//            String time = s.substring(2, 7);
//            String duration = s.substring(8);
//            sb.append(dayOfWeeks(s.substring(0, 1))).append(": с ")
//                    .append(time).append(" до ").append(getEndTime(time, duration));
//            list.add(sb.toString());
//        }
//        return list;
//    }
//
//    private static String dayOfWeeks(String day) {
//        List<String> daysOfWeek = new ArrayList<>(List.of("Понедельник",
//                "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"));
//        return daysOfWeek.get(Integer.parseInt(day) - 1);
//    }

//    private static String getEndTime(String time, String duration) {
//        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
//        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
//        Date startTime = new Date();
//        Date durationTime = new Date();
//        try {
//            startTime = timeFormat.parse(time);
//            durationTime = timeFormat.parse(duration);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        long sum = startTime.getTime() + durationTime.getTime();
//        return timeFormat.format(new Date(sum));
//    }
}
