package com.model;

public class Supplier {
	
	private int sid;
	private String name;
	private String type;
	private int price;
	
	
	public Supplier(int sid, String name, String type, int price) {
		super();
		this.sid = sid;
		this.name = name;
		this.type=type;
		this.price = price;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getSid() {
		return sid;
	}


	public void setSid(int sid) {
		this.sid = sid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
	

}
