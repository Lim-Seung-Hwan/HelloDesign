package com.goods;

public class goodsDTO {
	private int num;
	private int price;
	private String name;
	private String info;
	private String img_path;
	private String tag;
	private String category;
	
	
	
	public goodsDTO(int price, String name, String info, String img_path, String tag) {
		super();
		this.price = price;
		this.name = name;
		this.info = info;
		this.img_path = img_path;
		this.tag = tag;
	}

	public goodsDTO(int num, int price, String name, String info, String img_path, String tag, String category) {
		super();
		this.num = num;
		this.price = price;
		this.name = name;
		this.info = info;
		this.img_path = img_path;
		this.tag = tag;
		this.category = category;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	

}
