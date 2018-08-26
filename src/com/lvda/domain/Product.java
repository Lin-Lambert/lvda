package com.lvda.domain;


public class Product {

	private Long pro_id;
	
	private String pro_name;
	private String pro_time;
	private String pro_img;
	private String pro_introduce;
	public Long getPro_id() {
		return pro_id;
	}
	public void setPro_id(Long pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_time() {
		return pro_time;
	}
	public void setPro_time(String pro_time) {
		this.pro_time = pro_time;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public String getPro_introduce() {
		return pro_introduce;
	}
	public void setPro_introduce(String pro_introduce) {
		this.pro_introduce = pro_introduce;
	}
}
