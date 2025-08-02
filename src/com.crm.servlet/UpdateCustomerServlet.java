package com.crm.servlet;
import com.crm.dao.CustomerDAO;
import com.crm.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateCustomer")
public class UpdateCustomerServlet extends HttpServlet {

    private final CustomerDAO dao = new CustomerDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));  // ✅ Matches hidden input name
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String company = request.getParameter("company");
        int addedBy = Integer.parseInt(request.getParameter("addedBy")); // ✅ Matches form name

        Customer customer = new Customer(id, name, email, phone, address, company, addedBy);
        dao.updateCustomer(customer);

        response.sendRedirect("viewCustomers");
    }
}
