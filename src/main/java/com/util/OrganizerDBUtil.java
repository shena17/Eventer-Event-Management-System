package com.util;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import com.model.User;

public class OrganizerDBUtil {
	
	public static Connection con = null;
	public static Statement stmt = null;
	public static ResultSet rs = null;
	public static boolean isSuccess;
	

	public static boolean insertOrganizer(String fname, String Laname, String email, String nic, String username, String password) throws SQLException {
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		String sql = "INSERT INTO `oop`.`users` (`FirstName`, `LastName`, `Email`, `NIC`, `Type`, `Username`, `Password`, `Status` ) VALUES ('"+fname+"', '"+Laname+"', '"+email+"', '"+nic+"', 'organizer', '"+username+"', '"+password+"', 'Approved')";
			
		/////read // ResultSet rs = stmt.executeQuery(sql);
		
		//execute query.. Insert data
		int result = stmt.executeUpdate(sql);
		
		if(result == 1) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
	}
	
	//public static List<User> getDetails(){return null;}
}
