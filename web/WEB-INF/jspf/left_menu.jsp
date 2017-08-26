<%@ page import="by.zhukdi.library.beans.Genre" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu col-lg-3">
    <h3 class="menu_header">Genres</h3>
    <nav class="bg-faded sidebar">
        <ul class="nav nav-pills flex-column">
            <jsp:useBean id="genreList" class="by.zhukdi.library.beans.GenreList" scope="application"/>
            <%
                long selectedGenreId = 0;

                if (request.getParameter("genre_id") != null) {
                    selectedGenreId = Long.valueOf(request.getParameter("genre_id"));
                } else if (session.getAttribute("genre_id") != null) {
                    selectedGenreId = Long.valueOf(session.getAttribute("genreId").toString());
                }

                session.setAttribute("genreId", selectedGenreId);
            %>
            <li class="nav-item"><a class="nav-link" href="books.jsp?genre_id=0">All books</a></li>
            <%
                for (Genre genre : genreList.getGenreList()) {
                    if(selectedGenreId != 0 && selectedGenreId == genre.getId()) {
            %>
            <li class="nav-item">
                <a class="nav-link" style="font-weight: bold;" href="books.jsp?genre_id=<%=genre.getId()%>&name=<%=genre.getName()%>"><%=genre.getName()%></a>
            </li>
            <%
                } else {
            %>
            <li class="nav-item">
                <a class="nav-link" href="books.jsp?genre_id=<%=genre.getId()%>&name=<%=genre.getName()%>"><%=genre.getName()%></a>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </nav>
</div>