package ru.progwards.advanced.business.utils;

import ru.progwards.java2.lib.DataBase;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.*;
import java.util.stream.Collectors;

public class Utils {

    public static List<DataBase.Users.User> getMentors() {
        return DataBase.INSTANCE.users.getAll().stream()
                .filter(user -> user.is_mentor).collect(Collectors.toList());
    }

    public static Long getTime(String time) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm", new Locale("ru"));
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        Date parseTime = new Date();
        try {
            parseTime = timeFormat.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return parseTime.getTime();
    }

    public static String getStartDayTime(long start) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE - dd.MM.yyyy");
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(start), ZoneId.of("Europe/Moscow"));
        return ldt.format(formatter);
    }

    public static String getStartTime(long start) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(start), ZoneId.of("Europe/Moscow"));
        return ldt.format(formatter);
    }

    public static String getMentorName(String loginMentor) {
        List<DataBase.Users.User> mentors = Utils.getMentors();
        for (DataBase.Users.User mentor : mentors) {
            if (mentor.login.equals(loginMentor))
                return mentor.name;
        }
        return null;
    }

    public static String getStartAndEndTime(long start, long duration) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        String startTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(start),
                ZoneId.of("UTC")).format(formatter);
        String endTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(start + duration),
                ZoneId.of("UTC")).format(formatter);
        return " с " + startTime + " до " + endTime;
    }

    public static String getDayOfWeek(int day_of_week) {
        String day = DayOfWeek.of(day_of_week)
                .getDisplayName(TextStyle.FULL_STANDALONE, new Locale("ru"));
        return day.substring(0, 1).toUpperCase() + day.substring(1);
    }

    public static int getMinLengthPass() {
        return Integer.parseInt(DataBase.INSTANCE.settings.findKey("MIN_LENGTH_PASS").value);
    }

    public static int getMaxLengthPass() {
        return Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_PASS").value);
    }

    public static int getMinLengthLoginName() {
        return Integer.parseInt(DataBase.INSTANCE.settings.findKey("MIN_LENGTH_LOGIN_NAME").value);
    }

    public static int getMaxLengthLoginName() {
        return Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_LOGIN_NAME").value);
    }

    public static String getAvatarsDirectory() {
        return DataBase.INSTANCE.settings.findKey("AVATARS_DIRECTORY").value;
    }

    public static int getMaxLengthComment() {
        return Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_COMMENT").value);
    }

    public static long getTimeNow() {
        return Timestamp.valueOf(LocalDateTime.now()).getTime();
    }
}
