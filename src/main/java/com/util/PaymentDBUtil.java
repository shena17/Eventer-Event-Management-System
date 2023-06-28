package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Event;
import com.model.Payments;

public class PaymentDBUtil {

	public static Connection con = null;
	public static Statement stmt = null;
	public static ResultSet rs = null;
	public static boolean isSuccess;
	
	
	//get event list
	public static List<Payments> getPaymentDetails() throws SQLException {
		
		con =  DBConfig.getConnection();
		stmt = con.createStatement();
		
		ArrayList<Payments> arl = new ArrayList<>();
		
		String sql = "SELECT * FROM oop.payment" ;
		
		
		//Execute Data
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			int pid = rs.getInt("PID");
			int eid = rs.getInt("EID");
			double amount = rs.getDouble("Amount");
			
			
			Payments e = new Payments(pid, eid, amount);
			arl.add(e);
			
			System.out.println("Success");
	
		}
		
		return arl;
	}
}
