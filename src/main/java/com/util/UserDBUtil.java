package com.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess;
	
	
	//Validate user from login
	public static boolean loginUser(String uname, String pwd) throws SQLException {
		
		 try {
			 con = DBConfig.getConnection();
			 stmt = con.createStatement();
			 
			 String sql = "SELECT * FROM oop.users WHERE Username = '"+uname+"' AND Password = '"+pwd+"'";
			 
			 rs = stmt.executeQuery(sql);
			 
			 if(rs.next()) {
				 isSuccess = true;
			 }else {
				 isSuccess = false;
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		
		return isSuccess;
	}
	
	//Retrieve data 
	public static List<User> getUserDetails(String username){
		
		ArrayList<User> details = new ArrayList<>();
		
		try {
			con = DBConfig.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * from oop.users u, oop.user_contact c where u.uid = c.uid and Username = '"+username+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt("UID");
				String fname = rs.getString("FirstName");
				String lname = rs.getString("LastName");
				String email = rs.getString("Email");
				String nic = rs.getString("NIC");
				String type = rs.getString("Type");
				String phone = rs.getString("ContactNo");
				String uname = rs.getString("Username");
				
				User user = new User(id, fname, lname, email, nic, type, phone, uname);
				
				details.add(user);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return details;
	}
	
	
	//Add user
	public static boolean insertUser(String fname, String lname, String nic, String contact, String email, String username, String password) throws SQLException {
		
		isSuccess = false;
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		String sql = "INSERT INTO `oop`.`users` (`FirstName`, `LastName`, `Email`, `NIC`, `Type`, `Username`, `Password`) VALUES ('"+fname+"', '"+lname+"', '"+email+"', '"+nic+"', 'customer', '"+username+"', '"+password+"')";
	
		int result = stmt.executeUpdate(sql);
		
		if(result == 1) {
			
			int id = getId(username);
			
			sql = "INSERT INTO `oop`.`user_contact` (`UID`, `ContactNo`) VALUES ('"+id+"', '"+contact+"')";
			
			result = stmt.executeUpdate(sql);
			
			if(result == 1) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
		
	}
	
	//Update user
		public static boolean updateUser(String fname, String lname, String nic, String contact, String email, String username) throws SQLException {
			
			isSuccess = false;
			
			int id = getId(username);
			
			con =  DBConfig.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE `oop`.`users` SET `FirstName` = '"+fname+"', `LastName` = '"+lname+"', `Email` = '"+email+"', `NIC` = '"+nic+"', `Type` = 'customer' WHERE (`UID` = '"+id+"')";
		
			int result = stmt.executeUpdate(sql);
			
			if(result == 1) {	
				
				sql = "UPDATE `oop`.`user_contact` SET `ContactNo` = '"+contact+"' WHERE (`UID` = '"+id+"')";
				
				result = stmt.executeUpdate(sql);
				
				if(result == 1) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
				
			}else {
				isSuccess = false;
			}
			
			return isSuccess;
			
		}

		
		//Delete user
		public static boolean deleteUser(String username) throws SQLException {
			
			int uid = getId(username);
			
			String sql = "DELETE FROM `oop`.`user_contact` WHERE (`UID` = '"+uid+"')";

			int result = stmt.executeUpdate(sql);
						
			if(result == 1) {
				
				sql = "DELETE FROM `oop`.`users` WHERE (`UID` = '"+uid+"')";
				
				result = stmt.executeUpdate(sql);
				
				if(result == 1) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
				
			}else {
				isSuccess = false;
			}
				
			return isSuccess;
		}
		
		
		//Reset Password
		public static boolean resetPwd(String username, String password) throws SQLException {
			
			con = DBConfig.getConnection();
			stmt = con.createStatement();
			
			boolean isExisting = isExisting(username);
			
			if(isExisting == true) {
				
				int id = getId(username);
				
				String sql = "UPDATE `oop`.`users` SET `Password` = '"+password+"' WHERE (`UID` = '"+id+"')";
				
				int result = stmt.executeUpdate(sql);
				
				if(result == 1) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
				
			}else {
				isSuccess = false;
			}
			
			return isSuccess;
		}
		
		
		//Check whether the username exists
		public static boolean isExisting(String username) throws SQLException{
			
			con = DBConfig.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM oop.users where Username = '"+username+"'";
			
			rs = stmt.executeQuery(sql);
			
			isSuccess = false;
						
			while(rs.next()) {
				isSuccess = true;
			}
			
			return isSuccess;
		}
		
		
		//Get user ID		
		public static int getId(String username) throws SQLException {
			int uid = 0;
			
			con = DBConfig.getConnection();
			
			stmt = con.createStatement();
			
			String sql = "SELECT UID FROM oop.users WHERE (Username = '"+username+"')";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				uid = rs.getInt("UID");
			}
			
			return uid;
		}
		
		//Get type
		public static String getType(String username) throws SQLException {
			String type = null;
			
			con = DBConfig.getConnection();
			
			stmt = con.createStatement();
			
			String sql = "SELECT Type FROM oop.users WHERE (Username = '"+username+"')";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				type = rs.getString("Type");
			}
			
			return type;
		}
		
}
