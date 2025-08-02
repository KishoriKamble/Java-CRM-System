package com.crm.servlet;

import com.crm.dao.UserDAO;
import com.crm.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.getUserByUsernameAndPassword(username, password);

       /* if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("username", username);

            // 👇 Redirect based on role
            if ("admin".equalsIgnoreCase(user.getRole())) {
                res.sendRedirect(req.getContextPath() + "/index.jsp");
               // res.sendRedirect("dashboard.jsp");

            } /*else {
                res.sendRedirect("userDashboard.jsp");
            }
        } else {
            req.getSession().setAttribute("error", "Invalid username or password");
            res.sendRedirect("login.jsp");

        }*/
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("username", username);

            if ("admin".equalsIgnoreCase(user.getRole())) {
                res.sendRedirect(req.getContextPath() + "/index.jsp"); // Admin home
            } else {
                res.sendRedirect(req.getContextPath() + "/index.jsp"); // User home
            }
        } else {
            req.getSession().setAttribute("error", "Invalid username or password");
            res.sendRedirect("login.jsp");
        }


    }
}

