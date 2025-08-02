package com.crm.servlet;

import com.crm.dao.InteractionDAO;
import com.crm.model.Interaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewInteractions")
public class ViewInteractionsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        InteractionDAO dao = new InteractionDAO();
        List<Interaction> interactions = dao.getAllInteractions();

        req.setAttribute("interactions", interactions);  // ✅ set in request scope
        req.getRequestDispatcher("viewInteractions.jsp").forward(req, res);  // ✅ forward to JSP
    }
}
