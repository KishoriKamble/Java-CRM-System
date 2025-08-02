<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.crm.dao.CustomerDAO, com.crm.model.Customer" %>
<%
    String idStr = request.getParameter("id");
    Customer c = null;

    if (idStr != null) {
        try {
            int id = Integer.parseInt(idStr);
            CustomerDAO dao = new CustomerDAO();
            c = dao.getCustomerById(id);
        } catch (Exception e) {
            c = null;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #264653;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input[type="submit"] {
            background-color: #2a9d8f;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #21867a;
        }

        .error-message {
            color: red;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>

<% if (c == null) { %>
    <div class="form-container">
        <p class="error-message">❌ Invalid or missing customer ID. Cannot load customer data.</p>
        <div style="text-align:center; margin-top: 20px;">
            <a href="viewCustomers.jsp" style="color:#2a9d8f; text-decoration:none;">⬅ Back to Customer List</a>
        </div>
    </div>
<% } else { %>

<div class="form-container">
    <h2>Update Customer</h2>
    <form action="updateCustomer" method="post">

        <input type="hidden" name="id" value="<%= c.getCustomer_id() %>" />

        <label>Name:</label>
        <input type="text" name="name" value="<%= c.getName() %>" required />

        <label>Email:</label>
        <input type="email" name="email" value="<%= c.getEmail() %>" required />

        <label>Phone:</label>
        <input type="text" name="phone" value="<%= c.getPhone() %>" required />

        <label>Address:</label>
        <input type="text" name="address" value="<%= c.getAddress() %>" />

        <label>Company:</label>
        <input type="text" name="company" value="<%= c.getCompany_name() %>" />

        <label>Added By:</label>
        <input type="number" name="addedBy" value="<%= c.getAdded_by_user() %>" required />

        <input type="submit" value="Update Customer" />
    </form>
</div>

<% } %>

</body>
</html>
