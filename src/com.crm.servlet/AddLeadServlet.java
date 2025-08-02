package com.crm.servlet;

import com.crm.dao.LeadDAO;
import com.crm.model.Lead;
import jakarta.servlet.annotation.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;


@WebServlet("/addLead")
public class AddLeadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        String source = request.getParameter("source");
        String status = request.getParameter("status");
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        Lead lead = new Lead(customerId, source, status, createdAt);
        LeadDAO dao = new LeadDAO();
        dao.addLead(lead);

        response.sendRedirect("viewLeads.jsp");
    }
}
