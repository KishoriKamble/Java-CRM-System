<%@ page import="java.util.*, com.crm.dao.LeadDAO, com.crm.model.Lead" %>
<%
    List<Lead> leads = new LeadDAO().getAllLeads();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Leads</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
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
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #2a9d8f;
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
    <h2> Leads List</h2>
    <table>
        <tr>
            <th>Lead ID</th>
            <th>Customer ID</th>
            <th>Source</th>
            <th>Status</th>
            <th>Created At</th>
        </tr>
        <% for(Lead l : leads) { %>
            <tr>
                <td><%= l.getLeadId() %></td>
                <td><%= l.getCustomerId() %></td>
                <td><%= l.getSource() %></td>
                <td><%= l.getStatus() %></td>
                <td><%= l.getCreatedAt() %></td>
            </tr>
        <% } %>
    </table>
<a class="back-link" href="index.jsp"> Back to Dashboard</a>

</body>
</html>
