package com.study.springboot.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class WishlistDTO {

	private int wish_id;
	private int user_id;
	private int goods_id;
	private Date add_date;
}
