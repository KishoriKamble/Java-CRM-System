<%@ page import="java.util.*, com.crm.dao.TaskDAO, com.crm.model.Task" %>
<%
    List<Task> tasks = new TaskDAO().getAllTasks();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tasks</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2a9d8f;
            margin-bottom: 25px;
        }

        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2a9d8f;
            color: white;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #e76f51;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            color: #264653;
            font-weight: 500;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Task List</h2>
    <table>
        <tr>
            <th>Task ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Due Date</th>
            <th>Assigned To</th>
            <th>Related Customer</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <% for(Task t : tasks) { %>
            <tr>
                <td><%= t.getTaskId() %></td>
                <td><%= t.getTitle() %></td>
                <td><%= t.getDescription() %></td>
                <td><%= t.getDueDate() %></td>
                <td><%= t.getAssignedTo() %></td>
                <td><%= t.getRelatedCustomer() %></td>
                <td><%= t.getStatus() %></td>
                <td>
                    <a href="updateTask.jsp?id=<%= t.getTaskId() %>">Edit</a> |
                    <a href="deleteTask?id=<%= t.getTaskId() %>" onclick="return confirm('Delete this task?')">Delete</a>
                </td>
            </tr>
        <% } %>
    </table>

    <a class="back-link" href="index.jsp">Back to Dashboard</a>
</body>
</html>
