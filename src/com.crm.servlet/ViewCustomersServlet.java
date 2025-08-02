package com.crm.servlet;

import com.crm.model.Customer;
import com.crm.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewCustomers")
public class ViewCustomersServlet extends HttpServlet {

    private final CustomerDAO dao = new CustomerDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Customer> customers = dao.getAllCustomers();
        request.setAttribute("customerList", customers);
        request.getRequestDispatcher("viewCustomers.jsp").forward(request, response);
    }
}
