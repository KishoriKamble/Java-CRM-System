<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRM Sign Up</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e0eafc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .signup-form {
            background-color: #ffffff;
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 380px;
        }

        .signup-form h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .signup-form input,
        .signup-form select {
            width: 100%;
            padding: 10px 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .signup-form input:focus,
        .signup-form select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 4px rgba(0, 123, 255, 0.3);
        }

        .signup-form input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signup-form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .note {
            font-size: 13px;
            color: #888;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="signup-form">
    <h2>CRM Sign Up</h2>
    <form action="SignUpServlet" method="post">
        <input type="text" name="username" placeholder="Enter Username" required />
        <input type="password" name="password" placeholder="Enter Password" required />
        <select name="role" required>
            <option value="">-- Select Role --</option>
            <option value="admin">Admin</option>
            <option value="user">User</option>
        </select>
        <input type="submit" value="Register" />
    </form>
    <div class="note">Already have an account? Ask Admin for access.</div>
</div>
</body>
</html>
