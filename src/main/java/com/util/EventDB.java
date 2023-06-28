package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.Event;
import com.model.UpdateEvent;

public class EventDB {
	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	private static boolean isSuccess;
	
	

	//inserting the event data to the database
	public static void setEventData(String type,String date,String[] options,int noOfGuest,String color,double budget,int venueId,int[] supList, String uname) throws SQLException {
		
		int eid=0;
		int uid = 0;
		
		uid = UserDBUtil.getId(uname);
		
		con =  DBConfig.getConnection();
		stmt=con.createStatement();
		String sql="INSERT INTO `oop`.`events` (`UID`, `VID`, `Date`, `Budget`, `NoOfGuests`, `Color`, `Status`, `Type`) VALUES ('"+uid+"', '"+venueId+"', '"+date+"', '"+budget+"', '"+noOfGuest+"', '"+color+"', 'pending', '"+type+"')";

		int result=stmt.executeUpdate(sql);
		if(result==1) {
			System.out.println("Sucsess");
			sql="SELECT EID FROM oop.events WHERE UID='"+uid+"' AND VID='"+venueId+"' AND Date='"+date+"';";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				eid=rs.getInt("EID");
			}
			
			for(int s:supList) {
				
				sql="INSERT INTO oop.event_supplier (EID,sid,Date) VALUES('"+eid+"','"+s+"','"+date+"')";
				int result1=stmt.executeUpdate(sql);
				
			}
			
			
			}
		else {
			System.out.println("Fail");
		}

		
	}
	
	
	//getting event data from the data base
	public static ArrayList<UpdateEvent> getEventData(int id){
		
		ArrayList<UpdateEvent> eventData=new ArrayList<>();
		
		con=DBConfig.getConnection();
		try {
			
			stmt=con.createStatement();
			String sql="SELECT e.EID,e.Date,e.Color,e.NoOfGuests,e.VID FROM oop.events e WHERE EID='"+id+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int eid=rs.getInt("EID");
				String date=rs.getString("Date");
				String color=rs.getString("Color");
				System.out.println(color);
				int NoOfGuests=rs.getInt("NoOfGuests");
				int venueID=rs.getInt("VID");
				
				eventData.add(new UpdateEvent(eid,date,color,NoOfGuests,venueID));
				

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return eventData;
		
	}
	
	//updating the event data
	public static boolean updateEvent(int id,int vid,String date,String color,int num) {
		
		con=DBConfig.getConnection();
		try {
			stmt=con.createStatement();
			String sql="update oop.events set VID='"+vid+"',Date='"+date+"',NoOfGuests='"+num+"',Color='"+color+"' WHERE EID='"+id+"'";
			
			
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				String sql2="update oop.event_supplier SET Date='"+date+"' WHERE EID='"+id+"'";
				int rs1=stmt.executeUpdate(sql2);
				
				if(rs1>0) {
					isSuccess=true;
				}
				else {
					isSuccess=false;
				}
				
			}
			else {
				isSuccess=false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
		
	}
	
	//delete the event
	public static boolean deleteEvent(int id) {
		
		con=DBConfig.getConnection();
		try {
			stmt=con.createStatement();
			String sql="DELETE FROM oop.event_supplier WHERE EID='"+id+"'";
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				
				String sql1="DELETE FROM oop.events WHERE EID='"+id+"'";
				int rs1=stmt.executeUpdate(sql1);
				if(rs1>0) {
					isSuccess=true;
				}
				
				else {
					isSuccess=false;
				}

			}
			else {
				isSuccess=false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	
	//Shenal
	//Event payment
	
	public static double getBudget(int eid) throws SQLException {
		
		double budget = 0;
		
		con = DBConfig.getConnection();
		
		stmt = con.createStatement();
		
		String sql = "select e.Budget from users u, events e where u.UID = e.UID and e.EID = '"+eid+"'";
		
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			budget = rs.getDouble(1);
		}
		
		return budget;
	}
	
	
	
	//Get name from eid
	public static String getName(int eid) throws SQLException {
		String name = null; 
		
		con = DBConfig.getConnection();
		
		stmt = con.createStatement();
		
		String sql = "select u.FirstName from users u, events e where u.UID = e.UID and e.EID = '"+eid+"'";
		
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			name = rs.getString(1);
		}
		
		return name;
	}
	
	
	//Update payment status
	public static boolean confirmPayment(int eid) throws SQLException {
		
		boolean success = false;
		
		con = DBConfig.getConnection();
		
		stmt = con.createStatement();
		
		String sql = "UPDATE `oop`.`events` SET `Status` = 'confirm' WHERE (`EID` = '"+eid+"')";
		
		int result = stmt.executeUpdate(sql);
		
		if(result == 1) {
			success = true;
		}else {
			success  = false;
		}
			
			return success;
	}
	
	
	//Thanuka
	public static ArrayList<UpdateEvent> getEventDetails(int id){
		
		ArrayList<UpdateEvent> eventData=new ArrayList<>();
		
		con=DBConfig.getConnection();
		try {
			
			stmt=con.createStatement();
			String sql="SELECT e.EID,e.VID,e.Date,e.Color,e.NoOfGuests FROM oop.events e,oop.event_supplier es WHERE e.EID=es.EID AND es.SID='"+id+"' AND e.Status='confirm'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int eid=rs.getInt("EID");
				String date=rs.getString("Date");
				String color=rs.getString("Color");
				System.out.println(color);
				int NoOfGuests=rs.getInt("NoOfGuests");
				int venueID=rs.getInt("VID");
				
				eventData.add(new UpdateEvent(eid,date,color,NoOfGuests,venueID));
				

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return eventData;
		
	}
}
