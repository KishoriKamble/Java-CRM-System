package com.crm.servlet;

import com.crm.dao.UserDAO;
import com.crm.model.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User newUser = new User(username, password, role);
        boolean success = new UserDAO().addUser(newUser);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Error: Registration failed.");
        }
    }
}
