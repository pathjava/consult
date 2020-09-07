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

@WebServlet("/consults-edit")
public class ConsultsEdit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String student = req.getParameter("student");
        String mentor = req.getParameter("mentor");
        long start = Long.parseLong(req.getParameter("start"));
        boolean edit = "true".equals(req.getParameter("edit"));

        if (!edit) {
            Map<String, List<Utils.ConsultationsForAdd>> consultationsEdit = Utils.getConsultations(mentor);

            req.setAttribute("student", student);
            req.setAttribute("start", start);
            req.setAttribute("mentor", mentor);
            req.setAttribute("consultationsEdit", consultationsEdit);
            req.getRequestDispatcher("/consults/consults-edit.jsp").forward(req, resp);
        } else { //TODO - подумать о необходимости проверок
            String comment = "";
            long duration = Utils.getTime(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);
            long oldStart = Long.parseLong(req.getParameter("oldStart"));
            String oldStudent = "";

            DataBase.Consultations.Key oldKey = new DataBase.Consultations.Key(mentor, oldStart);
            Utils.removeOldAndPutNew(mentor, oldStart, duration, oldStudent, comment, oldKey);

            DataBase.Consultations.Key key = new DataBase.Consultations.Key(mentor, start);
            Utils.removeOldAndPutNew(mentor, start, duration, student, comment, key);

            resp.sendRedirect("/consults-view");
        }
    }
}
