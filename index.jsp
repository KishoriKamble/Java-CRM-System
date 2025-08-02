<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crm.model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRM Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #2b2d42;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            letter-spacing: 1px;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            padding: 30px;
            max-width: 1000px;
            margin: auto;
        }

        .card {
            background-color: white;
            border-radius: 12px;
            padding: 30px 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.07);
            text-align: center;
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card a {
            display: block;
            text-decoration: none;
            color: #2b2d42;
            font-size: 18px;
            font-weight: 600;
            margin-top: 10px;
        }

        .footer {
            text-align: center;
            font-size: 14px;
            color: #777;
            margin-top: 40px;
            padding-bottom: 20px;
        }

        .user-info {
            text-align: center;
            font-size: 16px;
            color: #444;
            margin-top: 10px;
        }

        .nav {
            text-align: center;
            margin: 15px 0;
        }

        .nav a {
            margin: 0 10px;
            color: #2b2d42;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="header">
    CRM System Dashboard
</div>

<div class="user-info">
    Logged in as: <strong><%= loggedInUser.getUsername() %></strong> (<%= loggedInUser.getRole() %>)
</div>

<div class="nav">
    <a href="logout.jsp">Logout</a>
</div>

<div class="container">
<div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px;">
    <div class="card">
        <a href="addCustomer.jsp">➕ Add Customer</a>
        <a href="viewCustomers">👥 View Customer</a>

    </div>
    <div class="card">
        <a href="addInteraction.jsp">💬 Add Interaction</a>
        <a href="viewInteractions">📞 View Interaction</a>

    </div>
    <div class="card">
        <a href="addLead.jsp">🧲 Add Lead</a>
        <a href="viewLeads.jsp">📊 View Leads</a>
    </div>
    <div class="card">
        <a href="addSale.jsp">💰 Add Sale</a>
        <a href="viewSales.jsp">📈 View Sales</a>
    </div>
    <div class="card">
        <a href="addTask.jsp">📝 Add Task</a>
        <a href="viewTasks.jsp">📅 View Tasks</a>
    </div>
</div>
</div>

<div class="footer">
    © 2025 CRM System. All rights reserved.
</div>

</body>
</html>
