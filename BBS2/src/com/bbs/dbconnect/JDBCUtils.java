package com.bbs.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class JDBCUtils {

    private static Connection con;
    
    private static String driver = "com.mysql.jdbc.Driver";
    
    private static String url = "jdbc:mysql://localhost:3306/bbsdb";

    private static String user = "root";

    private static String password = "1234";
	
    
    //Load the driver and establish SQL connection.
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName(driver);
		
		con = DriverManager.getConnection(url,user,password);
		
		return con;
	}
	
	//Release the connection
	public static void release(Statement stmt,Connection con)
	{
		if(stmt != null)
		{
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			stmt = null;
		}
		if(con != null)
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = null;
		}
	}
	
	public static void release(ResultSet rs, Statement stmt, Connection con)
	{
		if(rs != null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		rs = null;
		release(stmt,con);
	}
}
