package settings;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet("/settings/settings-view")
public class SettingsView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DataBase.Settings.Record> settings = new ArrayList<>(DataBase.INSTANCE.settings.getAll());
        settings.sort(Comparator.comparing(o -> o.name));

        req.setAttribute("settings", settings);
        req.getRequestDispatcher("/settings/settings-view.jsp").forward(req, resp);
    }

}
