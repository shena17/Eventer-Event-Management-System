package com.model;

public class Payments {

	private int pid;
	private int eid;
	private double amount;
	
	
	public Payments(int pid, int eid, double amount) {
		
		this.pid = pid;
		this.eid = eid;
		this.amount = amount;
	}


	public int getPid() {
		return pid;
	}


	public int getEid() {
		return eid;
	}


	public double getAmount() {
		return amount;
	}
	
	
}