package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    
    Connection con;

    public Connection open() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/g2airline";
            con = DriverManager.getConnection(url, "root", "");
            return con;
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }
}