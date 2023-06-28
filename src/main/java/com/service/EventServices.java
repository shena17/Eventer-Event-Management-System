package com.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Event;
import com.model.Supplier;
import com.util.EventDB;
import com.util.SupplierDB;
import com.util.venueDB;

import jakarta.servlet.http.HttpSession;

public class EventServices {
	

	//declaring a static object of the event class
	static Event e1=new Event();
	
	//method to set basic data of the event in the event class
	public static void setData(String type, String date, String[] arr, int num, String color) {
		
		String type1 = type;
		String date1 = date;
		String[] arr1 = arr;
		int num1 = num;
		String color1 = color;
		
		
		e1.createEvent(type1, date1, arr1, num1, color1);
		//e1.print();
	}
	
	//method to set the venue in the event class
	public static void setVenue(int venue) {
		int venue1=venue;
		
		e1.setVenue(venue1);
		//e1.print();
	}
	
	//returing the object event created
	public static Event getObj() {
		return e1;
		
	}
	
	//method to calculate the total budget
	public static double calcTotal() {
		int vid=e1.getVenue();
		int[] sid=e1.getSuppliers();
		double total=0;
		
		try {
			double venueCost=venueDB.getVenueCost(vid);
			total=total+venueCost;
			for(Integer i:sid) {
				if(i!=0) {
					double supplierCost=SupplierDB.getSupplierCost(i);
					total=total+supplierCost;
				}

			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		e1.setBudget(total);
		return total;
	}
	
	//returning the budget
	public static double getBudget() {
		double total=e1.getBudget();
		
		return total;
		
	}
	
	//returing the list of suppliers
	public static int[] getList() {
		
		int[] sup=e1.getSuppliers();
		return sup;
		
	}
	
	//returning the venue id
	public static int getVenue() {
		int vid=e1.getVenue();
		return vid;	
	}
	
	//method to send all event data to the eventDB utility class
	public static void setEventData(String uname) {
				
		String type=e1.getType();
		String date=e1.getDate();
		String[] options=e1.getArr();
		String color=e1.getColor();
		double budget=e1.getBudget();
		int venueId=e1.getVenue();
		int[] supList=e1.getSuppliers();
		int noOfGuest=e1.getNum();
		
		try {
			
			EventDB.setEventData(type, date, options, noOfGuest, color, budget, venueId, supList, uname);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	



}
