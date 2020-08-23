package consults;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/consults")
public class Consults extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String login = req.getParameter("mentorLogin");

        req.setAttribute("name", name);
        req.setAttribute("mentorLogin", login);
        req.getRequestDispatcher("/consults/consults.jsp").forward(req, resp);

    }
}
