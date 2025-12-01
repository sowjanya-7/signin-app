<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.auth.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style>
    /* Body styling */
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: #f0f4f8;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* Container for content */
    .welcome-container {
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 400px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table, th, td {
        border: 1px solid #cccccc;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #007BFF;
        color: white;
    }

    .btn {
        padding: 10px 20px;
        background-color: #007BFF;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        margin: 5px;
        text-decoration: none;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<div class="welcome-container">
    <h2>Welcome, <%= user.getUsername() %>!</h2>

    <table>
        <tr>
            <th>Field</th>
            <th>Value</th>
        </tr>
        <tr>
            <td>Username</td>
            <td><%= user.getUsername() %></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><%= user.getEmail() %></td>
        </tr>
    </table>

    <form action="<%=request.getContextPath()%>/signout" method="post" style="display:inline-block;">
        <input type="submit" class="btn" value="Sign Out"/>
    </form>

    <!-- Back button -->
    <a href="javascript:history.back()" class="btn">Back</a>
</div>

</body>
</html>
