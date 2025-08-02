package com.crm.servlet;

import com.crm.dao.InteractionDAO;
import com.crm.model.Interaction;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Timestamp;




@WebServlet("/addInteraction")
public class AddInteractionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String custIdStr = request.getParameter("customer_id");
        int customerId = (custIdStr != null && !custIdStr.isEmpty()) ? Integer.parseInt(custIdStr) : 0;

        String userIdStr = request.getParameter("user_id");
        int userId = (userIdStr != null && !userIdStr.isEmpty()) ? Integer.parseInt(userIdStr) : 0;

        String type = request.getParameter("type");
        Timestamp date = Timestamp.valueOf(request.getParameter("interaction_date") + " 00:00:00");
        String notes = request.getParameter("notes");

        // Pass 0 or use constructor without interactionId if available
        Interaction interaction = new Interaction(0, customerId, userId, type, date, notes);

        InteractionDAO dao = new InteractionDAO();
        dao.addInteraction(interaction);

        response.sendRedirect("addInteraction.jsp?success=true");
    }
}
