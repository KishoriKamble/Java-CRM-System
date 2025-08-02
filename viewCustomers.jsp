<%@ page import="java.util.*, com.crm.model.Customer" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customerList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Customers</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #264653;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #2a9d8f;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f0f0f0;
        }

        a {
            text-decoration: none;
            color: #0077b6;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .actions a {
            margin-right: 8px;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            font-style: italic;
            color: #777;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            color: #2a9d8f;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2> Customer List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Company</th>
            <th>Added By</th>
            <th>Actions</th>
        </tr>

        <%
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
            <td class="actions">
                <a href="updateCustomer.jsp?id=<%= c.getCustomer_id() %>">Edit</a>

            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8" class="no-data">No customers found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <div style="text-align: center;">
        <a class="back-link" href="index.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
