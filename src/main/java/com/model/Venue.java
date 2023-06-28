package com.model;

import java.util.ArrayList;
import java.util.List;

public class Venue {
	
	private String name;
	private int vid;
	private static int price;
	
	public int getVid() {
		return vid;
	}



	public void setVid(int vid) {
		this.vid = vid;
	}



	public Venue(String name,int vid,int price) {
		super();
		this.name = name;
		this.vid=vid;
		this.price=price;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}

	
	
	

}
