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

        String loginMentor = req.getParameter("selectMentor");
        int dayOfWeek = Integer.parseInt(req.getParameter("selectDay"));
        long startTime = Utils.getTime(req.getParameter("timeStart"));
        long durationTime = Utils.getTime(req.getParameter("timeDuration"));

        if (loginMentor == null) {
            req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (loginMentor.isEmpty()) {
            req.setAttribute("error-description", "Название параметра должно быть установлено!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit"))) {
            int currentDayOfWeek = Integer.parseInt(req.getParameter("currentDayOfWeek"));
            long currentTimeStart = Long.parseLong(req.getParameter("currentTimeStart"));
            DataBase.Schedule.Key key = new DataBase.Schedule.Key(loginMentor, currentDayOfWeek, currentTimeStart);
            DataBase.INSTANCE.schedule.remove(key);
        }

        if (!DataBase.INSTANCE.schedule.put(new DataBase.Schedule.Value(loginMentor, dayOfWeek, startTime, durationTime))) {
            req.setAttribute("error-description", "Не удалось добавить настройку! Вероятно, она уже существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/schedule-view");
    }
}
