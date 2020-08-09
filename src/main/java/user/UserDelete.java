package user;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/user/settings-delete")
public class UserDelete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> logins = Collections.list(req.getParameterNames());

        if (logins.size() != 1) {
            req.setAttribute("error-description", "Хакер? Неправильное число параметров.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (DataBase.INSTANCE.users.remove(logins.get(0)) == null) {
            req.setAttribute("error-description", "Не удалось удалить элемент. Вероятно, он уже не существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            DataBase.INSTANCE.users.readAll();
            return;
        }
        resp.sendRedirect("/users/user-info.jsp");
    }
}
