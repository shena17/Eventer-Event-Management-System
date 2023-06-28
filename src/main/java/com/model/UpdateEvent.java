package com.model;

public class UpdateEvent {
	
	private int eid;
	private String Date;
	private String Color;
	private int NoOfGuests;
	private int vid;
	
	
	public UpdateEvent(int eid,String Date, String Color, int NoOfGuests, int vid) {
		super();
		this.eid=eid;
		this.Date = Date;
		this.Color = Color;
		this.NoOfGuests = NoOfGuests;
		this.vid = vid;
	}

	

	public int getEid() {
		return eid;
	}



	public void setEid(int eid) {
		this.eid = eid;
	}



	public String getDate() {
		return Date;
	}


	public void setDate(String date) {
		Date = date;
	}


	public String getColor() {
		return Color;
	}


	public void setColor(String color) {
		Color = color;
	}


	public int getNoOfGuests() {
		return NoOfGuests;
	}


	public void setNoOfGuests(int noOfGuests) {
		NoOfGuests = noOfGuests;
	}


	public int getVid() {
		return vid;
	}


	public void setVid(int vid) {
		this.vid = vid;
	}
	
	
	

}
