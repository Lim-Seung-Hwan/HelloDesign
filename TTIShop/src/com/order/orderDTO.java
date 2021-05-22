package com.order;

public class orderDTO {
	private int o_num;
	private String o_address;
	private String o_name;
	private String o_phone;
	private int g_num;
	private String o_way;
	private String o_date;
	private int m_num;
	private int o_count;
	private int g_price;
	private String g_name;
	private String g_img_path;
	
	public orderDTO(int o_num, String o_address, String o_name, String o_phone, int g_num, String o_way,
			String o_date, int m_num ,int o_count, int g_price, String g_name, String g_img_path) {
		super();
		this.o_num = o_num;
		this.o_address = o_address;
		this.o_name = o_name;
		this.o_phone = o_phone;
		this.g_num = g_num;
		this.o_way = o_way;
		this.o_date = o_date;
		this.m_num = m_num;
		this.o_count=o_count;
		this.g_price = g_price;
		this.g_name = g_name;
		this.g_img_path = g_img_path;
	}
	public orderDTO(String o_address, String o_name, String o_phone, int g_num, String o_way,
			int m_num ,int o_count) {
		super();
		this.o_address = o_address;
		this.o_name = o_name;
		this.o_phone = o_phone;
		this.g_num = g_num;
		this.o_way = o_way;
		this.m_num = m_num;
		this.o_count=o_count;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_address() {
		return o_address;
	}
	public void setO_address(String o_address) {
		this.o_address = o_address;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public int getG_num() {
		return g_num;
	}
	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
	public String getO_way() {
		return o_way;
	}
	public void setO_way(String o_way) {
		this.o_way = o_way;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getO_count() {
		return o_count;
	}
	public void setO_count(int o_count) {
		this.o_count = o_count;
	}
	public int getG_price() {
		return g_price;
	}
	public void setG_price(int g_price) {
		this.g_price = g_price;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_img_path() {
		return g_img_path;
	}
	public void setG_img_path(String g_img_path) {
		this.g_img_path = g_img_path;
	}
	
}
