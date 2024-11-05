package com.study.springboot.service;

import java.util.Map;

import com.study.springboot.DTO.GoodsDTO;

public interface GoodsService {

	int addGoods(GoodsDTO goodsDTO);
	
	Map selectGoods(GoodsDTO goodsDTO);
	
	Map goodsSearch(GoodsDTO goodsDTO);
	
	GoodsDTO viewGoods(String id);
	
	int deleteGoods(int goods_id);
	
	int updateGoods(GoodsDTO goodsDTO);
}
