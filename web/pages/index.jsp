<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library</title>
    <link href="css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="main">
        <div class="content">
            <p class="title">
                <img class="logo" src="images/books.png">
            </p>
            <p class="title">Онлайн библиотека</p>
            <div class="text">
                <p>Добро пожаловать в онлайн библиотеку, где вы сможете найти любую книгу на ваш вкус.</p>
                <p>Доступны функции поиска, просмотра, сортировки и многие другие.</p>
            </div>
        </div>

        <div class="login_div">
            <p class="title">Для входа введите свои данные:</p>
            <form class="login_form" name="username" action="pages/main.jsp" method="post">
                <input type="text" name="username" value="" placeholder="Имя">
                <input type="submit" value="Войти">
            </form>
        </div>

        <div class="footer">
            Разработчик: Жук Дмитрий, 2017 г
        </div>
    </div>
</body>
</html>