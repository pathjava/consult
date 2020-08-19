import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("true".equals(req.getParameter("logout"))) {
            req.getSession().invalidate();
            resp.sendRedirect("/login");
        }else
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}