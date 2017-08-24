<%@ page import="by.zhukdi.library.beans.Genre" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu col-lg-3">
    <h3 class="menu_header">Genres</h3>
    <nav class="bg-faded sidebar">
        <ul class="nav nav-pills flex-column">
            <jsp:useBean id="genreList" class="by.zhukdi.library.beans.GenreList" scope="application"/>
            <li class="nav-item"><a class="nav-link" href="books.jsp?genre_id=0">All books</a></li>
            <%
                for (Genre genre : genreList.getGenreList()) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="books.jsp?genre_id=<%=genre.getId()%>&name=<%=genre.getName()%>"><%=genre.getName()%></a>
            </li>
            <%}%>
        </ul>
    </nav>
</div>