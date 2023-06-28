package com.model;

public class SupplierDisplay {
	
	private String fName;
	private String lName;
	private double price;
	private int contact;
	
	
	public SupplierDisplay(String fName, String lName, double price, int contact) {
		super();
		this.fName = fName;
		this.lName = lName;
		this.price = price;
		this.contact = contact;
	}


	public String getfName() {
		return fName;
	}


	public void setfName(String fName) {
		this.fName = fName;
	}


	public String getlName() {
		return lName;
	}


	public void setlName( String lName) {
		this.lName = lName;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public int getContact() {
		return contact;
	}


	public void setContact(int contact) {
		this.contact = contact;
	}
	
	
	
	
	
	

}
