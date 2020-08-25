package consults;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/schedule-save")
public class ScheduleSave extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String loginMentor = req.getParameter("selectMentor");
        String dayOfWeek;
        String startTime;
        String durationTime;

        List<String> params = new ArrayList<>(req.getParameterMap().keySet());

        for (int i = 0; i < params.size(); i++) {
            if (params.get(i).startsWith("checkTrue")) {
                String day = req.getParameter(params.get(i));
                String time = req.getParameter(params.get(i + 1));
                String duration = req.getParameter(params.get(i + 2));
                if (time.isEmpty() || duration.isEmpty()) {
                    req.setAttribute("error-description", "Время начала или продолжительность консультации не заданы!");
                    req.getRequestDispatcher("/error.jsp").forward(req, resp);
                    return;
                }
                allParams.append(day).append(";").append(time).append(";").append(duration).append("|");
            }
        }

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
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.schedule.remove(loginMentor);

        if (!DataBase.INSTANCE.schedule.put(new DataBase.Schedule.Value(loginMentor, dayOfWeek, startTime, durationTime))) {
            req.setAttribute("error-description", "Не удалось добавить настройку! Вероятно, она уже существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/schedule-view");
    }

}
