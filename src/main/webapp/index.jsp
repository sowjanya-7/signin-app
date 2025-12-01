<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: arial blue;
        /*background:url("https://images.unsplash.com/photo-1503264116251-35a269479413");*/
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        text-align: center;
        padding: 40px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    h1 {
        margin-bottom: 25px;
        color: #333;
        font-size: 26px;
    }

    a.signup-btn {
        display: inline-block;
        text-decoration: none;
        padding: 12px 25px;
        background: #4A90E2;
        color:blue;
        font-size: 18px;
        font-weight: bold;
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    a.signup-btn:hover {
    background: linear-gradient(135deg, #2575fc, #6a11cb);
    color: #fff;
        
    }
</style>

</head>
<body>
<a class="signup-btn" href="<%=request.getContextPath()%>/signup">Signup Here</a>
</body>
</html>