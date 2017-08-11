package by.zhukdi.library.beans;

import by.zhukdi.library.db.Database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookList {
    private ArrayList<Book> bookList = new ArrayList<>();

    public ArrayList<Book> getBooks() {
        Statement statement= null;
        ResultSet resultSet = null;
        Connection connection = null;
        try {
            connection = Database.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM library.book");
            while (resultSet.next()) {
                Book book = new Book();
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setIsbn(resultSet.getString("isbn"));
                book.setPageCount(resultSet.getInt("page_count"));
                book.setPublishDate(resultSet.getDate("publish_date"));
                book.setPublisher(resultSet.getString("publisher"));
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
            return getBooks();
        }
    }
}
