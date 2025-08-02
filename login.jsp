<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>CRM - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            width: 300px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888;
        }

        button {
            width: 100%;
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
        }

        a {
            text-align: center;
            display: block;
            margin-top: 10px;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%
    String error = (String) session.getAttribute("error");
    if (error != null) {
%>
    <div class="error"><%= error %></div>
<%
        session.removeAttribute("error");
    }
%>

<form action="login" method="post">
    <h2 style="text-align: center;">Login to CRM</h2>
    <input type="text" name="username" placeholder="Username" required/>

    <div class="password-wrapper">
        <input type="password" name="password" placeholder="Password" id="password" required/>
        <span class="toggle-password" onclick="togglePassword()">👁️</span>
    </div>

    <button type="submit">Login</button>
    <a href="signup.jsp">Don't have an account? Sign Up</a>
</form>

<script>
    function togglePassword() {
        const pass = document.getElementById('password');
        pass.type = pass.type === 'password' ? 'text' : 'password';
    }
</script>

</body>
</html>
