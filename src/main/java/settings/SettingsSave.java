package settings;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/settings-save")
public class SettingsSave extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name;
        String value;
        boolean days = "true".equals(req.getParameter("daysSettings"));

        if (days) {
            name = req.getParameter("selectMentor");
            List<String> params = new ArrayList<>(req.getParameterMap().keySet());
            StringBuilder allParams = new StringBuilder();
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
            allParams.setLength(allParams.length() - 1);
            value = allParams.toString();
        } else {
            name = req.getParameter("name");
            value = req.getParameter("value");

            if (name == null || value == null) {
                req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры!");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
            if (name.isEmpty()) {
                req.setAttribute("error-description", "Название параметра должно быть установлено!");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
        }
        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.settings.remove(name);

        if (!DataBase.INSTANCE.settings.put(new DataBase.Settings.Record(name, value))) {
            req.setAttribute("error-description", "Не удалось добавить настройку! Вероятно, она уже существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/settings-view");
    }
}
