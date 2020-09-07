package ru.progwards.advanced.business.schedules;

import ru.progwards.advanced.business.utils.Utils;
import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule-save")
public class ScheduleSave extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String mentor = req.getParameter("mentor");
        int day_of_week = Integer.parseInt(req.getParameter("day_of_week"));
        long start = Utils.getTime(req.getParameter("timeStart"));
        long duration = Utils.getTime(req.getParameter("duration"));

        if (mentor == null) {
            req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (mentor.isEmpty()) {
            req.setAttribute("error-description", "Название параметра должно быть установлено!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit"))) {
            day_of_week = Integer.parseInt(req.getParameter("day_of_week"));
            start = Long.parseLong(req.getParameter("start"));
            DataBase.Schedule.Key key = new DataBase.Schedule.Key(mentor, day_of_week, start);
            DataBase.INSTANCE.schedule.remove(key);
        }

        if (!DataBase.INSTANCE.schedule.put(new DataBase.Schedule.Value(mentor, day_of_week, start, duration))) {
            req.setAttribute("error-description", "Не удалось добавить настройку! Вероятно, она уже существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/schedule-view");
    }
}
