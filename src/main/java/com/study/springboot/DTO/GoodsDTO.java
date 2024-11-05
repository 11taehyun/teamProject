package com.study.springboot.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class GoodsDTO {

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
	
	private int startNum;
	private int endNum;
}
