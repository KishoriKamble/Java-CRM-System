package com.crm.servlet;

import com.crm.dao.TaskDAO;
import com.crm.model.Task;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Date dueDate = Date.valueOf(request.getParameter("due_date"));
        int assignedTo = Integer.parseInt(request.getParameter("assigned_to"));
        int relatedCustomer = Integer.parseInt(request.getParameter("related_customer"));
        String status = request.getParameter("status");

        Task task = new Task(title, description, dueDate, assignedTo, relatedCustomer, status);
        new TaskDAO().addTask(task);

        response.sendRedirect("viewTasks.jsp");
    }
}
