import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/show")
public class Show extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("login");
        String password = req.getParameter("password");
        PrintWriter printWriter = resp.getWriter();
        printWriter.println(
                "<html> \n" +
                    "<head> \n" +
                        "<meta charset=\"utf-8\"> \n" +
                        "<title>Progwards пример текста</title> \n" +
                    "</head> \n" +
                    "<body> <div align='center' style=\"font-size:25px; color:green\"> \n" +
                        "Имя пользователя: " + username + " <br> " +
                        "Пароль: " + password +
                    "</body> \n" +
                "</html>");
    }
}
