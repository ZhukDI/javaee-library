package by.zhukdi.library.beans;

import by.zhukdi.library.db.Database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GenreList {
    private ArrayList<Genre> genreList = new ArrayList<>();

    public ArrayList<Genre> getGenres() {
        Statement statement= null;
        ResultSet resultSet = null;
        Connection connection = null;
        try {
            connection = Database.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM library.genre");
            while (resultSet.next()) {
                Genre genre = new Genre();
                genre.setName(resultSet.getString("name"));
                genreList.add(genre);
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
        return genreList;
    }

    public ArrayList<Genre> getGenreList() {
        if (!genreList.isEmpty()) {
            return genreList;
        } else {
            return getGenres();
        }
    }
}
