package com.member;

public class memberDTO {
	private int num;
	private String id;
	private String pw;
	private String name;
	private String address;
	private String phone;
	
	
	
	public memberDTO(String id, String pw, String name, String address, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}

	public memberDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	
	public memberDTO(int num, String id, String name, String address, String phone) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	

}
