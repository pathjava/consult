package ru.progwards.advanced.business.consults;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.*;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.stream.Collectors;

public class ConsultsGenerator {

    private static final long durationSlotTime = Utils.getTime(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);
    private static long st;

    private void slotGenerator() throws IOException {

        List<DataBase.Schedule.Value> schedules
                = DataBase.INSTANCE.schedule.getAll().stream()
                .filter(schedule -> schedule.day_of_week == getCurrentDayOfWeek())
                .collect(Collectors.toList());

        if (schedules.size() > 0){
            for (DataBase.Schedule.Value schedule : schedules) {
                long slotTime = schedule.start;
                st = schedule.start; //TODO for test
                System.out.println("start " + slotTime); //TODO for test
                long endTime = endConsultationsTime(schedule.duration);
                System.out.println("duration " + schedule.duration); //TODO for test
                while (slotTime < endTime) {
                    String mentorLogin = schedule.mentor;
                    long startSlotTime = getStartSlotTime(slotTime);
                    String studentLogin = "";
                    String commentText = "";
                    DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(mentorLogin,
                            startSlotTime, durationSlotTime, studentLogin, commentText));
                }
            }
        }

    }

    private long endConsultationsTime(long duration) {
        return 0;
    }

    private long getStartSlotTime(long slotTime) {
        return 0;
    }

    private int getCurrentDayOfWeek(){
        LocalDateTime now = LocalDateTime.now();
        return now.getDayOfWeek().getValue();
    }



    public static void main(String[] args) {
        ConsultsGenerator generator = new ConsultsGenerator();
        System.out.println(generator.getCurrentDayOfWeek());
        try {
            generator.slotGenerator();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(durationSlotTime);

        System.out.println("--------------");
        long now = LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        System.out.println(now);
        System.out.println("--------------");

        SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd/HH:mm");
        System.out.println(timeFormat.format(new Date(now)));
        System.out.println("--------------");

        LocalDateTime now1 = LocalDateTime.now();
        System.out.println(now1.with(LocalTime.MIDNIGHT));

        System.out.println("--------------");
        LocalDate today = LocalDate.now(ZoneId.systemDefault());
        LocalDateTime startOfDay = LocalDateTime.of(today, LocalTime.MIDNIGHT);
        System.out.println(startOfDay);

        System.out.println("--------------");
        LocalDateTime now2 = LocalDateTime.now().with(LocalTime.MIDNIGHT);
        long ll = Timestamp.valueOf(now2).getTime();
        System.out.println(now2);
        System.out.println(ll);

        System.out.println("--------------");
        LocalDateTime triggerTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(ll), ZoneId.systemDefault());
        LocalDateTime triggerTime2 = LocalDateTime.ofInstant(Instant.ofEpochMilli(ll + st), ZoneId.systemDefault());

        System.out.println(triggerTime);
        System.out.println(triggerTime2);
    }

}
