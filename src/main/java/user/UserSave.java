package user;

import ru.progwards.java2.db.DataBase;
import ru.progwards.java2.db.IDbTable;

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
import java.util.HashSet;
import java.util.Set;

@WebServlet("/user-save")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserSave extends HttpServlet {

    private static final String FILE_DIRECTORY = "avatars";
    private static String imageName;
    private static String userPassword;
    private static final int minPass =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MIN_LENGTH_PASS").value);
    private static final int maxPass =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_PASS").value);
    private static final int minLoginName =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MIN_LENGTH_LOGIN_NAME").value);
    private static final int maxLoginName =
            Integer.parseInt(DataBase.INSTANCE.settings.findKey("MAX_LENGTH_LOGIN_NAME").value);

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login").trim();
        userPassword = req.getParameter("password");
        boolean needChangePassword = "true".equals(req.getParameter("needChangePassword"));
        String name = req.getParameter("name").trim();
        boolean is_mentor = "on".equals(req.getParameter("is_mentor"));
        String email = req.getParameter("email").trim(); //TODO min-max length
        String progwardsAccountLink = req.getParameter("progwardsAccountLink").trim();
        String discordName = req.getParameter("discordName").trim();

        boolean isEdit = "true".equals(req.getParameter("edit"));

        if (login.isEmpty()) {
            req.setAttribute("error-description", "Логин должен быть заполнен!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (login.length() > maxLoginName || login.length() < minLoginName) {
            req.setAttribute("error-description", "Логин должен быть больше от "
                    + minLoginName + " до " + maxLoginName + " символов!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (name.isEmpty()) {
            req.setAttribute("error-description", "Имя должно быть заполнено!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (name.length() > maxLoginName || name.length() < minLoginName) {
            req.setAttribute("error-description", "Имя должно быть от "
                    + minLoginName + " до " + maxLoginName + " символов!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (!isStringContainsLatinCharactersOnly(login)) {
            req.setAttribute("error-description", "Логин должен состоть только из латинских букв и цифр!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        if (!isEdit) {
            if (userPassword.length() < minPass || userPassword.length() > maxPass) {
                req.setAttribute("error-description", "Длина пароля должна быть от "
                        + minPass + " до " + maxPass + " символов!");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
        } else {
            if (!userPassword.isEmpty() && userPassword.length() < minPass || userPassword.length() > maxPass) {
                req.setAttribute("error-description", "Длина пароля должна быть от "
                        + minPass + " до " + maxPass + " символов!");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }
        }

        if (!userPassword.isEmpty())
            userPassword = IDbTable.hashSha256(userPassword);

        String uploadPath = getServletContext().getRealPath("") + File.separator + FILE_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            req.setAttribute("error-description", "Директория для загрузки аватарки отсутствует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        /* загрузка аватара на сервер */
        if (!uploadImageToServer(req, resp, uploadPath)) {
            req.setAttribute("error-description", "Ошибка загрузки изображения!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }

        /* при редактировании сперва удаляем и потом добавляем */
        if (isEdit) {
            checkUpdatePassword(login);
            checkUpdateImage(login);
            DataBase.INSTANCE.users.remove(login);
        }

        if (!DataBase.INSTANCE.users.put(new DataBase.Users.User(login, userPassword, needChangePassword,
                name, is_mentor, email, progwardsAccountLink, discordName, imageName))) {
            req.setAttribute("error-description", "Не удалось добавить пользователя. Вероятно, он уже существует!");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("/users-view");
    }

    private static boolean uploadImageToServer(HttpServletRequest req, HttpServletResponse resp, String uploadPath)
            throws IOException, ServletException {
        for (Part part : req.getParts()) {
            if (part.getName().equals("image"))
                if (getFileName(part))
                    if (checkExtensionImage())
                        part.write(uploadPath + File.separator + imageName);
                    else {
                        req.setAttribute("error-description",
                                "Разрешены только изображения с расширениями: jpeg, jpg, png, gif!");
                        req.getRequestDispatcher("/error.jsp").forward(req, resp);
                        return false;
                    }
        }
        return true;
    }

    private static boolean getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                String image = content.substring(content.indexOf("=") + 2, content.length() - 1).toLowerCase();
                if (!image.isEmpty()) {
                    imageName = getDateTime() + image;
                    return true;
                }
            }
        }
        imageName = "";
        return false;
    }

    /* текущая дата и время для добавления префиксом к имени аватарки */
    private static String getDateTime() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        return dtf.format(java.time.LocalDateTime.now()) + "_";
    }

    public static boolean isStringContainsLatinCharactersOnly(final String iStringToCheck) {
        return iStringToCheck.matches("^[a-zA-Z0-9.]+$");
    }

    private static boolean checkExtensionImage() {
        HashSet<String> extensions = new HashSet<>(Set.of("jpeg", "jpg", "png", "gif"));
        return extensions.contains(imageName.substring(imageName.lastIndexOf(".") + 1));
    }

    /* проверка существования уже ранее загруженного аватара при редактировании профиля */
    private static void checkUpdateImage(String login) {
        if (imageName.isEmpty()) {
            String image = DataBase.INSTANCE.users.findKey(login).image;
            if (image != null)
                imageName = image;
        }
    }

    private static void checkUpdatePassword(String login) {
        if (userPassword.isEmpty()) {
            String pass = DataBase.INSTANCE.users.findKey(login).password;
            if (!pass.isEmpty() || !pass.equals(""))
                userPassword = pass;
        }
    }
}
