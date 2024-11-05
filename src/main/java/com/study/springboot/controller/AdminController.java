package com.study.springboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.DTO.GoodsDTO;
import com.study.springboot.DTO.UserDTO;
import com.study.springboot.service.GoodsService;
import com.study.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	GoodsService goodsService;
	
//	@RequestMapping("/adminMain")
//	public String adminMain(
//			HttpServletRequest request,
//			UserDTO userDTO,
//			Model model
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		if(login == null || !"ok".equals(login)) {
//			return "main/mainPage";
//		}
//		
//		int grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 여부 : "+ grade);
//		if( grade != 1 ) {
//			return "main/mainPage";
//		}
//		
//		Map map = userService.userList(userDTO);
//		
//		List<UserDTO> list = (List<UserDTO>) map.get("list");
//		model.addAttribute("list", list);
//		
//		return "/admin/adminMain";
//	}
	
	// 검색값을 유지하는 컨트롤러를 만들기 전
//	@RequestMapping("/adminMain")
//	public String adminMain(
//			@RequestParam(value="pageNum", required=false)
//			Integer pageNum,
//			HttpServletRequest request,
//			UserDTO userDTO,
//			Model model
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		if(login == null || !"ok".equals(login)) {
//			return "main/mainPage";
//		}
//		
//		int grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 여부 : "+ grade);
//		if( grade != 1 ) {
//			return "main/mainPage";
//		}
//
//		
//		System.out.println("pageNum : "+ pageNum);
//		if( pageNum == null ) {
//			pageNum = 1;
//		}
//		
//		String cpp = request.getParameter("countPerPage");
//		int countPerPage = 10;
//		try {
//			
//			countPerPage = Integer.parseInt(cpp);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int startNum = ((pageNum-1) * countPerPage) + 1;
//		int endNum = startNum + (countPerPage - 1);
//		System.out.println("startNum : "+ startNum + ", "+ "endNum : "+ endNum);
//		
//		userDTO.setStartNum(startNum);
//		userDTO.setEndNum(endNum);
//		
//		request.setAttribute("pageNum", pageNum);
//		model.addAttribute("countPerPage", countPerPage);
//		
//		Map map = userService.userList(userDTO);
//		
//		List<UserDTO> list = (List<UserDTO>) map.get("list");
//		model.addAttribute("list", list);
//		
//		int total = (int) map.get("totalCount");		
//		request.setAttribute("total", total);
//		
//		return "/admin/adminMain";
//	}
	
	// 유저리스트 검색값 유지를 위해 수정한 회원목록 컨트롤러
	@RequestMapping("/adminMain")
	public String adminMain(
			@RequestParam(value="pageNum", required=false)
			Integer pageNum,
			@RequestParam(value="type", required=false)
			String type,
			@RequestParam(value="keyword", required=false)
			String keyword,
			HttpServletRequest request,
			UserDTO userDTO,
			Model model
	) {
		HttpSession session = request.getSession();
		
		String login = (String) session.getAttribute("login");
		System.out.println("로그인 여부 : "+ login);
		if(login == null || !"ok".equals(login)) {
			return "main/mainPage";
		}
		
		int grade = (int) session.getAttribute("user_grade");
		System.out.println("관리자 권한 여부 : "+ grade);
		if( grade != 1 ) {
			return "main/mainPage";
		}

		
		System.out.println("pageNum : "+ pageNum);
		if( pageNum == null ) {
			pageNum = 1;
		}
		
		String cpp = request.getParameter("countPerPage");
		int countPerPage = 10;
		try {
			
			countPerPage = Integer.parseInt(cpp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int startNum = ((pageNum-1) * countPerPage) + 1;
		int endNum = startNum + (countPerPage - 1);
		System.out.println("startNum : "+ startNum + ", "+ "endNum : "+ endNum);
		
		userDTO.setStartNum(startNum);
		userDTO.setEndNum(endNum);
		
		request.setAttribute("pageNum", pageNum);
		model.addAttribute("countPerPage", countPerPage);
		
		System.out.println("type : "+ type);
		System.out.println("keyword : "+ keyword);
		
		if( "name".equals(type) ) {
			userDTO.setName(keyword);
		} else if( "phoneNum".equals(type) ) {
			userDTO.setPhoneNum(keyword);
		}
		
		Map map = userService.userSearch(userDTO);
		
		List<UserDTO> list = (List<UserDTO>) map.get("list");
		model.addAttribute("list", list);
		
		int total = (int) map.get("totalCount");		
		request.setAttribute("total", total);
		
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		
		return "/admin/adminMain";
	}
	
//	// 회원 삭제 (ajax 사용 전)
//	@RequestMapping("/delete")
//	public String delete(
//			@RequestParam("user_id") int user_id,
//			HttpServletRequest request
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		if(login == null || !"ok".equals(login)) {
//			return "main/mainPage";
//		}
//		
//		int grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 여부 : "+ grade);
//		if( grade != 1 ) {
//			return "main/mainPage";
//		}
//		
//		int deleteResult = userService.deleteUser(user_id);
//		System.out.println("회원 삭제 결과 : "+ deleteResult);
//		
//		return "redirect:/adminMain";
//	}
	
	// 회원 삭제
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(
			@RequestBody UserDTO userDTO
	) {
		int user_id = userDTO.getUser_id();
		System.out.println("삭제할 유저 id번호 : "+ user_id);
		
		int deleteResult = userService.deleteUser(user_id);
		System.out.println("회원 삭제 결과 : "+ deleteResult);
		
		return deleteResult;
	}
	
	// 검색값을 유지하는 컨트롤러를 만들기 전 회원검색 컨트롤러
//	@RequestMapping("/userSearch")
//	public String userSearch(
//			@RequestParam(value="pageNum", required=false)
//			Integer pageNum,
//			UserDTO userDTO,
//			Model model,
//			HttpServletRequest request
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		if(login == null || !"ok".equals(login)) {
//			return "main/mainPage";
//		}
//		
//		int grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 여부 : "+ grade);
//		if( grade != 1 ) {
//			return "main/mainPage";
//		}
//		
//		System.out.println("pageNum : "+ pageNum);
//		if( pageNum == null ) {
//			pageNum = 1;
//		}
//		
//		String cpp = request.getParameter("countPerPage");
//		int countPerPage = 10;
//		try {
//			
//			countPerPage = Integer.parseInt(cpp);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int startNum = ((pageNum-1) * countPerPage) + 1;
//		int endNum = startNum + (countPerPage - 1);
//		System.out.println("startNum : "+ startNum + ", "+ "endNum : "+ endNum);
//		
//		userDTO.setStartNum(startNum);
//		userDTO.setEndNum(endNum);
//		
//		request.setAttribute("pageNum", pageNum);
//		model.addAttribute("countPerPage", countPerPage);
//		
//		String type = request.getParameter("type");
//		String keyword = request.getParameter("keyword");
//		System.out.println("type : "+ type);
//		System.out.println("keyword : "+ keyword);
//		
//		if( "name".equals(type) ) {
//			userDTO.setName(keyword);
//		} else if( "phoneNum".equals(type) ) {
//			userDTO.setPhoneNum(keyword);
//		}
//		
//		Map map = userService.userSearch(userDTO);
//		List<UserDTO> list = (List<UserDTO>) map.get("list");
//		
//		model.addAttribute("list", list);
//		
//		int total = (int) map.get("totalCount");
//		System.out.println("totalCount : "+ total);
//		request.setAttribute("total", total);
//		
//		return "admin/adminMain";
//	}
	
	// 상품 등록 페이지
	@RequestMapping("/goodsRegister")
	public String goodsRegister(
			HttpServletRequest request
	) {
		HttpSession session = request.getSession();
		
		String login = (String) session.getAttribute("login");
		System.out.println("로그인 여부 : "+ login);
		
		if( login == null || !"ok".equals(login) ) {
			return "redirect:/mainPage";
		}
		
		int user_grade = (int) session.getAttribute("user_grade");
		System.out.println("관리자 권한 등급 : "+ user_grade);
		
		if( user_grade != 1 ) {
			return "redirect:/mainPage";
		}
		
		return "admin/goodsRegister";
	}
	
	// 상품 등록 form
	@RequestMapping(value="/addGoods", method=RequestMethod.POST)
	public String addGoods(
			HttpServletRequest request,
			GoodsDTO goodsDTO,
			Model model
	) {
		
		
		int result = goodsService.addGoods(goodsDTO);
		System.out.println("상품 등록 결과 : "+ result);
		
		return "redirect:/goodsList";
	}
	
//	@RequestMapping(value="/addGoods", method=RequestMethod.POST)
//	public String addGoods(
//			GoodsDTO goodsDTO,
//			MultipartFile multipartFile
//	) {
//		String filename = "";
//		// 첨부파일이 있으면
//		if( !goodsDTO.getGoods_img().isEmpty() ) {
//			filename = goodsDTO.getGoods_img().;
//		}
//		
//		
//		return "";
//	}
	
	// 검색 결과 유지를 위한 수정 전 상품리스트 컨트롤러
//	@RequestMapping("/goodsList")
//	public String goodsList(
//			@RequestParam(value="pageNum", required=false)
//			Integer pageNum,
//			HttpServletRequest request,
//			GoodsDTO goodsDTO,
//			Model model
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		
//		if( login == null || !"ok".equals(login) ) {
//			return "redirect:/mainPage";
//		}
//		
//		int user_grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 등급 : "+ user_grade);
//		
//		if( user_grade != 1 ) {
//			return "redirect:/mainPage";
//		}
//		
//		System.out.println("pageNum : "+ pageNum);
//		if( pageNum == null ) {
//			pageNum = 1;
//		}
//		
//		String cpp = request.getParameter("countPerPage");
//		int countPerPage = 10;
//		try {
//			
//			countPerPage = Integer.parseInt(cpp);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int startNum = ((pageNum-1) * countPerPage) + 1;
//		int endNum = startNum + (countPerPage - 1);
//		System.out.println("startNum : "+ startNum + ", "+ "endNum : "+ endNum);
//		
//		goodsDTO.setStartNum(startNum);
//		goodsDTO.setEndNum(endNum);
//		
//		request.setAttribute("pageNum", pageNum);
//		model.addAttribute("countPerPage", countPerPage);
//		
//		Map map = goodsService.selectGoods(goodsDTO);
//		List<GoodsDTO> list = (List<GoodsDTO>) map.get("list");
//		model.addAttribute("list", list);
//		
//		int total = (int) map.get("totalCount");		
//		request.setAttribute("total", total);
//		
//		return "admin/goodsList";
//	}
	
	// 검색 결과 유지를 위한 수정 전 상품검색 컨트롤러 
//	@RequestMapping("/goodsSearch")
//	public String goodsSearch(
//			@RequestParam(value="pageNum", required=false)
//			Integer pageNum,
//			GoodsDTO goodsDTO,
//			Model model,
//			HttpServletRequest request
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		if(login == null || !"ok".equals(login)) {
//			return "main/mainPage";
//		}
//		
//		int grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 여부 : "+ grade);
//		if( grade != 1 ) {
//			return "main/mainPage";
//		}
//		
//		System.out.println("pageNum : "+ pageNum);
//		if( pageNum == null ) {
//			pageNum = 1;
//		}
//		
//		String cpp = request.getParameter("countPerPage");
//		int countPerPage = 10;
//		try {
//			
//			countPerPage = Integer.parseInt(cpp);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		int startNum = ((pageNum-1) * countPerPage) + 1;
//		int endNum = startNum + (countPerPage - 1);
//		System.out.println("startNum : "+ startNum + ", "+ "endNum : "+ endNum);
//		
//		goodsDTO.setStartNum(startNum);
//		goodsDTO.setEndNum(endNum);
//		
//		request.setAttribute("pageNum", pageNum);
//		model.addAttribute("countPerPage", countPerPage);
//		
//		String type = request.getParameter("type");
//		String keyword = request.getParameter("keyword");
//		System.out.println("type : "+ type);
//		System.out.println("keyword : "+ keyword);
//		
//		if( "goods_name".equals(type) ) {
//			goodsDTO.setGoods_name(keyword);
//		} else if( "goods_category1".equals(type) ) {
//			goodsDTO.setGoods_category1(keyword);
//		}
//		
//		Map map = goodsService.goodsSearch(goodsDTO);
//		List<GoodsDTO> list = (List<GoodsDTO>) map.get("list");
//		
//		model.addAttribute("list", list);
//		
//		int total = (int) map.get("totalCount");
//		System.out.println("totalCount : "+ total);
//		request.setAttribute("total", total);
//		
//		return "admin/goodsList";
//	}
	
	// 검색결과 유지 수정 후 상품목록 조회 컨트롤러
	@RequestMapping("/goodsList")
	public String goodsList(
			@RequestParam(value="pageNum", required=false)
			Integer pageNum,
			HttpServletRequest request,
			GoodsDTO goodsDTO,
			Model model
	) {
		HttpSession session = request.getSession();
		
		String login = (String) session.getAttribute("login");
		System.out.println("로그인 여부 : "+ login);
		
		if( login == null || !"ok".equals(login) ) {
			return "redirect:/mainPage";
		}
		
		int user_grade = (int) session.getAttribute("user_grade");
		System.out.println("관리자 권한 등급 : "+ user_grade);
		
		if( user_grade != 1 ) {
			return "redirect:/mainPage";
		}
		
		System.out.println("pageNum : "+ pageNum);
		if( pageNum == null ) {
			pageNum = 1;
		}
		
		String cpp = request.getParameter("countPerPage");
		int countPerPage = 8;
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
		
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		System.out.println("type : "+ type);
		System.out.println("keyword : "+ keyword);
		
		if( "goods_name".equals(type) ) {
			goodsDTO.setGoods_name(keyword);
		} else if( "goods_category1".equals(type) ) {
			goodsDTO.setGoods_category1(keyword);
		}
		
		Map map = goodsService.goodsSearch(goodsDTO);
		List<GoodsDTO> list = (List<GoodsDTO>) map.get("list");
		model.addAttribute("list", list);
		
		int total = (int) map.get("totalCount");		
		request.setAttribute("total", total);
		
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		
		return "admin/goodsList";
	}
	
	@RequestMapping("modifyGoods")
	public String modifyGoods(
			HttpServletRequest request,
			GoodsDTO goodsDTO,
			Model model,
			@RequestParam("goods_id") String id
	) {
		HttpSession session = request.getSession();
		
		String login = (String) session.getAttribute("login");
		System.out.println("로그인 여부 : "+ login);
		
		if( login == null || !"ok".equals(login) ) {
			return "redirect:/mainPage";
		}
		
		int user_grade = (int) session.getAttribute("user_grade");
		System.out.println("관리자 권한 등급 : "+ user_grade);
		
		if( user_grade != 1 ) {
			return "redirect:/mainPage";
		}
		
		GoodsDTO list = goodsService.viewGoods(id);
		model.addAttribute("list", list);
		
		return "admin/modifyGoods";
	}
	
	@RequestMapping(value="/modifyGoodsForm", method=RequestMethod.POST)
	public String modifyGoodsForm(
			HttpServletRequest request,
			@RequestParam("goods_id") int goods_id,
			GoodsDTO goodsDTO
	) {
//		HttpSession session = request.getSession();
		
//		int goods_id = (int) session.getAttribute("goods_id");
		System.out.println("수정할 상품 id : "+ goods_id);
		
		goodsDTO.setGoods_id(goods_id);
		
		int updateResult = goodsService.updateGoods(goodsDTO);
		System.out.println("상품 수정 결과 : "+ updateResult);
		
		return "redirect:/goodsList";
	}
	
	// 상품삭제(ajax 사용 전)
//	@RequestMapping("/deleteGoods")
//	public String deleteGoods(
//			HttpServletRequest request,
//			GoodsDTO goodsDTO,
//			@RequestParam("goods_id") String id
//	) {
//		HttpSession session = request.getSession();
//		
//		String login = (String) session.getAttribute("login");
//		System.out.println("로그인 여부 : "+ login);
//		
//		if( login == null || !"ok".equals(login) ) {
//			return "redirect:/mainPage";
//		}
//		
//		int user_grade = (int) session.getAttribute("user_grade");
//		System.out.println("관리자 권한 등급 : "+ user_grade);
//		
//		if( user_grade != 1 ) {
//			return "redirect:/mainPage";
//		}
//		
//		int result = (int) goodsService.deleteGoods(id);
//		System.out.println("상품 삭제 결과 : "+ result);
//		
//		return "redirect:/goodsList";
//	}
	
	// 상품 삭제
	@RequestMapping("/deleteGoods")
	@ResponseBody
	public int deleteGoods(
			@RequestBody GoodsDTO goodsDTO
	) {
		int goods_id = goodsDTO.getGoods_id();
		System.out.println("삭제할 상품 id번호 : "+ goods_id);
		
		int deleteResult = goodsService.deleteGoods(goods_id);
		System.out.println("회원 삭제 결과 : "+ deleteResult);
		
		return deleteResult;
	}
	
	
}













