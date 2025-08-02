<%@ page import="com.crm.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head><title>Admin Dashboard</title></head>
<body>
    <h2>Welcome Admin: <%= user.getUsername() %></h2>
    <a href="logout.jsp">Logout</a>
</body>
</html>
