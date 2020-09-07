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

@WebServlet("/consults-add")
public class ConsultsAdd extends HttpServlet {

    private static final int MAX_LENGTH_COMMENT = Utils.getMaxLengthComment();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        boolean isRemoveUser = "true".equals(req.getParameter("deletesUser"));
        boolean isRemove = "true".equals(req.getParameter("deletes"));
        boolean isRemoveMentor = "true".equals(req.getParameter("deletesMentor"));
        String mentor = req.getParameter("mentor");
        String tempStart = req.getParameter("start");
        long start;
        if (tempStart == null) {
            warningThatTimeIsNotSelected(req, resp);
            return;
        } else
            start = Long.parseLong(tempStart);
        long duration = Utils.getTime(DataBase.INSTANCE.settings.findKey("SLOT_TIME").value);
        String student = (String) session.getAttribute("login");
        String comment = isRemoveUser || isRemove || isRemoveMentor ? "" : req.getParameter("comment");

        if (student == null) {
            req.setAttribute("error-description", "Логин студента не может быть null!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (!checkExistMentor(mentor)) {
            req.setAttribute("error-description", "Наставник с логином " + mentor + " не существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if ((!isRemoveUser && !isRemove && !isRemoveMentor) && DataBase.INSTANCE.users.findKey(student).is_mentor) {
            req.setAttribute("error-description", "Наставник не может записываться на консультацию!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if ((!isRemoveUser && !isRemove && !isRemoveMentor) && mentor.equals(student)) {
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
        DataBase.Consultations.Key key = new DataBase.Consultations.Key(mentor, start);
        if (!checkingKeyExistence(req, resp, key)) return;

        if (isRemoveUser || isRemove || isRemoveMentor) {
            String path;
            if (isRemoveUser)
                path = "/users-view?login=" + student;
            else if (isRemove)
                path = "/consults-view";
            else
                path = "/users-view?login=" + mentor;
            student = "";
            comment = "";
            Utils.removeOldAndPutNew(mentor, start, duration, student, comment, key);
            resp.sendRedirect(path);
            return;
        }

        if (DataBase.INSTANCE.consultations.findKey(key).student.equals("")) {
            Utils.removeOldAndPutNew(mentor, start, duration, student, comment, key);
        } else {
            req.setAttribute("error-description", "Не удалось добавить запись на консультацию! Вероятно, она уже занята!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mentor = req.getParameter("mentor");

        Map<String, List<Utils.ConsultationsForAdd>> consultationsAdd = Utils.getConsultations(mentor);

        req.setAttribute("mentor", mentor);
        req.setAttribute("name", Utils.getMentorName(mentor));
        req.setAttribute("consultationsAdd", consultationsAdd);
        req.setAttribute("maxLengthComment", MAX_LENGTH_COMMENT);
        req.getRequestDispatcher("/consults/consults-add.jsp").forward(req, resp);
    }

    private void warningThatTimeIsNotSelected(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("error-description", "Время записи на консультацию не выбрано!");
        req.getRequestDispatcher("/error.jsp").forward(req, resp);
    }

    private boolean checkingKeyExistence(HttpServletRequest req, HttpServletResponse resp,
                                         DataBase.Consultations.Key key) throws ServletException, IOException {
        if (!DataBase.INSTANCE.consultations.exists(key)) {
            req.setAttribute("error-description", "Данный слот записи на консультацию отсутствует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return false;
        }
        return true;
    }

    private boolean checkExistMentor(String mentor) {
        return DataBase.INSTANCE.users.exists(mentor) && DataBase.INSTANCE.users.findKey(mentor).is_mentor;
    }
}
