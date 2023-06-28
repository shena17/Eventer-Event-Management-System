package com.model;

public class User{

	private int id;
	private String fname;
	private String lname;
	private String email;
	private String nic;
	private String type;
	private String phone;
	private String uname;
	private String pwd;
	
	
	public User(int id, String fname, String lname, String email, String nic, String type, String phone, String uname) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.nic = nic;
		this.type = type;
		this.phone = phone;
		this.uname = uname;
	}
	
	//Thanuka
	//Overload constructor to assign values
	public User(int id, String FirstName,String LastName,String Email,String NIC,String UserName,String Password) {
		this.id = id;
		this.fname = FirstName;
		this.lname = LastName;
		this.nic = NIC;
		this.email = Email;
		this.uname = UserName;
		this.pwd = Password;
	}

	//Hashan
	public User(int id, String fname, String email, String type) {
		
		this.id = id;
		this.fname = fname;
		this.email = email;
		this.type = type;
	}
	
	public int getid() {
		return id;
	}

	public String getFname() {
		return fname;
	}

	public String getLname() {
		return lname;
	}

	public String getNic() {
		return nic;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getUname() {
		return uname;
	}

	public String getType() {
		return type;
	}

	
}
