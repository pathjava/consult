package ru.progwards.advanced.business.consults;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/consults-edit")
public class ConsultsEdit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String student = req.getParameter("student");
        String mentor = req.getParameter("mentor");
        String startEndTime = req.getParameter("startEndTime");

        Map<String, List<ConsultationsForEdit>> consultationsEdit = getConsultations(mentor);

        req.setAttribute("student", student);
        req.setAttribute("startEndTime", startEndTime);
        req.setAttribute("consultationsEdit", consultationsEdit);
        req.getRequestDispatcher("/consults/consults-edit.jsp").forward(req, resp);
    }


    private static List<DataBase.Consultations.Consultation> getFutureConsultations(String login) {
        return DataBase.INSTANCE.consultations.getAll().stream()
                .filter(consultation -> consultation.mentor.equals(login)
                        && consultation.start > Utils.getTimeNow()).collect(Collectors.toList());
    }

    private static Map<String, List<ConsultationsForEdit>> getConsultations(String loginMentor) {
        Map<String, List<ConsultationsForEdit>> map = new LinkedHashMap<>();
        List<ConsultationsForEdit> list = new ArrayList<>();
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
            list.add(new ConsultationsForEdit(item.mentor, item.start, startTime, item.student, item.comment));
            map.put(startDayWeekAndDate, list);
        }
        return map;
    }

    public static class ConsultationsForEdit {
        public final String mentor;
        public final long start;
        public final String startTime;
        public final String student;
        public final String comment;

        private ConsultationsForEdit(String mentor, long start, String startTime,
                                    String student, String comment) {
            this.mentor = mentor;
            this.start = start;
            this.startTime = startTime;
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

        public String getStudent() {
            return student;
        }

        public String getComment() {
            return comment;
        }
    }
}
