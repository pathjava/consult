package ru.progwards.advanced.business.utils;

import ru.progwards.java2.lib.DataBase;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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
