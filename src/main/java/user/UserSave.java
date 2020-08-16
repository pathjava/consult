package user;

import ru.progwards.java2.db.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;

@WebServlet("/user/user-save")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 2, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserSave extends HttpServlet {

    private static final String FILE_DIRECTORY = "avatars";
    private static String imageName;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login").trim();
        String password = req.getParameter("password");
        String name = req.getParameter("name").trim();
        boolean is_mentor = "on".equals(req.getParameter("is_mentor"));

        if (name.isEmpty() || login.isEmpty()) {
            req.setAttribute("error-description", "Параметр должен быть установлен.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (!isStringContainsLatinCharactersOnly(login)) {
            req.setAttribute("error-description", "Логин должен состоть только из латинских букв и цифр");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (password.length() < 8 || password.length() > 20) {
            req.setAttribute("error-description", "Длина пароля должна быть от 8 до 20 символов");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        /* загрузка аватара на сервер */
        String uploadPath = getServletContext().getRealPath("") + File.separator + FILE_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists())
            return; //TODO - сообщение об отсутствии директории

        for (Part part : req.getParts()) {
            if (part.getName().equals("image"))
                if (getFileName(part))
                    part.write(uploadPath + File.separator + imageName);
        }

        // при редактировании сперва удаляем и потом добавляем
        if ("true".equals(req.getParameter("edit")))
            DataBase.INSTANCE.users.remove(name);

        if (!DataBase.INSTANCE.users.put(new DataBase.Users.User(login, password, name, is_mentor, imageName))) {
            req.setAttribute("error-description", "Не удалось добавить пользователя. Вероятно, она уже существует.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/user/users-info");
    }

    private static boolean getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                String image = content.substring(content.indexOf("=") + 2, content.length() - 1);
                if (!image.isEmpty()) {
                    imageName = getDateTime() + image;
                    return true;
                }
            }
        }
        imageName = "";
        return false;
    }

    private static String getDateTime() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        return dtf.format(java.time.LocalDateTime.now()) + "_";
    }

    public static boolean isStringContainsLatinCharactersOnly(final String iStringToCheck) {
        return iStringToCheck.matches("^[a-zA-Z0-9.]+$");
    }
}
