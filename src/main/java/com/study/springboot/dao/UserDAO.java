package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.DTO.UserDTO;

@Mapper
public interface UserDAO {

	int joinUser(UserDTO userDTO);
	int idCheck(UserDTO userDTO);
	
	int loginCheck(UserDTO userDTO);
	
	UserDTO selectUserInfo(UserDTO userDTO);
	
	UserDTO selectUser(UserDTO userDTO);
	
	int updateUser(UserDTO userDTO);
	
	UserDTO findId(UserDTO userDTO);
	
	int updatePw(UserDTO userDTO);
	
	int deleteUser(int user_id);
	
	List<UserDTO> userList(UserDTO userDTO);
	int totalCount();
	
	List<UserDTO> userSearch(UserDTO userDTO);
	int searchTotalCount(UserDTO userDTO);
}
