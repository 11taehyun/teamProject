package com.study.springboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.DTO.GoodsDTO;
import com.study.springboot.DTO.OrderDTO;
import com.study.springboot.service.GoodsService;
import com.study.springboot.service.OrderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainPageController {

	@Autowired
	GoodsService goodsService;
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/mainPage")
	public String mainPage() {
		
		return "main/mainPage";
	}
	
	@RequestMapping("/mainGoodsList")
	public String mainGoodsList(
			@RequestParam(value="pageNum", required=false)
			Integer pageNum,
			HttpServletRequest request,
			GoodsDTO goodsDTO,
			Model model
	) {
		System.out.println("pageNum : "+ pageNum);
		if( pageNum == null ) {
			pageNum = 1;
		}
		
		String cpp = request.getParameter("countPerPage");
		int countPerPage = 12;
		try {
			
			countPerPage = Integer.parseInt(cpp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int startNum = ((pageNum-1) * countPerPage) + 1;
		int endNum = startNum + (countPerPage - 1);
		System.out.println("startNum : "+ startNum + ", "+ "endNum : "+ endNum);
		
		goodsDTO.setStartNum(startNum);
		goodsDTO.setEndNum(endNum);
		
		request.setAttribute("pageNum", pageNum);
		model.addAttribute("countPerPage", countPerPage);
		
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		System.out.println("분류 1 : "+ category1);
		System.out.println("분류 2 : "+ category2);
		
		goodsDTO.setCategory1(category1);
		goodsDTO.setCategory2(category2);
		
		Map map = goodsService.goodsSearch(goodsDTO);
		List<GoodsDTO> list = (List<GoodsDTO>) map.get("list");
		model.addAttribute("list", list);
		
		int total = (int) map.get("totalCount");		
		request.setAttribute("total", total);
		
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		
		return "main/mainGoodsList";
	}
	
	@RequestMapping("/mainGoodsView")
	public String mainGoodsView(
			GoodsDTO goodsDTO,
			Model model,
			@RequestParam("goods_id") String id
	) {
		GoodsDTO list = goodsService.viewGoods(id);
		model.addAttribute("list", list);
		
		return "main/mainGoodsView";
	}
	
	@RequestMapping("/orderGoods")
	@ResponseBody
	public int orderGoods(
			@RequestBody OrderDTO orderDTO,
			HttpServletRequest request
	) {
		HttpSession session = request.getSession();
		
		String login = (String) session.getAttribute("login");
		System.out.println("로그인 여부 : "+ login);
		
		if( login == null || !"ok".equals(login) ) {
			return -1;
		}
		
		int user_id = (int) session.getAttribute("user_id");
		System.out.println("user_id : "+ user_id);
		
		orderDTO.setUser_id(user_id);
		
		int result = orderService.orderGoods(orderDTO);
		System.out.println("상품 주문 결과 : "+ result);
		
		return result;
	}
}






