package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.DTO.UserDTO;
import com.study.springboot.common.Const;
import com.study.springboot.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public int joinUser(UserDTO userDTO) {
		
		int result = 0;
//		for(int i=0; i<15; i++) {
//			String old = userDTO.getId();
//			userDTO.setId(old +"_"+ i);
			
		result = userDAO.joinUser(userDTO);
			
//			userDTO.setId(old);
//		}
		
		
		return result; 
	}

	@Override
	public int idCheck(UserDTO userDTO) {
		int result = -1;
		
		int countId = userDAO.idCheck(userDTO);
		
		if( countId == 0 ) {
			result = countId;
		} else {
			result = Const.CODE_JOIN_DUP_ID;
		}
		
		return result;
	}

	@Override
	public Map loginCheck(UserDTO userDTO) {
		int count = userDAO.loginCheck(userDTO);
		
		UserDTO dto = userDAO.selectUserInfo(userDTO);
		
		Map map = new HashMap();
		
		map.put("count", count);
		map.put("dto", dto);
		
		return map;
	}

	@Override
	public UserDTO selectUser(UserDTO userDTO) {
		
		UserDTO result = userDAO.selectUser(userDTO);
		
		return result;
	}

	@Override
	public int updateUser(UserDTO userDTO) {

		int result = userDAO.updateUser(userDTO);
		
		return result;
	}

	@Override
	public UserDTO findId(UserDTO userDTO) {
		
		UserDTO result = userDAO.findId(userDTO);
		
		return result;
	}

	@Override
	public int updatePw(UserDTO userDTO) {
		
		int result = userDAO.updatePw(userDTO);
		
		return result;
	}

	@Override
	public int pwCheck(UserDTO userDTO) {

		int result = -1;
		
		int countId = userDAO.loginCheck(userDTO);
		
		if( countId == 1 ) {
			result = countId;
		}
		
		return result;
	}

	@Override
	public int deleteUser(int user_id) {
		
		int result = userDAO.deleteUser(user_id);
		
		return result;
	}

	@Override
	public Map userList(UserDTO userDTO) {
		List<UserDTO> list = userDAO.userList(userDTO);
		
		int totalCount = userDAO.totalCount();
        
        Map map = new HashMap();
        map.put("list", list);
        map.put("totalCount", totalCount);
        
        return map;
	}

	@Override
	public Map userSearch(UserDTO userDTO) {
		
		List<UserDTO> list = userDAO.userSearch(userDTO);
		
		int totalCount = userDAO.searchTotalCount(userDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

}
