<%@ page import="com.crm.dao.SaleDAO, com.crm.model.Sale, java.util.List" %>
<%
    List<Sale> sales = new SaleDAO().getAllSales();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Sales</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f7f9fb;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #264653;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #e76f51;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back-link {
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            text-align: center;
            color: #e76f51;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2> Sales List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Status</th>
        </tr>
        <% for(Sale s : sales) { %>
        <tr>
            <td><%= s.getSaleId() %></td>
            <td><%= s.getCustomerId() %></td>
            <td><%= s.getAmount() %></td>
            <td><%= s.getSaleDate() %></td>
            <td><%= s.getStatus() %></td>
        </tr>
        <% } %>
    </table>

    <a class="back-link" href="index.jsp"> Back to Dashboard</a>
</body>
</html>
