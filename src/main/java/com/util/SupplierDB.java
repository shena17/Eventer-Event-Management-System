package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Supplier;
import com.model.SupplierDisplay;
import com.model.Venue;

public class SupplierDB {
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	//private static String type;
	
	

	//getting the list of suppliers who are availabe for the user selected date and for the user selected required options 
	public static List<Supplier> getSupplierList(String[] options, String date) throws SQLException,NullPointerException{
		
		ArrayList<Supplier> sData=new ArrayList<>();
		
		
		for(String o:options) {
			
			try {
				
				con=DBConfig.getConnection();
				stmt=con.createStatement();
				String sql="SELECT distinct s.SID,u.FirstName,s.type,s.price FROM oop.supplier s,oop.users u WHERE u.UID=s.SID AND s.type='"+o+"' AND s.SID NOT IN(SELECT SID FROM oop.event_supplier WHERE Date='"+date+"');";
				rs=stmt.executeQuery(sql);

				
				while(rs.next()) {				
					int sid=rs.getInt("SID");
					String name=rs.getString("FirstName");
					String typeSup=rs.getString("type");
					int price=rs.getInt("price");
					
					System.out.println(sid+" "+typeSup);
					Supplier supplierData=new Supplier(sid,name,typeSup,price);
					
					sData.add(supplierData);
				}
				
				}catch(Exception e) {
					e.printStackTrace();
				}
			
		}

		
		
		return sData;
		
	} 
	
	public static void setSuppliers() {
		
	}

	//getting the price of each supplier
	public static double getSupplierCost(Integer sid) throws SQLException {
		
		double cost=0;
		
		try {
			
		con=DBConfig.getConnection();
		stmt=con.createStatement();
		String sql="SELECT price FROM oop.supplier WHERE SID='"+sid+"';";
		rs=stmt.executeQuery(sql);
		
		
		while(rs.next()) {
			cost=rs.getDouble("price");
		}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cost;
	}
	
	
	//getting the type of the suplier when the id is given
	public static String getSupplierType(Integer sid) {
		String type="Null";
		try {
			
			con=DBConfig.getConnection();
			stmt=con.createStatement();
			String sql="SELECT type FROM oop.supplier where SID='"+sid+"';";
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next()) {
				type=rs.getString("type");
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return type;
		
	}
	
	//getting the details of all suppliers of a certain type
	public static ArrayList<SupplierDisplay> getSupplier(String type){
		
		ArrayList<SupplierDisplay> suppleir=new ArrayList<>();
		try {
			
			con=DBConfig.getConnection();
			stmt=con.createStatement();
			String sql="SELECT u.FirstName,u.LastName,s.price,uc.ContactNo FROM oop.users u,oop.supplier s,oop.user_contact uc WHERE u.UID=s.SID AND u.UID=uc.UID AND u.Status='aproved' AND s.type='"+type+"'";
			rs=stmt.executeQuery(sql);
			
			
			while(rs.next()) {
				String fname=rs.getString("FirstName");
				String lname=rs.getString("LastName");
				double price=rs.getDouble("price");
				int contact=rs.getInt("ContactNo");
				
				suppleir.add(new SupplierDisplay(fname, lname, price, contact));
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return suppleir;
		
	}

}