package settings;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/settings/settings-save")
public class SettingsSave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String value = req.getParameter("value");
        if (name == null || value == null) {
            req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (name.isEmpty()) {
            req.setAttribute("error-description", "Название параметра должно быть установлено.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.settings.remove(name);

        if (!DataBase.INSTANCE.settings.put(new DataBase.Settings.Record(name, value))) {
            req.setAttribute("error-description", "Не удалось добавить настройку. Вероятно, она уже существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/settings/settings-view");
    }
}
