<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
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

    /* Container for the form */
    .signin-container {
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 350px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333333;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        text-align: left;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .error {
        color: red;
        margin-bottom: 10px;
    }

    p {
        margin-top: 20px;
    }

    a {
        color: #007BFF;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

<script>
    function validate() {
      var e = document.forms["signinForm"]["email"].value.trim();
      var p = document.forms["signinForm"]["password"].value;
      if (!e) { document.getElementById("err").innerText = "Email required."; return false; }
      if (!p) { document.getElementById("err").innerText = "Password required."; return false; }
      return true;
    }
</script>
</head>
<body>

<div class="signin-container">
<h2>Sign In</h2>

<div class="error" id="err">
  <%
    String serverError = (String) request.getAttribute("error");
    if (serverError != null) {
  %>
    <div><%= serverError %></div>
  <%
    }
  %>
</div>

<form name="signinForm" method="post" action="<%=request.getContextPath()%>/signin" onsubmit="return validate();">
  <label>Email:</label>
  <input type="text" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"/>

  <label>Password:</label>
  <input type="password" name="password"/>

  <input type="submit" value="Sign In"/>
</form>

<p>New user? <a href="<%=request.getContextPath()%>/signup">Sign up here</a></p>
</div>

</body>
</html>
