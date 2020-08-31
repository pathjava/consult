package ru.progwards.advanced.business.consults;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.*;
import java.util.List;
import java.util.stream.Collectors;

public class ConsultsGenerator {

    private static final long durationSlotTime = Utils.getTime(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);

    private void slotGenerator() throws IOException {
        List<DataBase.Schedule.Value> schedules
                = DataBase.INSTANCE.schedule.getAll().stream()
                .filter(schedule -> schedule.day_of_week == getCurrentDayOfWeek())
                .collect(Collectors.toList());

        if (schedules.size() > 0) {
            for (DataBase.Schedule.Value schedule : schedules) {
                long startConsultationsTime = getStartConsultationsTime(schedule.start);
                long endConsultationsTime = startConsultationsTime + schedule.duration;
                long slotTime = startConsultationsTime;

                while (slotTime < endConsultationsTime) {
                    String mentorLogin = schedule.mentor;
                    String studentLogin = "";
                    String commentText = "";
                    DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(mentorLogin,
                            slotTime, durationSlotTime, studentLogin, commentText)); //TODO сделать проверку существования такого слота
                    slotTime = getStartSlotTime(slotTime);
                }
            }
        }
    }

    private long getStartConsultationsTime(long start) {
//        LocalDateTime midnight = LocalDateTime.now().with(LocalTime.MIDNIGHT);
        LocalDateTime midnight = LocalDateTime.now().with(LocalTime.MIDNIGHT).plusDays(1); //TODO для теста, рабочая на строку выше
        return Timestamp.valueOf(midnight).getTime() + start;
    }

    private long getStartSlotTime(long slotTime) {
        return slotTime + durationSlotTime;
    }

    private int getCurrentDayOfWeek() {
        return LocalDateTime.now().getDayOfWeek().getValue();
    }


    public static void main(String[] args) {
        ConsultsGenerator generator = new ConsultsGenerator();
        try {
            generator.slotGenerator();
        } catch (IOException e) {
            e.printStackTrace();
        }

//        System.out.println(generator.getCurrentDayOfWeek());
//        System.out.println(durationSlotTime);
//        System.out.println("-------время начала-------");
//        SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd/HH:mm");
//        LocalDateTime midnight = LocalDateTime.now().with(LocalTime.MIDNIGHT);
//        long midnightSeconds = Timestamp.valueOf(midnight).getTime();
//        LocalDateTime triggerTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(midnightSeconds), ZoneId.systemDefault());
//        System.out.println(midnightSeconds);
//        System.out.println(triggerTime);
//        System.out.println(timeFormat.format(new Date(midnightSeconds)));
    }

}
