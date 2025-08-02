<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .logout-btn {
            position: absolute;
            top: 10px;
            right: 10px; /* 👈 this is the key change */
            background-color: #f44336;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .content {
            margin-top: 60px;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- 🔗 Logout button at top-right -->
    <a href="logout.jsp" class="logout-btn">Logout</a>

    <!-- 👤 Welcome content -->
    <div class="content">
        <h2>Welcome, <%= username %>!</h2>
        <p>You are logged in as a <strong>user</strong>.</p>
    </div>
</body>
</html>
