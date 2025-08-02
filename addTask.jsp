<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
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
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px 12px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #2a9d8f;
            outline: none;
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
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #21867a;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
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
<div class="form-container">
    <h2> Add New Task</h2>
   <form action="addTask" method="post">

        <label>Title:</label>
        <input type="text" name="title" required />

        <label>Description:</label>
        <input type="text" name="description" required />

        <label>Due Date:</label>
        <input type="date" name="due_date" required />

        <label>Assigned To (User ID):</label>
        <input type="number" name="assigned_to" required />

        <label>Related Customer (Customer ID):</label>
        <input type="number" name="related_customer" required />

        <label>Status:</label>
        <select name="status" required>
            <option value="Pending">Pending</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
        </select>

        <input type="submit" value="Add Task" />
    </form>

</div>
<a class="back-link" href="index.jsp"> Back to Dashboard</a>
</body>


</html>
