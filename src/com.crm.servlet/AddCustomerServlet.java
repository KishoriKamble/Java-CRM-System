package com.crm.servlet;

import com.crm.model.Customer;
import com.crm.dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {

    private final CustomerDAO dao = new CustomerDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String company = request.getParameter("company_name");
        int addedBy = Integer.parseInt(request.getParameter("added_by_user"));

        Customer customer = new Customer(name, email, phone, address, company, addedBy);
        dao.addCustomer(customer);

        response.sendRedirect("viewCustomers");
    }
}
