package com.model;

public class VenueDisplay {

	private int vid;
	private String name;
	private String description;
	private String pic;
	private int maxCount;
	private String[] eTypes;
	private double price;
	
	
	public VenueDisplay(int vid,String name, String description, String pic, int maxCount, double price) {
		super();
		this.vid=vid;
		this.name = name;
		this.description = description;
		this.pic = pic;
		this.maxCount = maxCount;
		this.price = price;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPic() {
		return pic;
	}


	public void setPic(String pic) {
		this.pic = pic;
	}


	public int getMaxCount() {
		return maxCount;
	}


	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}


	public String[] geteTypes() {
		return eTypes;
	}


	public void seteTypes(String[] eTypes) {
		this.eTypes = eTypes;
	}

	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public int getVid() {
		return vid;
	}


	public void setVid(int vid) {
		this.vid = vid;
	}
	
	
	
	
}
