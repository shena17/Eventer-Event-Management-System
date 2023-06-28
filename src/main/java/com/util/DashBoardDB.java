package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.UpcommingEvents;

public class DashBoardDB {
	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	
	
	//get the count of upcomming events
	public static int getCountUpComming(int id) throws SQLException{
		
		//List<Integer> count=new ArrayList<>();
		int countUpComming = 0;
		
		con=DBConfig.getConnection();
		stmt=con.createStatement();
		String sql="SELECT count(EID) FROM oop.events WHERE Status='confirm' AND UID='"+id+"'";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
			int upComming=rs.getInt("count(EID)");
			//count.add(upComming);
			countUpComming=upComming;
		}
		
		
		
		return countUpComming;
		
	}
	
	//get the count of past events
	public static int getCountPast(int id){
		
		int countPast = 0;
		
		con=DBConfig.getConnection();
		try {
			
			stmt=con.createStatement();
			String sql="SELECT count(EID) FROM oop.events WHERE Status='past' AND UID='"+id+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int past=rs.getInt("count(EID)");
				countPast=past;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return countPast;
		
	}
	
	//get the list of upcomming events
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
