package com.model;

import java.util.Date;

public class Event {
	
	private String type;
	private String date;
	private String arr[]=new String[] {};
	private int num;
	private String color;
	private double budget;
	private int venue;
	private int suppliers[]=new int[4];
	
	private int eid;
	private int uid;
	private int vid;
	private int noOfGuest;
	private String status;


	public Event() {
		type = "Null";
		date = "Null";
		num = 0;
		color = "Null";
		budget = 0;
		venue=0;
		for(String array:arr) {
			array="Null";
		}
		
		for(int s:suppliers) {
			s=0;
		}
	}
	
	public Event(int eid, int uid, int vid, String date, double budget, int noOfGuest, String status) {
		
		this.eid = eid;
		this.uid = uid;
		this.vid = vid;
		this.date = date;
		this.budget = budget;
		this.noOfGuest = noOfGuest;
		this.status = status;
	}
	
	public void createEvent(String type, String date, String[] arr, int num, String color) {
		this.type = type;
		this.date = date;
		this.arr = arr;
		this.num = num;
		this.color = color;
	}
	
	public int getEid() {
		return eid;
	}


	public int getUid() {
		return uid;
	}


	public int getVid() {
		return vid;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String[] getArr() {
		return arr;
	}

	public void setArr(String[] arr) {
		this.arr = arr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public double getBudget() {
		return budget;
	}

	public void setBudget(double budget) {
		this.budget = budget;
	}

	public int getVenue() {
		return venue;
	}

	public void setVenue(int venue) {
		this.venue = venue;
	}
	
	 public int[] getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(int[] sid) {
		this.suppliers = sid;
	}
	
	public int getNoOfGuest() {
		return noOfGuest;
	}


	public String getStatus() {
		return status;
	}
	
	

}
