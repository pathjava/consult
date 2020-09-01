package ru.progwards.advanced.business.consults;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/consults-add")
public class ConsultsAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginMentor = req.getParameter("login");

        Map<String, List<ConsultationsForAdd>> consultations = getConsultations(loginMentor);

        req.setAttribute("login", loginMentor);
        req.setAttribute("name", getMentorName(loginMentor));
        req.setAttribute("consultations", consultations);
        req.getRequestDispatcher("/consults/consults-add.jsp").forward(req, resp);
    }

    private static List<DataBase.Consultations.Consultation> getFutureConsultations(String login) {
        //TODO не отбирать слоты, если на момент выборки они уже просрочены по времени
        long startDayAndTime = getStartConsultationsDayAndTime();
        return DataBase.INSTANCE.consultations.getAll().stream()
                .filter(consultation -> consultation.mentor.equals(login) &&
                        consultation.start >= startDayAndTime).collect(Collectors.toList());
    }

    private static long getStartConsultationsDayAndTime() {
        return Timestamp.valueOf(LocalDateTime.now().with(LocalTime.MIDNIGHT)).getTime();
    }

    private static String getMentorName(String loginMentor) {
        List<DataBase.Users.User> mentors = Utils.getMentors();
        for (DataBase.Users.User mentor : mentors) {
            if (mentor.login.equals(loginMentor))
                return mentor.name;
        }
        return null;
    }

    private static Map<String, List<ConsultationsForAdd>> getConsultations(String loginMentor) {
        Map<String, List<ConsultationsForAdd>> map = new LinkedHashMap<>();
        List<ConsultationsForAdd> list = new ArrayList<>();
        List<DataBase.Consultations.Consultation> consultations = getFutureConsultations(loginMentor);
        consultations.sort(Comparator.comparing(DataBase.Consultations.Consultation::getStart));

        String temp = "";
        for (DataBase.Consultations.Consultation elem : consultations) {
            String startDayTime = getStartDayTime(elem.start);
            if (!temp.equals(startDayTime)) {
                list = new ArrayList<>();
                temp = startDayTime;
            }
            String startTime = getStartTime(elem.start);
            list.add(new ConsultationsForAdd(elem.mentor, elem.start, startTime, elem.duration, elem.student, elem.comment));
            map.put(startDayTime, list);
        }
        return map;
    }

    private static String getStartDayTime(long start) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE - dd.MM.yyyy");
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(start), ZoneId.of("Europe/Moscow"));
        return ldt.format(formatter);
    }

    private static String getStartTime(long start) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(start), ZoneId.of("Europe/Moscow"));
        return ldt.format(formatter);
    }

    public static class ConsultationsForAdd {
        public final String mentor;
        public final long start;
        public final String startTime;
        public final long duration;
        public final String student;
        public final String comment;

        private ConsultationsForAdd(String mentor, long start, String startTime,
                                    long duration, String student, String comment) {
            this.mentor = mentor;
            this.start = start;
            this.startTime = startTime;
            this.duration = duration;
            this.student = student;
            this.comment = comment;
        }

        public String getStartTime() {
            return startTime;
        }

        public String getMentor() {
            return mentor;
        }

        public long getStart() {
            return start;
        }

        public long getDuration() {
            return duration;
        }

        public String getStudent() {
            return student;
        }

        public String getComment() {
            return comment;
        }
    }
}