<%@ page import="java.util.*, com.crm.model.Interaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Interactions</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f1f6f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 40px;
            color: #2a2f45;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #00a8cc;
            color: #ffffff;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: #888;
        }

        .back-link {
            display: block;
            text-align: center;
            margin: 30px auto;
            text-decoration: none;
            color: #00a8cc;
            font-weight: bold;
            font-size: 16px;
            border: 2px solid #00a8cc;
            padding: 10px 20px;
            width: fit-content;
            border-radius: 6px;
            transition: 0.3s;
        }

        .back-link:hover {
            background-color: #00a8cc;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>All Interactions</h2>
    <table>
        <tr>
            <th>Interaction ID</th>
            <th>Customer ID</th>
            <th>User ID</th>
            <th>Type</th>
            <th>Date</th>
            <th>Notes</th>
        </tr>
        <%
            List<Interaction> interactions = (List<Interaction>) request.getAttribute("interactions");
            if (interactions != null && !interactions.isEmpty()) {
                for (Interaction i : interactions) {
        %>
        <tr>
            <td><%= i.getInteractionId() %></td>
            <td><%= i.getCustomerId() %></td>
            <td><%= i.getUserId() %></td>
            <td><%= i.getType() %></td>
            <td><%= i.getInteractionDate() %></td>
            <td><%= i.getNotes() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6" class="no-data">No interactions found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <a class="back-link" href="index.jsp"> Back to Dashboard</a>
</body>
</html>
