package by.zhukdi.library.beans;

import by.zhukdi.library.db.Database;
import by.zhukdi.library.enums.SearchType;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookList {
    private ArrayList<Book> bookList = new ArrayList<>();

    public ArrayList<Book> getBooks(String str) {
        Statement statement= null;
        ResultSet resultSet = null;
        Connection connection = null;
        try {
            connection = Database.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(str);
            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getLong("id"));
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setPageCount(resultSet.getInt("page_count"));
                book.setPublishDate(resultSet.getInt("publish_year"));
                book.setPublisher(resultSet.getString("publisher"));
                book.setAuthor(resultSet.getString("author"));
                book.setImage(resultSet.getBytes("image"));
                bookList.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookList.class.getName()).log(Level.SEVERE, null, ex);
        }
//          finally {
//            try {
//                if (statement!=null) statement.close();
//                if (resultSet!=null) resultSet.close();
//                if (connection !=null) connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(BookList.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
        return bookList;
    }

    public ArrayList<Book> getBookList() {
        if (!bookList.isEmpty()) {
            return bookList;
        } else {
            return getBooks("select * from book order by name");
        }
    }

    public ArrayList<Book> getAllBooks() {
        return getBooks("select b.id,b.name,b.isbn,b.page_count,b.publish_year, p.name as publisher, "
                + "a.fio as author, g.name as genre, b.image from book b inner join author a on b.author_id=a.id "
                + "inner join genre g on b.genre_id=g.id inner join publisher p on b.publisher_id=p.id order by b.name");
    }

    public ArrayList<Book> getBooksByGenre(long id) {
        if (id == 0) {
            return getAllBooks();
        } else {
            return getBooks("select b.id,b.name,b.isbn,b.page_count,b.publish_year, p.name as publisher, a.fio as author, g.name as genre, b.image from book b "
                    + "inner join author a on b.author_id=a.id "
                    + "inner join genre g on b.genre_id=g.id "
                    + "inner join publisher p on b.publisher_id=p.id "
                    + "where genre_id=" + id + " order by b.name "
                    + "limit 0,5");
        }
    }

    public ArrayList<Book> getBookListBySearch(String searchStr, SearchType type) {
        StringBuilder sql = new StringBuilder("select b.id,b.name,b.isbn,b.page_count,b.publish_year, p.name as publisher, a.fio as author, g.name as genre, b.image from book b "
                + "inner join author a on b.author_id=a.id "
                + "inner join genre g on b.genre_id=g.id "
                + "inner join publisher p on b.publisher_id=p.id ");

        if (type == SearchType.AUTHOR) {
            sql.append("where lower(a.fio) like '%" + searchStr.toLowerCase() + "%' order by b.name ");

        } else if (type == SearchType.TITLE) {
            sql.append("where lower(b.name) like '%" + searchStr.toLowerCase() + "%' order by b.name ");
        }
        sql.append("limit 0,5");


        return getBooks(sql.toString());
    }
}
