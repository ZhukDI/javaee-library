package by.zhukdi.library.beans;

import by.zhukdi.library.db.Database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;

public class AuthorList {
    private ArrayList<Author> authorList = new ArrayList<>();

    public ArrayList<Author> getAuthorList() {
        Statement statement = null;
        ResultSet resultSet = null;
        Connection connection = null;
        try {
            connection = Database.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM library.author");
            while (resultSet.next()) {
                Author author = new Author();
                author.setName(resultSet.getString("fio"));
                authorList.add(author);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
        }
//          finally {
//            try {
//                if (statement!=null) statement.close();
//                if (resultSet!=null) resultSet.close();
//                if (connection !=null) connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
        return authorList;
    }
}

