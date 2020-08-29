package ru.progwards.advanced.business.consults;

import ru.progwards.java2.lib.DataBase;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class ConsultsGenerator {

    private final long durationSlotTime = Long.parseLong(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);

    private void slotGenerator() throws IOException {

        List<DataBase.Schedule.Value> schedules
                = DataBase.INSTANCE.schedule.getAll().stream()
                .filter(schedule -> schedule.day_of_week == getCurrentDayOfWeek())
                .collect(Collectors.toList());

        if (schedules.size() > 0){
            for (DataBase.Schedule.Value schedule : schedules) {
                long slotTime = schedule.start;
                long endTime = endConsultationsTime(schedule.duration);
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
        DayOfWeek dow = now.getDayOfWeek();
        return dow.getValue();
    }



    public static void main(String[] args) {
        ConsultsGenerator generator = new ConsultsGenerator();
        System.out.println(generator.getCurrentDayOfWeek());
    }

}
