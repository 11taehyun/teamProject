<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://xmlns.jcp.org/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/footer_style.css">
<link rel="stylesheet" href="/header/adminHeader.css">
<link rel="stylesheet" href="/css/goodsRegister.css">


</head>
<body>
	<jsp:include page="../header/adminHeader.jsp"/>
	<section id=content>
		<div id="title">
			<h2> 상품 등록 </h2>
		</div>
		<form action="addGoods" method="post" >
			<div class="main">
				<div class="category input">
<!-- 					<label class="cate">1차 분류</label> -->
<!-- 					<select class="category1" name="cetegory1"> -->
<!-- 						<option value="">전체</option> -->
<!-- 						<option value="">여성의류</option> -->
<!-- 					</select> -->
<!-- 					<label>2차 분류</label> -->
<!-- 					<select class="category2" name="cetegory2"> -->
<!-- 						<option value="">전체</option> -->
<!-- 					</select> -->
					<span>1차 분류</span>
					<input type="text" id="category1" name="goods_category1" placeholder="상품의 1차 카테고리를 입력하세요">
				</div>
				<div class="category input">
					<span>2차 분류</span>
					<input type="text" id="category2" name="goods_category2" placeholder="상품의 2차 카테고리를 입력하세요">
				</div>
				<div class="brand input">
					<span>브랜드</span>
					<input type="text" id="goods_brand" name="goods_brand" placeholder="상품의 브랜드를 입력하세요">
				</div>
				<div class="name input">
					<span>상품명</span>
					<input type="text" id="goods_name" name="goods_name" placeholder="상품명을 입력하세요">
				</div>
				<div class="price input">
					<span>상품 가격</span>
					<input type="text" id="goods_price" name="goods_price" placeholder="상품의 가격을 입력하세요">
				</div>
				<div class="quantity input">
					<span>상품 수량</span>
					<input type="number" id="goods_quantity" name="goods_quantity" placeholder="상품의 재고를 입력하세요">
				</div>
				<div class="img input">
					<span>상품 사진</span>
					<input type="file" id="goods_img" name="goods_img" >
				</div>
				<div class="features input">
					<span>상품 소개</span>
					<textarea rows="5" cols="50" id="goods_features" name="goods_features" placeholder="상품의 설명을 입력하세요"></textarea>
				</div>
				
				<div class="input">
					<button type="submit" id="submit_btn">등록</button>
				</div>
			</div>
		</form>
		        
	</section>

</body>
<jsp:include page="../footer/footer.jsp"/>

</html>