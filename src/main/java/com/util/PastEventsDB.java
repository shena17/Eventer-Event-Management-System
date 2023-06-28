package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.PastEvents;
import com.model.UpcommingEvents;

public class PastEventsDB {
	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	
	
	//getting the list of past events
	public static ArrayList<PastEvents> getPastList(int id){
		
		ArrayList<PastEvents> events=new ArrayList<>();
		
		con=DBConfig.getConnection();
		try {
			
			stmt=con.createStatement();
			String sql="SELECT e.EID,e.Type,v.Name,e.Date,e.Budget FROM oop.events e,oop.venue v WHERE e.VID=v.VID AND e.UID='"+id+"' AND e.Status='past'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int eid=rs.getInt("EID");
				String eType=rs.getString("Type");
				String venue=rs.getString("Name");
				String date=rs.getString("Date");
				Double budget=rs.getDouble("Budget");
				
				events.add(new PastEvents(eid, eType,venue,date,budget));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return events;
		
	}

}
