<%@ page import="com.crm.dao.CustomerDAO, com.crm.model.Customer, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test DB Connection</title>
</head>
<body>
<%
    CustomerDAO dao = new CustomerDAO();

    // Insert a test customer
    boolean inserted = dao.addCustomer(
        new Customer("Test User", "test@example.com", "9876543210", "Test Address", "Test Company", 1)
    );
%>
<h2>Test DB Page</h2>
<p>
    Test insert:
    <strong><%= inserted ? "Success" : "Failed" %></strong>
</p>

<h3>Customer List:</h3>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Company</th>
        <th>Added By</th>
    </tr>
<%
    List<Customer> customers = dao.getAllCustomers();
    if (customers != null && !customers.isEmpty()) {
        for (Customer c : customers) {
%>
    <tr>
        <td><%= c.getCustomer_id() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getEmail() %></td>
        <td><%= c.getPhone() %></td>
        <td><%= c.getAddress() %></td>
        <td><%= c.getCompany_name() %></td>
        <td><%= c.getAdded_by_user() %></td>
    </tr>
<%
        }
    } else {
%>
    <tr><td colspan="7" align="center">No customers found.</td></tr>
<%
    }
%>
</table>
</body>
</html>
