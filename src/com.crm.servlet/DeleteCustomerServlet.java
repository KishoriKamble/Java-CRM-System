package com.crm.servlet;

import com.crm.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {

    private final CustomerDAO dao = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int customerId = Integer.parseInt(request.getParameter("id"));
            dao.deleteCustomer(customerId); // Just call method, no return value expected
        } catch (Exception e) {
            e.printStackTrace(); // Optional: log error
        }

        response.sendRedirect("viewCustomers");
    }
}
