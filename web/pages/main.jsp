<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main</title>
</head>
<body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%= "Привет " + request.getParameter("username") %>
</body>
</html>
