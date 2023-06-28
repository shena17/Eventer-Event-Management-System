package com.util;

import java.sql.DriverManager;

import java.sql.Connection;

public class DBConfig {
	
	private static String url = "jdbc:mysql://localhost:3306/oop";
	private static String username = "root";
	private static String password = "shenal";
	
	private static Connection con;
	
	public static Connection getConnection() {
				
		try {
			
			//Register the driver
			Class.forName("com.mysql.jdbc.Driver");
			
			//Create connection
			con = DriverManager.getConnection(url, username, password);	
			
		}
		catch(Exception e){
			System.out.println("Database connection failed");
		}
		
		return con;
	}
}
