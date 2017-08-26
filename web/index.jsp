<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
        
        <link rel="stylesheet" href="css/index.css">
        <!-- Bootstrap CSS -->
    </head>
    <body>
        <%session.invalidate(); %>
        <div class="container">
            
            <form class="form-signin" action="pages/main.jsp" method="post">
                <p class="headerLogo">
                    <img class="logo" src="images/books_100.png" alt="">
                </p>
                <h2 class="form-signin-heading">Please sign in</h2>
                <label for="Username" class="sr-only">Username</label>
                <input type="text" class="form-control" id="Username" placeholder="Username" name="username" aria-describedby="basic-addon1">
                <%--<label for="inputEmail" class="sr-only">Email address</label>--%>
                <%--<input type="email" id="inputEmail" class="form-control" name="username" placeholder="Email address" required autofocus>--%>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
    
        </div> <!-- /container -->

        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="node_modules/jquery/dist/jquery.min.js"></script>
        <script src="node_modules/tether/dist/js/tether.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    </body>
</html>