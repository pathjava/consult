package consults;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/consults-save")
public class ConsultsSave extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String login = req.getParameter("mentorLogin");

        req.setAttribute("name", name);
        req.setAttribute("mentorLogin", login);
        req.getRequestDispatcher("/consults/consults-add.jsp").forward(req, resp);

    }
}
