package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.DTO.UserDTO;

@Mapper
public interface AdminDAO {

    List<UserDTO> userList(UserDTO userDTO);
	
    int totalCount();
}
