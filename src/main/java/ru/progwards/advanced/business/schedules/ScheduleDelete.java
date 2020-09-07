package ru.progwards.advanced.business.schedules;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/schedule-delete")
public class ScheduleDelete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String mentor = req.getParameter("mentor");
        int day_of_week = Integer.parseInt(req.getParameter("day_of_week"));
        long start = Long.parseLong(req.getParameter("start"));

        DataBase.Schedule.Key key = new DataBase.Schedule.Key(mentor, day_of_week, start);

        if (mentor == null || day_of_week <= 0 || start <= 0) {
            req.setAttribute("error-description", "Хакер? Неправильные параметры!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (DataBase.INSTANCE.schedule.remove(key) == null) {
            req.setAttribute("error-description", "Не удалось удалить элемент! Вероятно, он уже не существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            DataBase.INSTANCE.settings.readAll();
            return;
        }
        resp.sendRedirect("/schedule-view");
    }
}
