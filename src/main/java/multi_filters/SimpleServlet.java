package multi_filters;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/multi-filter")
public class SimpleServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse resp) throws IOException {
        resp.getWriter().write("<br><br>Это multi-filter.SimpleServlet<br><br>");
    }
}
