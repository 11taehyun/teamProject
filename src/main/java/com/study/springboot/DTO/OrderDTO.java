package com.study.springboot.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderDTO {
	
	private int order_id;
	private int user_id;
	private int goods_id;
	private int order_qty;
	private String dilivery;
	private Date order_date;
	private String order_option;
}
