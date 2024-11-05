package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.DTO.JoinDTO;
import com.study.springboot.DTO.OrderDTO;

@Mapper
public interface OrderDAO {

	int orderGoods(OrderDTO orderDTO);
	
	List<JoinDTO> selectOrder(JoinDTO joinDTO);
	int orderCount(JoinDTO joinDTO);
	
	int dilivery1Count(JoinDTO joinDTO);
}
