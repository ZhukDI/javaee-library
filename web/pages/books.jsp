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
        <div class="main col-9">
            <h3>${param.name}</h3>
            <table cellpadding="30" style="font-size: 12px;">
            <%
                ArrayList<Book> list = bookList.getBooksByGenre(genreId);
                session.setAttribute("currentBookList", list);
                for (Book book : list) {
            %>
                <tr>
                    <td style="width:400px;height: 100px;">
                        <p style="color:#378de5 ;font-weight: bold; font-size: 15px;"> <%=book.getName()%></p>
                        <br><strong>ISBN:</strong> <%=book.getIsbn()%>
                        <br><strong>Издательство:</strong> <%=book.getPublisher() %>

                        <br><strong>Количество страниц:</strong> <%=book.getPageCount() %>
                        <br><strong>Год издания:</strong> <%=book.getPublishDate() %>
                        <br><strong>Автор:</strong> <%=book.getAuthor() %>
                        <p style="margin:10px;"> <a href="#">Читать</a></p>
                    </td>
                    <td style="width:150px;height: 100px;">
                        картинка
                        <img src="<%=request.getContextPath()%>/ShowImage?index=<%=list.indexOf(book) %>" height="250" width="190" alt="Обложка"/>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>
</div> <!-- /container -->
