package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.DTO.JoinDTO;
import com.study.springboot.DTO.OrderDTO;
import com.study.springboot.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public int orderGoods(OrderDTO orderDTO) {

		int result = orderDAO.orderGoods(orderDTO);
		
		return result;
	}

	@Override
	public Map selectOrder(JoinDTO joinDTO) {
		
		List<JoinDTO> list = orderDAO.selectOrder(joinDTO);
		
		int d1Count = orderDAO.dilivery1Count(joinDTO);
		
		int totalCount = orderDAO.orderCount(joinDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("d1Count", d1Count);
		map.put("totalCount", totalCount);
		
		return map;
	}

}
