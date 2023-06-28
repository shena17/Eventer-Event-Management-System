package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Venue;
import com.model.VenueDisplay;

public class venueDB {
	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	
	
	//getting the venue list
	public static List<Venue> getVenueList(String Date,String type) throws SQLException {
		
		ArrayList<Venue> vData=new ArrayList<>();
		
		try {
			
			con =  DBConfig.getConnection();
			stmt=con.createStatement();
			String sql="SELECT DISTINCT v.VID,v.name,v.cost FROM venue v,venue_type vt WHERE vt.Type='"+type+"' AND v.VID NOT IN(SELECT VID FROM events WHERE Date='"+Date+"')";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {	
				
				int vid=rs.getInt("VID");
				String name=rs.getString("name");
				int price=rs.getInt("Cost");
				
				Venue venueData=new Venue(name,vid,price);
				
				vData.add(venueData);
				
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return vData;
		
	}
	
	//getting the venue cost
	public static double getVenueCost(int vid) throws SQLException {
		double cost=0;
		
		con =  DBConfig.getConnection();
		stmt=con.createStatement();
		String sql="SELECT Cost FROM oop.venue WHERE VID='"+vid+"';";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
			cost=rs.getDouble("Cost");
		}
		
		
		return cost;
		
	}
	
	//getting venue data
	public static ArrayList<VenueDisplay> getVenues(){
		
		
		ArrayList<VenueDisplay> venue=new ArrayList<>();
		

		try {
			
			con =  DBConfig.getConnection();
			stmt=con.createStatement();
			String sql="SELECT v.VID,v.Name,v.MaxNoOfGuests,v.Cost,v.description,v.picture FROM oop.venue v";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {	
				int vid=rs.getInt("VID");
				String name=rs.getString("Name");
				System.out.println(name);
				int max=rs.getInt("MaxNoOfGuests");
				double price=rs.getDouble("Cost");
				String description=rs.getString("description");
				String pic=rs.getString("picture");
				 
				venue.add(new VenueDisplay(vid, name, description, pic, max, price));
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return venue;
		
		
	} 
}
