package com.study.springboot.DTO;

import java.sql.Date;

import lombok.Data;

@Data
public class UserDTO {
	private int user_id;
	private String id;
	private String name;
	private String psw;
	private String nickName;
	private String mail;
	private String address1;
	private String address2;
	private Date birth_date;
	private String phoneNum;
	private Date join_date;
	private String contact;
	private int grade;
	
	private int startNum;
	private int endNum;
	
}
