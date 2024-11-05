<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/mainGoodsView.css" rel="stylesheet">
<link rel="stylesheet" href="/header/blackheader.css">
<link rel="stylesheet" href="/css/footer_style.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>

	<!-- 헤더 영역 -->
	<jsp:include page="../header/blackHeader.jsp"/>
	
	<div class="container">
		
		<div class="row ph1"><h1 class="page-header">[${list.goods_category2 }] ${list.goods_name }</h1>
			<input type="hidden" value="${list.goods_id}" id="productId">
		</div>
		<div>
			<div class="viewImg">
				<img alt="productPhoto" src="/image/goods/women/${list.goods_img }">
				<div class="row productInfo">
					<div class="form-group ph2">
						<h3 class="page-header"><span>[${list.goods_category2 }] ${list.goods_name }</span><br><small>[봄 신상품 신규입고]</small></h3>
					</div>
					<div class="form-group g1" >
						<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${list.goods_price }" pattern="###,###,###" /></span><span>&nbsp;원</span>
						<input type="hidden" value="${list.goods_price}" id="price">
					</div>
					<div class="form-group g1">
						<label>배송비 : </label><span>&nbsp;2,500원</span>
						<p>도서산간지역 배송비 5,000원 / 3만원 이상 결제시 무료배송</p>
					</div>
					<div class="form-group g1">
						<label>적립금 : </label><span><fmt:parseNumber var="test" value="${list.goods_price / 100 }" integerOnly="true"/> ${test}&nbsp;원</span>
					</div>
		
					<c:choose>
						<c:when test="${list.goods_category1 != 'acc' && list.goods_category1 != 'bag'}">
							<div class="form-horizontal g1">
								<label>옵션 : </label> 
								<select class="form-control opt_select" name="selectedOpt">
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
								</select>
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>		
					<div class="form-horizontal g1" >
						<label>구매수량 : </label> 
						<select class="form-control" id="select_count">
						<c:forEach begin="1" end="${list.goods_quantity}" var="count">
							<option>${count }</option></c:forEach>
						</select>
					</div>	
					
					<div class="row select_btn">
						<div class="selected_option" style="text-align: right;">
						</div>
						<div class="btnAll">
							<button class="btn btn-order">주문하기</button>
							<button class="btn btn-cart">장바구니</button>
							<button class="btn btn-wishList">위시리스트</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<div class="container">
		<div>
			<div class="title">
				<h2>상품 상세 설명</h2>
			</div>
			<div class="mainImg">
				<img alt="" src="/image/goods/women/${list.goods_img }">
			</div>
		</div>
		<div>
			<div class="title">
				<h2>상품 리뷰</h2>
			</div>
			<div class="review">등록된 리뷰가 없습니다.</div>
		</div>
		<div>
			<div class="title">
				<h2>상품 Q&A</h2>
			</div>
			<div>
				<table id="table">
					<colgroup>
						<col width="7%">
						<col width="13%">
						<col width="10%">
						<col width="auto">
						<col width="12%">
						<col width="13%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>답변여부</th>
							<th>구분</th>
							<th>내용</th>
							<th>작성자</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="6" style="height: 360px; font-size: 16px;">등록된 Q&A가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="../footer/footer.jsp"/>	


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../js/blackHeader.js"></script>
	
	<script>
	$("#select_count").on('input', function() {
		var count = $(this).val();
		var price = $("#price").val();
		var opt = $(".opt_select").val();
		
		
		if (count*price >= 30000) {
			var shipping = '무료배송';
			var finalPrice = count*price;
		} else {
			var shipping = 2500;
			var finalPrice = (count*price) + shipping;
		}
		
		var str = '';
		
		str += '<p><label>수량 : </label><span>&nbsp;' + count + '</span>&nbsp;&nbsp;&nbsp;';	
		
		if (opt != 'S' && opt != 'M' && opt != 'L') {
			str += '<lable></lable>';
		} else {
			str += '<label>옵션 : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
		}
		
		str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
		str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
		str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
		str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
		
		$(".selected_option").html(str);
	});
	
	
	let btn_order = document.querySelector(".btn-order")
	btn_order.addEventListener("click", function(){
		let goods_id = document.querySelector("#productId").value
		let count = document.querySelector("#select_count").value
		let option = document.querySelector(".opt_select").value
		
		console.log("상품 id : ", goods_id);
		console.log("count : ", count);
		console.log("옵션 : ", option);
		
		const xhr = new XMLHttpRequest();
		
		let url = "/orderGoods";
		xhr.open("POST", url);
		xhr.setRequestHeader("Content-Type", "application/json");
		
		let param = {
			goods_id: goods_id,
			order_qty: count,
			order_option: option
		}
		console.log("param : ", param);
		
		xhr.send(JSON.stringify(param));
		
		xhr.onload = function(){
			console.log(xhr.responseText);
			
			if( Number(xhr.responseText) == 1 ){
				alert("상품이 정상적으로 주문되었습니다.")
			} else if( Number(xhr.responseText) == -1 ){
				alert("로그인 후 주문해 주세요")
				location.href = "/login";
			} else {
				alert("상품 주문 실패");
			}
		}
	})
	
	
	
	</script>
</body>
</html>









