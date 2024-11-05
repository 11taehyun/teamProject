package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.springboot.DTO.UserDTO;
import com.study.springboot.dao.AdminDAO;

public class AdminServiceImpl  implements AdminService{

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public Map userList(UserDTO userDTO) {
        List<UserDTO> list = adminDAO.userList(userDTO);
        
        int totalCount = adminDAO.totalCount();
        
        Map map = new HashMap();
        map.put("list", list);
        map.put("totalCount", totalCount);
        
        return map;
		
	}

}
