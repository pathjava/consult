package ru.progwards.advanced.business.consults;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/consults-add")
public class ConsultsAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("mentorName");
        String login = req.getParameter("mentorLogin");

        List<DataBase.Consultations.Consultation> consultations = getFutureConsultations(login);
        consultations.sort(Comparator.comparing(DataBase.Consultations.Consultation::getStart));

        req.setAttribute("name", name);
        req.setAttribute("login", login);
        req.setAttribute("consultations", consultations);
        req.getRequestDispatcher("/consults/consults-add.jsp").forward(req, resp);
    }

    private static List<DataBase.Consultations.Consultation> getFutureConsultations(String login) {
        long startDayAndTime = getStartConsultationsDayAndTime();
        return DataBase.INSTANCE.consultations.getAll().stream()
                .filter(consultation -> consultation.mentor.equals(login) &&
                        consultation.start >= startDayAndTime).collect(Collectors.toList());
    }

    private static long getStartConsultationsDayAndTime() {
        return Timestamp.valueOf(LocalDateTime.now().with(LocalTime.MIDNIGHT)).getTime();
    }
}
