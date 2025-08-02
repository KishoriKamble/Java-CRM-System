<%@ page import="com.crm.dao.TaskDAO, com.crm.model.Task" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Task task = new TaskDAO().getAllTasks().stream().filter(t -> t.getTaskId() == id).findFirst().orElse(null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Task</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f4f6;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2a9d8f;
            margin-bottom: 30px;
        }

        form {
            width: 400px;
            margin: 0 auto;
            background: white;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #2a9d8f;
            color: white;
            padding: 12px 18px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            width: 100%;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #21867a;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #264653;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>✏️ Update Task</h2>
    <form action="updateTask" method="post">
        <input type="hidden" name="task_id" value="<%= task.getTaskId() %>"/>

        <label>Title:</label>
        <input type="text" name="title" value="<%= task.getTitle() %>" required/>

        <label>Description:</label>
        <input type="text" name="description" value="<%= task.getDescription() %>" required/>

        <label>Due Date:</label>
        <input type="date" name="due_date" value="<%= task.getDueDate() %>" required/>

        <label>Assigned To (User ID):</label>
        <input type="number" name="assigned_to" value="<%= task.getAssignedTo() %>" required/>

        <label>Related Customer:</label>
        <input type="number" name="related_customer" value="<%= task.getRelatedCustomer() %>" required/>

        <label>Status:</label>
        <input type="text" name="status" value="<%= task.getStatus() %>" required/>

        <input type="submit" value="Update Task"/>
    </form>

    <a class="back-link" href="viewTasks.jsp">⬅️ Back to Task List</a>
</body>
</html>
