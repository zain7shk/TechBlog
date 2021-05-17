
package com.tech.blog.helper;
import java.sql.*;
public class connprovider {
    private static  Connection con;

    /**
     *
     * @return
     */
    public static Connection getConnection(){
        try{
            if(con==null)
            {
                            
            Class.forName("com.mysql.jdbc.Driver");
            
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","zainzn7","zainzn7");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
        
    }
}
