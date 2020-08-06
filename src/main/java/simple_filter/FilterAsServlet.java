package simple_filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/filter-as-servlet")
public class FilterAsServlet implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        out.write("Это simple_filter.FilterAsServlet.<br>");
        filterChain.doFilter(req, resp);
        out.write("Выход simple_filter.FilterAsServlet.<br>");
    }

    @Override
    public void destroy() {
    }
}
