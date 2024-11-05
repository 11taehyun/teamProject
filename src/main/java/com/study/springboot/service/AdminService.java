package com.study.springboot.service;

import java.util.Map;

import com.study.springboot.DTO.UserDTO;

public interface AdminService {
	
    Map userList(UserDTO userDTO);

}
