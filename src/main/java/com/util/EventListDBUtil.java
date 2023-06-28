package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Event;

public class EventListDBUtil {

	
	public static Connection con = null;
	public static Statement stmt = null;
	public static ResultSet rs = null;
	public static boolean isSuccess;
	
	
	public static List<Event> getEventDetails() throws SQLException {
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		ArrayList<Event> arl = new ArrayList<>();
		
		String sql = "SELECT * FROM oop.events" ;
		
		//Execute Data
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			int eid = rs.getInt("EID");
			int uid = rs.getInt("UID");
			int vid = rs.getInt("VID");
			String date = rs.getString("Date");
			double budget = rs.getDouble("Budget");
			int noOfGuest = rs.getInt("NoOfGuests");
			String status = rs.getString("Status");
			
			Event e = new Event(eid, uid, vid, date, budget,noOfGuest,status );
			arl.add(e);
			
			System.out.println("Success");
	
		}
		
		return arl;
	}
	
	
	
	
	public static boolean deleteEvent(int id) throws SQLException {
		
		con = DBConfig.getConnection();
		stmt = con.createStatement();
		
		
		String sql = "delete  FROM oop.events where EID = '"+id+"'";
		
	
		//execute query
		int result = stmt.executeUpdate(sql);
		
		
		if(result == 1 ) {
			
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
		
		
	}
}
