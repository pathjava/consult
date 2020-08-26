package consults;

import ru.progwards.java2.db.DataBase;

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

        String loginMentor = req.getParameter("mentorLogin");
        int dayOfWeek = Integer.parseInt(req.getParameter("dayOfWeek"));
        long startTime = Long.parseLong(req.getParameter("timeStart"));

        DataBase.Schedule.Key removeKey = new DataBase.Schedule.Key(loginMentor, dayOfWeek, startTime);

        if (loginMentor == null || dayOfWeek <= 0 || startTime <= 0) {
            req.setAttribute("error-description", "Хакер? Неправильные параметры!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (DataBase.INSTANCE.schedule.remove(removeKey) == null) {
            req.setAttribute("error-description", "Не удалось удалить элемент! Вероятно, он уже не существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            DataBase.INSTANCE.settings.readAll();
            return;
        }
        resp.sendRedirect("/schedule-view");
    }
}
