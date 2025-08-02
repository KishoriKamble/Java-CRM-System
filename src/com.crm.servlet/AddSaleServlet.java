package com.crm.servlet;

import com.crm.dao.SaleDAO;
import com.crm.model.Sale;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/addSale")
public class AddSaleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = request.getParameter("status");
        Timestamp saleDate = new Timestamp(System.currentTimeMillis());

        Sale sale = new Sale(customerId, amount, saleDate, status);
        SaleDAO dao = new SaleDAO();
        dao.addSale(sale);

        response.sendRedirect("viewSales.jsp");
    }
}
