package consults;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@WebServlet("/schedule-save")
public class ScheduleSave extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String loginMentor = req.getParameter("selectMentor");
        int dayOfWeek = Integer.parseInt(req.getParameter("selectDay"));
        long startTime = getTime(req.getParameter("timeStart"));
        long durationTime = getTime(req.getParameter("timeDuration"));

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

        DataBase.Schedule.Key key = new DataBase.Schedule.Key(loginMentor, dayOfWeek, startTime);

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.schedule.remove(key);

        if (!DataBase.INSTANCE.schedule.put(new DataBase.Schedule.Value(loginMentor, dayOfWeek, startTime, durationTime))) {
            req.setAttribute("error-description", "Не удалось добавить настройку! Вероятно, она уже существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/schedule-view");
    }

    private static Long getTime(String time) {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        Date parseTime = new Date();
        try {
            parseTime = timeFormat.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return parseTime.getTime();
    }
}
