package com.cart;

public class cartDTO {
	private int m_num;
	private int g_num;
	private String c_name;
	private int c_price;
	private String c_imgpath;
	
	public String getC_imgpath() {
		return c_imgpath;
	}
	public void setC_imgpath(String c_imgpath) {
		this.c_imgpath = c_imgpath;
	}
	public cartDTO(String c_name, int c_price) {
		super();
		this.c_name = c_name;
		this.c_price = c_price;
	}
	public cartDTO(String c_name, int c_price, String c_imgpath) {
		super();
		this.c_name = c_name;
		this.c_price = c_price;
		this.c_imgpath = c_imgpath;
	}
	public cartDTO(int m_num, int g_num) {
		super();
		this.m_num = m_num;
		this.g_num = g_num;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	
	
}
