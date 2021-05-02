
package watch_connection;

import java.sql.*;
public class connectionProvider {
    
    public static Connection getCon(){
        
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mywatch","root","");
            return con;
            
        } catch (Exception e) {
            
            e.printStackTrace();
            System.out.println(e);
            return null;
        }
    }
}
