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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/consults-add")
public class ConsultsAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//
//        if (session.getAttribute("login") == null) {
//            session.setAttribute("targetUrl", req.getRequestURI());
//            req.getRequestDispatcher("/login").forward(req, resp);
//            return;
//        }

        String loginMentor = req.getParameter("login");

        List<DataBase.Consultations.Consultation> consultations = getFutureConsultations(loginMentor);
        consultations.sort(Comparator.comparing(DataBase.Consultations.Consultation::getStart));

        req.setAttribute("login", loginMentor);
        req.setAttribute("name", getMentorName(loginMentor));
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

    private static String getMentorName(String loginMentor) {
        List<DataBase.Users.User> mentors = Utils.getMentors();
        for (DataBase.Users.User mentor : mentors) {
            if (mentor.login.equals(loginMentor))
                return mentor.name;
        }
        return null;
    }
}
