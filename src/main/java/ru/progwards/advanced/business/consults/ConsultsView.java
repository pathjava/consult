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

@WebServlet("/consults-view")
public class ConsultsView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map<String, List<AllConsults>> future = getAllConsultations(true);
        Map<String, List<AllConsults>> past = getAllConsultations(false);
        req.setAttribute("future", future);
        req.setAttribute("past", past);
        req.getRequestDispatcher("/consults/consults-view.jsp").forward(req, resp);
    }

    private Map<String, List<AllConsults>> getAllConsultations(boolean b) {
        Map<String, List<AllConsults>> map = new LinkedHashMap<>();
        List<AllConsults> list = new ArrayList<>();
        List<DataBase.Consultations.Consultation> consultations = b ? getFutureListConsultations() : getPastListConsultations();

        for (DataBase.Consultations.Consultation item : consultations) {
            String mentorName = Utils.getMentorName(item.mentor);
            String nameAndDate = mentorName + " - " + Utils.getStartDate(item.start);
            String startEndTime = " с " + Utils.getStartMoscowTime(item.start)
                    + " до " + Utils.getEndMoscowTime(item.start, item.duration);
            if (!map.containsKey(nameAndDate))
                list = new ArrayList<>();
            list.add(new AllConsults(item.mentor, mentorName, item.start, startEndTime, item.student));
            map.put(nameAndDate, list);
        }
        return map;
    }

    private List<DataBase.Consultations.Consultation> getFutureListConsultations() {
        return DataBase.INSTANCE.consultations.getAll()
                .stream().filter(p -> p.start > Utils.getTimeNow())
                .sorted(Comparator.comparing(DataBase.Consultations.Consultation::getStart)
                        .thenComparing(DataBase.Consultations.Consultation::getMentor))
                .collect(Collectors.toList());
    }

    private List<DataBase.Consultations.Consultation> getPastListConsultations() {
        return DataBase.INSTANCE.consultations.getAll()
                .stream().filter(p -> p.start < Utils.getTimeNow())
                .sorted(Comparator.comparing(DataBase.Consultations.Consultation::getStart)
                        .thenComparing(DataBase.Consultations.Consultation::getMentor))
                .collect(Collectors.toList());
    }

    public static class AllConsults {
        public final String mentor;
        public final String mentorName;
        public final long start;
        public final String startEndTime;
        public final String student;

        private AllConsults(String mentor, String mentorName, long start, String startEndTime, String student) {
            this.mentor = mentor;
            this.mentorName = mentorName;
            this.start = start;
            this.startEndTime = startEndTime;
            this.student = student;
        }

        public String getMentor() {
            return mentor;
        }

        public String getMentorName() {
            return mentorName;
        }

        public long getStart() {
            return start;
        }

        public String getStartEndTime() {
            return startEndTime;
        }

        public String getStudent() {
            return student;
        }
    }
}
