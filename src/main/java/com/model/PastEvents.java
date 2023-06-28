package com.model;

public class PastEvents extends DisplayEvent {

	
	public PastEvents(int eid, String eType, String venue, String date, double budget) {
			
		super(eid, eType, venue, date, budget);

	}
	
	public PastEvents(int eid, String eType, String Date, double Budget) {
		super(eid, eType, Date, Budget);
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
