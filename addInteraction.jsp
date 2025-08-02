<%@ page import="java.util.*, com.crm.dao.CustomerDAO, com.crm.dao.UserDAO, com.crm.model.Customer, com.crm.model.User" %>
<%
    List<Customer> customers = new CustomerDAO().getAllCustomers();
    List<User> users = new ArrayList<>(); // Add getAllUsers() if needed later
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Interaction</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f2f4f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background: #ffffff;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #555;
            font-weight: 600;
        }

        input[type="number"],
        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 15px;
            background-color: #fafafa;
        }

        textarea {
            resize: vertical;
            height: 80px;
        }

        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Interaction</h2>
        <form action="addInteraction" method="post">

           <label>Interaction ID:</label>
           <input type="number" name="interaction_id">

            <label>Customer ID:</label>
            <input type="number" name="customer_id" required>

            <label>User ID:</label>
            <input type="number" name="user_id" required>

            <label>Type:</label>
            <input type="text" name="type" required>

            <label>Date:</label>
            <input type="date" name="interaction_date" required>

            <label>Notes:</label>
            <textarea name="notes"></textarea>

            <input type="submit" value="Add Interaction">
        </form>

        <p style="text-align:center; margin-top: 10px;">
            📋 <a href="viewInteractions" >View All Interactions</a>
        </p>
    </div>
</body>
</html>
