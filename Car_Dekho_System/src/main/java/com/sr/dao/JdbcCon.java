package com.sr.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcCon {
	public static Connection getConnection()
	{
		Connection con=null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
	
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1539:orcl","college","Admin1");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
