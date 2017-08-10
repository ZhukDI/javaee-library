package by.zhukdi.library.db;

import testjdbc.TestConnection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {

    private static Context context;
    private static Connection connection;
    private static DataSource dataSource;

    public static Connection getConnection() {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("jdbc/Library");
            if (connection == null) {
                connection = dataSource.getConnection();
            }

        } catch (SQLException | NamingException ex) {
            Logger.getLogger(TestConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return connection;
    }


}
