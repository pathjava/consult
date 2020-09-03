package ru.progwards.advanced.business.consults;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/consults-add")
public class ConsultsAdd extends HttpServlet {

    private static final int MAX_LENGTH_COMMENT = Utils.getMaxLengthComment();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String loginMentor = req.getParameter("login");
        long startTime = Long.parseLong(req.getParameter("time"));
        long duration = Utils.getTime(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);
        String loginStudent = (String) session.getAttribute("login");
        String comment = req.getParameter("comment");

        if (loginStudent == null) {//TODO - возможно эту проверку можно сделать через фильтры?
            req.getRequestDispatcher("/login.jsp").forward(req, resp); //TODO - сделать редирект после авторизации обратно на страницу записи
            return;
        }

        if (!checkExistMentor(loginMentor)) {
            req.setAttribute("error-description", "Наставник с логином " + loginMentor + " не существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (DataBase.INSTANCE.users.findKey(loginStudent).is_mentor) {
            req.setAttribute("error-description", "Наставник не может записываться на консультацию!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (loginMentor.equals(loginStudent)) {
            req.setAttribute("error-description", "Нельзя записываться на консультацию к самому себе!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (comment.length() > MAX_LENGTH_COMMENT) {
            req.setAttribute("error-description", "Текст сообщения не может быть больше "
                    + MAX_LENGTH_COMMENT + " символов!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        // при добавлении записи на консультацию сперва проверяем и удаляем слот, и потом добавляем
        DataBase.Consultations.Key key = new DataBase.Consultations.Key(loginMentor, startTime);
        if (!DataBase.INSTANCE.consultations.exists(key)) {
            req.setAttribute("error-description", "Данный слот записи на консультацию отсутствует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (DataBase.INSTANCE.consultations.findKey(key).student.equals("")) {
            DataBase.INSTANCE.consultations.remove(key);
            DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(loginMentor,
                    startTime, duration, loginStudent, comment));
        } else {
            req.setAttribute("error-description", "Не удалось добавить запись на консультацию! Вероятно, она уже занята!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginMentor = req.getParameter("login");

        Map<String, List<ConsultationsForAdd>> consultations = getConsultations(loginMentor);

        req.setAttribute("login", loginMentor);
        req.setAttribute("name", Utils.getMentorName(loginMentor));
        req.setAttribute("consultations", consultations);
        req.setAttribute("maxLengthComment", MAX_LENGTH_COMMENT);
        req.getRequestDispatcher("/consults/consults-add.jsp").forward(req, resp);
    }

    private static boolean checkExistMentor(String loginMentor) {
        return DataBase.INSTANCE.users.exists(loginMentor) && DataBase.INSTANCE.users.findKey(loginMentor).is_mentor;
    }

    private static List<DataBase.Consultations.Consultation> getFutureConsultations(String login) {
        return DataBase.INSTANCE.consultations.getAll().stream()
                .filter(consultation -> consultation.mentor.equals(login)
                        && consultation.start > Utils.getTimeNow()).collect(Collectors.toList());
    }

//    private static String getMentorName(String loginMentor) {
//        List<DataBase.Users.User> mentors = Utils.getMentors();
//        for (DataBase.Users.User mentor : mentors) {
//            if (mentor.login.equals(loginMentor))
//                return mentor.name;
//        }
//        return null;
//    }

    private static Map<String, List<ConsultationsForAdd>> getConsultations(String loginMentor) {
        Map<String, List<ConsultationsForAdd>> map = new LinkedHashMap<>();
        List<ConsultationsForAdd> list = new ArrayList<>();
        List<DataBase.Consultations.Consultation> consultations = getFutureConsultations(loginMentor);
        consultations.sort(Comparator.comparing(DataBase.Consultations.Consultation::getStart));

        String temp = "";
        for (DataBase.Consultations.Consultation elem : consultations) {
            String startDayTime = Utils.getStartDayTime(elem.start);
            if (!temp.equals(startDayTime)) {
                list = new ArrayList<>();
                temp = startDayTime;
            }
            String startTime = Utils.getStartTime(elem.start);
            list.add(new ConsultationsForAdd(elem.mentor, elem.start, startTime, elem.duration, elem.student, elem.comment));
            map.put(startDayTime, list);
        }
        return map;
    }

//    private static String getStartDayTime(long start) {
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE - dd.MM.yyyy");
//        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(start), ZoneId.of("Europe/Moscow"));
//        return ldt.format(formatter);
//    }
//
//    private static String getStartTime(long start) {
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
//        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(start), ZoneId.of("Europe/Moscow"));
//        return ldt.format(formatter);
//    }

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
