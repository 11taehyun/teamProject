package com.study.springboot.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class JoinDTO {

	private int goods_id;
	private String goods_name;
	private String goods_price;
	private String goods_img;
	private String goods_category1;
	private String goods_category2;
	private int goods_quantity;
	private String goods_features;
	private Date goods_addDate;
	private String goods_brand;
	
	private String category1;
	private String category2;
	
	private int order_id;
	private int user_id;
	private int order_qty;
	private String dilivery;
	private Date order_date;
	private String order_option;
	
	private int startNum;
	private int endNum;
}
