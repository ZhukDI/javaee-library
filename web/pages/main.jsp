<%@ page import="by.zhukdi.library.beans.AuthorList" %>
<%@ page import="by.zhukdi.library.beans.Author" %>
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
        <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
            <button class="navbar-toggler navbar-toggler-right hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="../images/books_300.png" class="logo">Library</a>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
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
                <form class="form-inline mt-2 mt-md-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="menu col-3">
                    <h4 class="menu_header">Authors</h4>
                    <nav class="hidden-xs-down bg-faded sidebar">
                        <ul class="nav nav-pills flex-column">
                            <%
                                AuthorList authorList = new AuthorList();
                                for (Author author : authorList.getAuthorList()) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><%=author.getName()%></a>
                            </li>
                            <%}%>
                        </ul>
                    </nav>
                </div>
                <div class="main col-9"></div>
            </div>
    
        </div> <!-- /container -->

        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="../node_modules/jquery/dist/jquery.min.js"></script>
        <script src="../node_modules/tether/dist/js/tether.min.js"></script>
        <script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    </body>
</html>