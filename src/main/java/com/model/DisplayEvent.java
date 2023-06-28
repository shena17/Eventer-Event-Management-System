package com.model;

public class DisplayEvent {
	
	  protected int eid;
	  protected String eType;
	  protected String venue;
	  protected String date;
	  protected double budget;
	  
	  
	public DisplayEvent(int eid, String eType, String venue, String date, double budget) {
		super();
		this.eid = eid;
		this.eType = eType;
		this.venue = venue;
		this.date = date;
		this.budget = budget;
		
	}
	
	public DisplayEvent(int eid, String eType, String date, double budget) {
		super();
		this.eid = eid;
		this.eType = eType;
		this.date = date;
		this.budget = budget;
		
	}


	public int getEid() {
		return eid;
	}


	public void setEid(int eid) {
		this.eid = eid;
	}


	public String geteType() {
		return eType;
	}


	public void seteType(String eType) {
		this.eType = eType;
	}


	public String getVenue() {
		return venue;
	}


	public void setVenue(String venue) {
		this.venue = venue;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public double getBudget() {
		return budget;
	}


	public void setBudget(double budget) {
		this.budget = budget;
	}
	
	
	
	 
	  

}
