package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.DTO.UserDTO;

public interface UserService {

	
	int joinUser(UserDTO userDTO);
	int idCheck(UserDTO userDTO);
	
	Map loginCheck(UserDTO userDTO);
	
	UserDTO selectUser(UserDTO userDTO);
	
	int updateUser(UserDTO userDTO);
	
	UserDTO findId(UserDTO userDTO);
	
	int updatePw(UserDTO userDTO);
	
	int pwCheck(UserDTO userDTO);
	
	int deleteUser(int user_id);
	
	Map userList(UserDTO userDTO);
	
	Map userSearch(UserDTO userDTO);
}
