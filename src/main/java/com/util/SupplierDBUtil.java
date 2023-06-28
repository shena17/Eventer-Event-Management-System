package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Event;
import com.model.PastEvents;
import com.model.UpdateEvent;
import com.model.User;

public class SupplierDBUtil {
	
	public static Connection con = null;
	public static Statement stmt = null;
	public static ResultSet rs = null;
	public static boolean isSuccess;
	
	
	//Hashan
	//Get Supplier List
	public static List<User> getSupplierDetails() throws SQLException {
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		ArrayList<User> arl = new ArrayList<>();
		
		String sql = "select * from oop.users  where Type='supplier' and UID not in (SELECT UID FROM oop.users where type='supplier' and Status = 'pending')" ;
		
		//Execute Data
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			int id = rs.getInt("UID");
			String name = rs.getString("FirstName");
			String type = rs.getString("Type");
			String email = rs.getString("Email");
			
			User u = new User(id, name, email, type );
			arl.add(u);
	
		}
		
		
		
		return arl;
	}
	
	
	//Delete Supplier
	public static boolean deleteSupplier(int id) throws SQLException {
		
		con = DBConfig.getConnection();
		stmt = con.createStatement();
		
		
		String sql1 = "Delete FROM oop.supplier where SID = '"+id+"'";
		String sql2 = "Delete FROM oop.users where UID = '"+id+"'";
	
		//execute query
		int result1 = stmt.executeUpdate(sql1);
		int result2 = stmt.executeUpdate(sql2);
		
		if(result1 == 1 && result2 == 1) {
			
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
	}
	
	//Display Pending Suppliers
	public static ArrayList<User> displayPendingSuppliers() throws SQLException {

		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		ArrayList<User> arl = new ArrayList<>();
		
		String sql = "SELECT * FROM oop.users where Type = 'supplier' and Status = 'pending'" ;
		
		//Execute Data
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			int id = rs.getInt("UID");
			String name = rs.getString("FirstName");
			String type = rs.getString("Type");
			String email = rs.getString("Email");
			
			User u = new User(id, name, email, type );
			arl.add(u);
	
		}
		
		return arl;
	
	}
	
	//Approve Supplier
	public static boolean approveSupplier (int id) throws SQLException {
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		ArrayList<User> arl = new ArrayList<>();
		
		String sql = "update oop.users SET Status = 'Approved' where UID = '"+id+"'" ;
		
		//Execute Data
		int result = stmt.executeUpdate(sql);
		
		if(result == 1) {
			
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
		return isSuccess;
		
	}
	
	
	//Calculate Approved Suppliers in the system
	
	public static int supplierCount() throws SQLException {
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		int count = 0;
		
		//Sql Query
		String sql = "SELECT  count(UID) FROM oop.users where type='supplier' and Status='Approved'";
		
		//Execute Data
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			count = rs.getInt(1);
		}
		
		return count;
	}


	
	//Thanuka
	//Insert a supplier
		public static boolean insertsupplier(String FirstName, String LastName, String NIC, String Contact,String Email,String UserName,String RegistrationType,String VenueName,String MaxGuests,String Budget,String Password) throws SQLException {
			
		System.out.println("1");
				con = DBConfig.getConnection();
				stmt = con.createStatement();
				
				String sql = "INSERT INTO `oop`.`users` (`FirstName`, `LastName`, `Email`, `NIC`, `Type`, `Username`, `Password`, `Status`) VALUES ('"+FirstName+"', '"+LastName+"', '"+Email+"', '"+NIC+"', 'supplier', '"+UserName+"', '"+Password+"', 'pending')";
				int result = stmt.executeUpdate(sql);
				
				if(result == 1) {
					
					int id = getId(UserName);

					
					sql = "INSERT INTO `oop`.`supplier` (`SID`, `type`, `price`) VALUES ('"+id+"', '"+RegistrationType+"','"+Budget+"')";
					
					result = stmt.executeUpdate(sql);
					
					
					
					if(result == 1) {
						
						if(RegistrationType.equals("Venue")) {
							
							System.out.println("Reg type success");
							
							sql =	"INSERT INTO `oop`.`venue` (`Name`, `MaxNoOfGuests`, `Cost`) VALUES ('"+VenueName+"', '"+MaxGuests+"','"+Budget+"')";
							
							result = stmt.executeUpdate(sql);
							
							if(result == 1) {
								isSuccess = true;
							}else {
								isSuccess = false;
							}
							}
						
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
					
					System.out.println("true");
					
				}else {
					
					System.out.println("false");
					isSuccess = false;
				}
		
			
			return isSuccess;
		}
		
		//Get supplier ID		
		public static int getId(String UserName) throws SQLException {
			int uid = 0;
			
			con = DBConfig.getConnection();
			
			stmt = con.createStatement();
			
			String sql = "SELECT UID FROM oop.users WHERE (Username = '"+UserName+"')";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				uid = rs.getInt("UID");
			}
			
			return uid;
		}
		
		//Get Registration Type
		public static String getRegType(String RegistrationType) throws SQLException {
			
			String type = "";
			
	        con = DBConfig.getConnection();
			
			stmt = con.createStatement();
			
			String sql = "SELECT type FROM oop.supplier WHERE (type = '"+RegistrationType+"')";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				type = rs.getString("type");
			}
			
			return type;
		}
		
		//Get Supplier Details
		public static List<User> getSupplierDetaails(String id){
			
			int convertID = Integer.parseInt(id);
			
			ArrayList<User> supp = new ArrayList<>();
			
			try {
				
				con = DBConfig.getConnection();
				stmt = con.createStatement();
				
				String sql = "SELECT * FROM oop.users where UID = '"+convertID+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id1 = rs.getInt(1);
					String firstname = rs.getString(2);
					String lastname= rs.getString(3);
					String email = rs.getString(4);
					String nic = rs.getString(5);
					String username = rs.getString(7);
					String password = rs.getString(9);
					
					User s = new User(id1, firstname, lastname, email, nic, username, password);
					supp.add((User) s);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return supp;
		}
		
		//Update Supplier Details
		public static boolean updateSupplier(String FirstName,String LastName,String Email,String NIC,String UserName,String Password,String Budget) {
			
			try {
				
				int id = getId(UserName);
				
				con = DBConfig.getConnection();
				stmt = con.createStatement();
				
				String sql = "UPDATE `oop`.`users` SET `FirstName` = '"+FirstName+"', `LastName` = '"+LastName+"', `Email` = '"+Email+"', `NIC` = '"+NIC+"', `Username` = '"+UserName+"',`Password` = '"+Password+"' WHERE (`UID` = '"+id+"')";
				
				int result = stmt.executeUpdate(sql);
				
	            if(result == 1) {	
					
					sql = "UPDATE `oop`.`supplier` SET `price` = '"+Budget+"' WHERE (`SID` = '"+id+"')";
					
					result = stmt.executeUpdate(sql);
					
					if(result == 1) {
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
				}else {
					isSuccess = false;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return isSuccess;
		}
		
		//Delete supplier
		public static boolean deleteSupplier(String username) throws SQLException {
					
			int uid = getId(username);
					
			String sql = "DELETE FROM `oop`.`supplier` WHERE (`SID` = '"+uid+"')";

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
		
		   //Retrieve Events data
		//getting the list of past events
		public static ArrayList<PastEvents> getEventDetails(int id){
			
			ArrayList<PastEvents> events=new ArrayList<>();
			
			con=DBConfig.getConnection();
			try {
				
				stmt=con.createStatement();
				String sql="SELECT e.EID,e.Type,v.Name,e.Date,e.Budget FROM oop.events e,oop.venue v,oop.event_supplier es WHERE e.VID=v.VID AND e.EID=es.EID AND es.SID='"+id+"' AND e.Status='past'";
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
