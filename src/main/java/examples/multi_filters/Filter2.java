package examples.multi_filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.io.PrintWriter;

//@WebFilter("/multi-filter")
public class Filter2 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter2.init");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        PrintWriter out = resp.getWriter();
        out.write("Привет от examples.multi_filters.Filter2!<br>");
        filterChain.doFilter(req, resp);
        out.write("Пока examples.multi_filters.Filter2.<br>");
    }

    @Override
    public void destroy() {
    }
}
