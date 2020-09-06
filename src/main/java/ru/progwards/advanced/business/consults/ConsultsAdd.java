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

        boolean isRemoveUser = "true".equals(req.getParameter("deletesUser"));
        boolean isRemoveMentor = "true".equals(req.getParameter("deletesMentor"));
        String loginMentor = req.getParameter("login");
        long startTime = Long.parseLong(req.getParameter("time"));
        long duration = Utils.getTime(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);
        String loginStudent = (String) session.getAttribute("login");
        String comment = isRemoveUser || isRemoveMentor ? "" : req.getParameter("comment");

        if (!checkExistMentor(loginMentor)) {
            req.setAttribute("error-description", "Наставник с логином " + loginMentor + " не существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (isRemoveUser || isRemoveMentor) {
            String loginStudentRemoveSlot = req.getParameter("loginStudentRemoveSlot");
            if (loginStudentRemoveSlot.isEmpty()) {
                req.setAttribute("error-description", "Нет информации для удаления, слот не занят!");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
        }

        if ((!isRemoveUser && !isRemoveMentor) && DataBase.INSTANCE.users.findKey(loginStudent).is_mentor) {
            req.setAttribute("error-description", "Наставник не может записываться на консультацию!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if ((!isRemoveUser && !isRemoveMentor) && loginMentor.equals(loginStudent)) {
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
        if (!checkingKeyExistence(req, resp, key)) return;

        if (isRemoveUser || isRemoveMentor) {
            String path = isRemoveUser ? "/users-view?login=" + loginStudent : "/consults-view";
            loginStudent = "";
            comment = "";
            removeOldAndPutNew(loginMentor, startTime, duration, loginStudent, comment, key);
            resp.sendRedirect(path);
            return;
        }

        if (DataBase.INSTANCE.consultations.findKey(key).student.equals("")) {
            removeOldAndPutNew(loginMentor, startTime, duration, loginStudent, comment, key);
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

    private void removeOldAndPutNew(String loginMentor, long startTime,
                                    long duration, String loginStudent, String comment,
                                    DataBase.Consultations.Key key) throws IOException {
        DataBase.INSTANCE.consultations.remove(key);
        DataBase.INSTANCE.consultations.put(new DataBase.Consultations.Consultation(loginMentor,
                startTime, duration, loginStudent, comment));
    }

    public boolean checkingKeyExistence(HttpServletRequest req, HttpServletResponse resp,
                                        DataBase.Consultations.Key key) throws ServletException, IOException {
        if (!DataBase.INSTANCE.consultations.exists(key)) {
            req.setAttribute("error-description", "Данный слот записи на консультацию отсутствует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return false;
        }
        return true;
    }

    private static boolean checkExistMentor(String loginMentor) {
        return DataBase.INSTANCE.users.exists(loginMentor) && DataBase.INSTANCE.users.findKey(loginMentor).is_mentor;
    }

    private static List<DataBase.Consultations.Consultation> getFutureConsultations(String login) {
        return DataBase.INSTANCE.consultations.getAll().stream()
                .filter(consultation -> consultation.mentor.equals(login)
                        && consultation.start > Utils.getTimeNow()).collect(Collectors.toList());
    }

    private static Map<String, List<ConsultationsForAdd>> getConsultations(String loginMentor) {
        Map<String, List<ConsultationsForAdd>> map = new LinkedHashMap<>();
        List<ConsultationsForAdd> list = new ArrayList<>();
        List<DataBase.Consultations.Consultation> consultations = getFutureConsultations(loginMentor).stream()
                .sorted(Comparator.comparing(DataBase.Consultations.Consultation::getStart))
                .collect(Collectors.toList());

        String temp = "";
        for (DataBase.Consultations.Consultation item : consultations) {
            String startDayWeekAndDate = Utils.getStartDayWeek(item.start)
                    + " - " + Utils.getStartDate(item.start);
            if (!temp.equals(startDayWeekAndDate)) {
                list = new ArrayList<>();
                temp = startDayWeekAndDate;
            }
            String startTime = Utils.getStartMoscowTime(item.start);
            list.add(new ConsultationsForAdd(item.mentor, item.start, startTime, item.duration, item.student, item.comment));
            map.put(startDayWeekAndDate, list);
        }
        return map;
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
