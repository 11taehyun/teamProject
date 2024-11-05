package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.DTO.GoodsDTO;
import com.study.springboot.dao.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	GoodsDAO goodsDAO;
	
	@Override
	public int addGoods(GoodsDTO goodsDTO) {

		int result = 0;
//		for(int i=0; i<27; i++) {
//			String old = goodsDTO.getGoods_name();
//			goodsDTO.setGoods_name(old +"_"+ i);
			
		result = goodsDAO.addGoods(goodsDTO);
			
//			goodsDTO.setGoods_name(old);
//		}
		
		return result;
	}

	@Override
	public Map selectGoods(GoodsDTO goodsDTO) {
		List<GoodsDTO> list = goodsDAO.selectGoods(goodsDTO);
		
		int totalCount = goodsDAO.goodsTotalCount();
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public GoodsDTO viewGoods(String id) {
		
		GoodsDTO result = goodsDAO.viewGoods(id);
		
		return result;
	}

	@Override
	public int deleteGoods(int id) {

		int result = goodsDAO.deleteGoods(id);
		
		return result;
	}

	@Override
	public Map goodsSearch(GoodsDTO goodsDTO) {
		System.out.println("goodsDTO : "+ goodsDTO);
		
		List<GoodsDTO> list = goodsDAO.goodsSearch(goodsDTO);
		
		int totalCount = goodsDAO.searchTotalCount(goodsDTO);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public int updateGoods(GoodsDTO goodsDTO) {

		int result = goodsDAO.updateGoods(goodsDTO);
		
		return result;
	}

}
