package ru.progwards.advanced.business.consults;

import ru.progwards.advanced.business.utils.Utils;

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String student = req.getParameter("student");
        String mentor = req.getParameter("mentor");
        String startEndTime = req.getParameter("startEndTime");

        Map<String, List<Utils.ConsultationsForAdd>> consultationsEdit = Utils.getConsultations(mentor);

        req.setAttribute("student", student);
        req.setAttribute("startEndTime", startEndTime);
        req.setAttribute("consultationsEdit", consultationsEdit);
        req.getRequestDispatcher("/consults/consults-edit.jsp").forward(req, resp);
    }
}
