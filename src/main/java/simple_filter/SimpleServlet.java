package simple_filter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/filter-as-servlet")
public class SimpleServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse resp) throws IOException {
        resp.getWriter().write("<br><br>Это simple_filter.SimpleServlet<br><br>");
    }
}
