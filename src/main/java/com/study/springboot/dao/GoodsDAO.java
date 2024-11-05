package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.DTO.GoodsDTO;

@Mapper
public interface GoodsDAO {

	int addGoods(GoodsDTO goodsDTO);
	
	int goodsTotalCount();
	List<GoodsDTO> selectGoods(GoodsDTO goodsDTO);
	
	GoodsDTO viewGoods(String id);
	
	int deleteGoods(int id);
	
	List<GoodsDTO> goodsSearch(GoodsDTO goodsDTO);
	int searchTotalCount(GoodsDTO goodsDTO);
	
	int updateGoods(GoodsDTO goodsDTO);
}
