package ru.progwards.advanced.business;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if ("true".equals(req.getParameter("logout"))) {
            req.getSession().invalidate();
            resp.sendRedirect("/login");
        } else if (session.getAttribute("login") != null) {
            resp.sendRedirect("/");
        } else
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}