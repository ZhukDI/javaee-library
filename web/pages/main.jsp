<%@ page import="by.zhukdi.library.beans.AuthorList" %>
<%@ page import="by.zhukdi.library.beans.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">

        <div class="header">
            <img class="logo" alt="Место для логотипа" src="../images/books.png" name="logo">
            <form class="search_form" name="search_form" method="POST">
                <img class="search_img" src="../images/search.png">
                <input type="text" name="search_String" value="" size="100" />
                <input type="submit" value="Поиск" name="search_button" />
                <select name="search_option">
                    <option>Название</option>
                    <option>Автор</option>
                </select>
            </form>
        </div>

        <div class="sidebar_left">
            <h4>Список авторов:</h4>
            <ul class="nav">
                <%
                    AuthorList authorList = new AuthorList();
                    for (Author author : authorList.getAuthorList()) {
                %>
                <li><a href="#"><%=author.getName()%></a></li>
                <%}%>
            </ul>
        </div>

        <div class="content">
        </div>

    </div>
</body>
</html>
