package model;

import java.sql.Date;

public class NewProduct {
	private int np_no; 
	private String np_name;        
	private String np_content;
	private String np_image;
    private int np_price;      
    private int np_discount;
    private Date np_date;
    private int np_like;       
    private int  np_count;      
    private String biz_id;
    private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getNp_no() {
		return np_no;
	}
	public void setNp_no(int np_no) {
		this.np_no = np_no;
	}
	public String getNp_name() {
		return np_name;
	}
	public void setNp_name(String np_name) {
		this.np_name = np_name;
	}
	public String getNp_content() {
		return np_content;
	}
	public void setNp_content(String np_content) {
		this.np_content = np_content;
	}
	public String getNp_image() {
		return np_image;
	}
	public void setNp_image(String np_image) {
		this.np_image = np_image;
	}
	public int getNp_price() {
		return np_price;
	}
	public void setNp_price(int np_price) {
		this.np_price = np_price;
	}
	public int getNp_discount() {
		return np_discount;
	}
	public void setNp_discount(int np_discount) {
		this.np_discount = np_discount;
	}
	public Date getNp_date() {
		return np_date;
	}
	public void setNp_date(Date np_date) {
		this.np_date = np_date;
	}
	public int getNp_like() {
		return np_like;
	}
	public void setNp_like(int np_like) {
		this.np_like = np_like;
	}
	public int getNp_count() {
		return np_count;
	}
	public void setNp_count(int np_count) {
		this.np_count = np_count;
	}
	public String getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}   
    
}
