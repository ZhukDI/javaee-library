<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="../css/index.css">
    <!-- Bootstrap CSS -->
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String searchString = "";

        if (request.getParameter("search_string") != null) {
            searchString = request.getParameter("search_string");
        } else if (session.getAttribute("search_string") != null) {
            searchString = session.getAttribute("search_string").toString();
        } else {
            session.setAttribute("search_string", searchString);
        }

        if (request.getParameter("username") != null) {
            session.setAttribute("username", request.getParameter("username"));
        }
    %>
    <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
        <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#"><img src="../images/books_300.png" class="logo">Library</a>
        <%--<a class="navbar-brand" href="#">--%>
            <%--<img src="../images/books_300.png" width="30" height="30" class="d-inline-block align-top" alt="">--%>
            <%--Library--%>
        <%--</a>--%>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Help</a>
                </li>
            </ul>
            <span class="navbar-text">
                Hello <%=session.getAttribute("username")%>
            </span>
        </div>
    </nav>