package com.study.springboot.service;

import java.util.Map;

import com.study.springboot.DTO.JoinDTO;
import com.study.springboot.DTO.OrderDTO;

public interface OrderService {

	int orderGoods(OrderDTO orderDTO);
	
	Map selectOrder(JoinDTO joinDTO);
}
