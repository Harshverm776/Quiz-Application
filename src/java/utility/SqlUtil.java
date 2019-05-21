/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author ELITE
 */

public class SqlUtil {
    
 private final static String DB_URL="jdbc:mysql://localhost:3306/";
 private final static String DB_NAME="web_minor";
 private final static String DB_UNM="root";
 private final static String DB_PASS="a";
 private final static String DRIVER="com.mysql.jdbc.Driver";
public static String user;
public static String type;
public static String sub_type;
public static String mail;
static Connection con;
 static Statement st;
 public static void connectDB()
 {
     try{
     Class.forName(DRIVER);
     con=DriverManager.getConnection(DB_URL+DB_NAME,DB_UNM,DB_PASS);
     st=con.createStatement();
     }catch(Exception ex)
     {
         System.out.println("Problem in connecting DB..");
     }
}

 public static void update(String query)
 {
     try{
     connectDB();
     st.executeUpdate(query);
     
     }catch(Exception ex)
     {
         
         System.out.println(""+ex);
        
     }
     
 }
 public static ResultSet retrieve(String query)
 {
     ResultSet rs=null;
     try{
     connectDB();
         rs=st.executeQuery(query);
    }catch(Exception ex)
     {
         System.out.println(""+ex);
     }
     return rs;
 }
 
 
 private static void close()
 {
     try{
         st.close();
         con.close();
     }catch(Exception ex)
     {
         System.out.println("Problem in creating data");
     }
    
 }
 
 
 
}
