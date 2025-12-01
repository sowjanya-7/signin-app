<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background: #d9ecff;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .signup-container {
        width: 400px;
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: left;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
        font-size: 26px;
    }

    label {
        font-weight: bold;
        margin-top: 10px;
        display: block;
    }

    input {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #aaa;
        border-radius: 5px;
        font-size: 15px;
    }

    .signup-btn {
        width: 100%;
        margin-top: 18px;
        padding: 12px;
        background: #4A90E2;
        border: none;
        color: white;
        font-size: 17px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    .signup-btn:hover {
        background: #357bd8;
    }

    .signin-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #333;
    }

    .signin-link a {
        color: #0066cc;
        text-decoration: none;
    }

    .signin-link a:hover {
        text-decoration: underline;
    }
</style>

<script>
    function validateForm() {
      var username = document.forms["signupForm"]["username"].value.trim();
      var email = document.forms["signupForm"]["email"].value.trim();
      var password = document.forms["signupForm"]["password"].value;
      var confirm = document.forms["signupForm"]["confirm"].value;
      var err = "";

      var emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/;

      if (!username) err = "Username required.";
      else if (!email) err = "Email required.";
      else if (!emailRegex.test(email)) err = "Invalid email.";
      else if (password.length < 6) err = "Password must be at least 6 characters.";
      else if (password !== confirm) err = "Passwords do not match.";

      if (err) {
        document.getElementById("clientError").innerText = err;
        return false;
      }
      return true;
    }
</script>

</head>
<body>

<div class="signup-container">

    <h2>Signup</h2>

    <div style="color:red;text-align:center;">
      <span id="clientError"></span>
      <%
        String serverError = (String) request.getAttribute("error");
        if (serverError != null) {
      %>
        <div><%= serverError %></div>
      <%
        }
      %>
    </div>

    <form name="signupForm" method="post" action="signup" onsubmit="return validateForm();">

      <label>Username:</label>
      <input type="text" name="username"
             value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>"/>

      <label>Email:</label>
      <input type="text" name="email"
             value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"/>

      <label>Password:</label>
      <input type="password" name="password"/>

      <label>Confirm Password:</label>
      <input type="password" name="confirm"/>

      <button type="submit" class="signup-btn">Sign Up</button>

    </form>

    <div class="signin-link">
        Already registered? <a href="<%=request.getContextPath()%>/signin">Sign in here</a>
    </div>

</div>

</body>
</html>
