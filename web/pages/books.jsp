<%@ page import="by.zhukdi.library.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%request.setCharacterEncoding("UTF-8");

    long genreId = 0L;

    try {
        genreId = Long.valueOf(request.getParameter("genre_id"));
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>

<jsp:useBean id="bookList" class="by.zhukdi.library.beans.BookList" scope="page"/>

<div class="container">
    <div class="row">
        <%@include file="../WEB-INF/jspf/left_menu.jspf"%>
        <div class="main col-lg-9">
            <h3>${param.name}</h3>
            <div class="row">
                <%
                    ArrayList<Book> list = bookList.getBooksByGenre(genreId);
                    session.setAttribute("currentBookList", list);
                    for (Book book : list) {
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card">
                        <img class="card-img-top img-fluid" src="<%=request.getContextPath()%>/ShowImage?index=<%=list.indexOf(book) %>" alt="Обложка"/>
                        <div class="card-block">
                            <h4 class="card-title" style="color:#378de5 ;font-weight: bold; font-size: 15px; height: 32px;"><a><%=book.getName()%></a></h4>
                            <p class="card-text"><strong>ISBN:</strong> <%=book.getIsbn()%></p>
                            <p class="card-text"><strong>Издательство:</strong> <%=book.getPublisher()%></p>
                            <p class="card-text"><strong>Количество страниц:</strong> <%=book.getPageCount()%></p>
                            <p class="card-text"><strong>Год издания:</strong> <%=book.getPublishDate()%></p>
                            <p class="card-text"><strong>Автор:</strong> <%=book.getAuthor()%></p>
                            <div class="card-footer">
                                <small class="text-muted"><a href="#">Читать</a></small>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div> <!-- /container -->
