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

@WebServlet("/user/user-delete")
public class UserDelete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> users = Collections.list(req.getParameterNames());
        //TODO - сделать запрос подтверждения перед удалением пользователя
        if (users.size() != 1) {
            req.setAttribute("error-description", "Хакер? Неправильное число параметров.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        if (DataBase.INSTANCE.users.remove(users.get(0)) == null) { //TODO - сделать удаление аватара вместе с пользователем
            req.setAttribute("error-description", "Не удалось удалить элемент. Вероятно, он уже не существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            DataBase.INSTANCE.users.readAll();
            return;
        }
        resp.sendRedirect("/user/users-info");
    }
}
