package ru.progwards.advanced.business.user;

import ru.progwards.java2.lib.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/user-delete")
public class UserDelete extends HttpServlet {

    private static final String FILE_DIRECTORY = "avatars";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> users = Collections.list(req.getParameterNames());

        if (users.size() != 1) {
            req.setAttribute("error-description", "Хакер? Неправильное число параметров!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        String imageName = DataBase.INSTANCE.users.findKey(users.get(0)).image;

        if (DataBase.INSTANCE.users.remove(users.get(0)) == null) { //TODO - сделать удаление аватара вместе с пользователем
            req.setAttribute("error-description", "Не удалось удалить элемент. Вероятно, он уже не существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            DataBase.INSTANCE.users.readAll();
            return;
        }
        /* удаление аватарки удаленного пользователя */
        if (!imageName.isEmpty())
            deleteImage(imageName);

        resp.sendRedirect("/users-view");
    }

    private void deleteImage(String imageName) {
        String imagePath = getServletContext().getRealPath("") + File.separator + FILE_DIRECTORY + File.separator + imageName;
        File file = new File(imagePath);
        if (file.delete())
            System.out.println("file deleted!!");
    }
}
