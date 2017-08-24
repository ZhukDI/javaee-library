<%@ page import="by.zhukdi.library.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="by.zhukdi.library.enums.SearchType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bookList" class="by.zhukdi.library.beans.BookList" scope="page"/>

<%
    request.setCharacterEncoding("UTF-8");

    ArrayList<Book> list = null;

    if (request.getParameter("genre_id") != null) {
        long genreId = Long.valueOf(request.getParameter("genre_id"));
        list = bookList.getBooksByGenre(genreId);
    } else if (request.getParameter("search_string") != null) {
        String searchStr = request.getParameter("search_string");
        SearchType type = SearchType.TITLE;
        if(request.getParameter("search_option").equals("Author")) {
            type = SearchType.AUTHOR;
        }

        if (searchStr != null && !searchStr.trim().equals("")) {
            list = bookList.getBookListBySearch(searchStr, type);
        }
    }
%>

<div class="container">
    <div class="row">

        <%@include file="../WEB-INF/jspf/search_form.jsp"%>

        <%@include file="../WEB-INF/jspf/left_menu.jsp"%>
        <div class="main col-lg-9">
            <h3>Найдено книг: <%=list.size()%></h3>
            <div class="row">
                <%
                    session.setAttribute("currentBookList", list);
                    for (Book book : list) {
                %>
                <div class="col-lg-6 col-md-6 mb-4">
                    <div class="row">
                        <div class="col-lg-5">
                            <img class="img-fluid" style="max-width: 100%; height: auto;" src="<%=request.getContextPath()%>/ShowImage?index=<%=list.indexOf(book) %>" alt="Обложка">
                        </div>
                        <div class="col-lg-7 info">
                            <h4 class="card-title" style="color:#378de5 ;font-weight: bold; font-size: 15px; height: 32px;"><a><%=book.getName()%></a></h4>
                            <p class="card-text"><strong>ISBN:</strong> <%=book.getIsbn()%></p>
                            <p class="card-text"><strong>Издательство:</strong> <%=book.getPublisher()%></p>
                            <p class="card-text"><strong>Количество страниц:</strong> <%=book.getPageCount()%></p>
                            <p class="card-text"><strong>Год издания:</strong> <%=book.getPublishDate()%></p>
                            <p class="card-text"><strong>Автор:</strong> <%=book.getAuthor()%></p>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div> <!-- /container -->
