package user;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users/users-info")
public class UserInfo extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login"); //TODO - сделать проверку, что логин состоит только из латинских букв
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        boolean is_mentor = "on".equals(req.getParameter("is_mentor"));
        String image = req.getParameter("image"); //TODO - указать путь для загрузки изображений и проверку расширения файла

//        if (name == null || login == null) {
//            req.setAttribute("error-description", "Хакер? Отсутствуют обязательные параметры.");
//            req.getRequestDispatcher("/error.jsp").forward(req, resp);
//            return;
//        }
//        if (name.isEmpty()) {
//            req.setAttribute("error-description", "Название параметра должно быть установлено.");
//            req.getRequestDispatcher("/error.jsp").forward(req, resp);
//            return;
//        }

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.users.remove(name);

        if (!DataBase.INSTANCE.users.put(new DataBase.Users.User(login, password, name, is_mentor, image))) {
            req.setAttribute("error-description", "Не удалось добавить настройку. Вероятно, она уже существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/users/users-info.jsp");
    }
}
