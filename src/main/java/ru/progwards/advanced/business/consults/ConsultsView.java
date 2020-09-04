package ru.progwards.advanced.business.consults;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/consults-view")
public class ConsultsView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Map<String, List<AllConsults>> consults = getAllConsults();

        req.getRequestDispatcher("/consults/consults-view.jsp").forward(req, resp);
    }

    private Map<String, List<AllConsults>> getAllConsults() {
        List<AllConsults> list;
        List<DataBase.Consultations.Consultation> consultations = new ArrayList<>();
        for (DataBase.Consultations.Consultation consultation : DataBase.INSTANCE.consultations.getAll()) {

        }

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
