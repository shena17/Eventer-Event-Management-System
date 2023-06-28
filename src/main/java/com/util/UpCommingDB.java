package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.UpcommingEvents;

public class UpCommingDB {
	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	
	//getting the upcommimg event list
	public static ArrayList<UpcommingEvents> getUpcommingList(int id){
		
		ArrayList<UpcommingEvents> events=new ArrayList<>();
		
		con=DBConfig.getConnection();
		try {
			
			stmt=con.createStatement();
			String sql="SELECT e.EID,e.Type,v.Name,e.Date,e.Budget,e.Status FROM oop.events e,oop.venue v WHERE e.VID=v.VID AND e.UID='"+id+"' AND e.EID NOT IN(SELECT e.EID FROM oop.events e WHERE e.Status='past');";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int eid=rs.getInt("EID");
				String eType=rs.getString("Type");
				String venue=rs.getString("Name");
				String date=rs.getString("Date");
				Double budget=rs.getDouble("Budget");
				String status=rs.getString("Status");
				
				events.add(new UpcommingEvents(eid,eType,venue,date,budget,status));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return events;
		
	}


}
