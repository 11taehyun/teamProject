<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/header/blackheader.css">
<link rel="stylesheet" href="/css/footer_style.css">
<link rel="stylesheet" href="/css/mainGoodsList.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<!-- header영역 -->
	<jsp:include page="../header/blackHeader.jsp" />
	<section class="main">
		<nav class="categoryNav">
			<div class="category">
				<c:if test="${category1 eq '인기상품' }">
					<span class="mainTitle">인기상품</span>
					<a class="<c:if test="${category2 eq null || category2 eq ''}">focus</c:if>" href="/mainGoodsList?category1=인기상품">ALL</a>
					<a class="<c:if test="${category2 eq '상의' }">focus</c:if>" href="/mainGoodsList?category1=인기상품&category2=상의">상의</a>
					<a class="<c:if test="${category2 eq '하의' }">focus</c:if>" href="/mainGoodsList?category1=인기상품&category2=하의">하의</a>
					<a class="<c:if test="${category2 eq '아우터' }">focus</c:if>" href="/mainGoodsList?category1=인기상품&category2=아우터">아우터</a>
					<a class="<c:if test="${category2 eq '니트웨어' }">focus</c:if>" href="/mainGoodsList?category1=인기상품&category2=니트웨어">니트웨어</a>
					<a class="<c:if test="${category2 eq '이너웨어' }">focus</c:if>" href="/mainGoodsList?category1=인기상품&category2=이너웨어">이너웨어</a>
				</c:if>
				<c:if test="${category1 eq '여성의류' }">
					<span class="mainTitle">여성의류</span>
					<a class="<c:if test="${category2 eq null || category2 eq ''}">focus</c:if>" href="/mainGoodsList?category1=여성의류">ALL</a>
					<a class="<c:if test="${category2 eq '상의' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=상의">상의</a>
					<a class="<c:if test="${category2 eq '원피스' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=원피스">원피스</a>
					<a class="<c:if test="${category2 eq '하의' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=하의">하의</a>
					<a class="<c:if test="${category2 eq '치마' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=치마">스커트</a>
					<a class="<c:if test="${category2 eq '아우터' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=아우터">아우터</a>
					<a class="<c:if test="${category2 eq '니트웨어' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=니트웨어">니트웨어</a>
					<a class="<c:if test="${category2 eq '이너웨어' }">focus</c:if>" href="/mainGoodsList?category1=여성의류&category2=이너웨어">이너웨어</a>
				</c:if>
				<c:if test="${category1 eq '남성의류' }">
					<span class="mainTitle">남성의류</span>
					<a class="<c:if test="${category2 eq null || category2 eq ''}">focus</c:if>" href="/mainGoodsList?category1=남성의류">ALL</a>
					<a class="<c:if test="${category2 eq '상의' }">focus</c:if>" href="/mainGoodsList?category1=남성의류&category2=상의">상의</a>
					<a class="<c:if test="${category2 eq '하의' }">focus</c:if>" href="/mainGoodsList?category1=남성의류&category2=하의">하의</a>
					<a class="<c:if test="${category2 eq '아우터' }">focus</c:if>" href="/mainGoodsList?category1=남성의류&category2=아우터">아우터</a>
					<a class="<c:if test="${category2 eq '니트웨어' }">focus</c:if>" href="/mainGoodsList?category1=남성의류&category2=니트웨어">니트웨어</a>
					<a class="<c:if test="${category2 eq '이너웨어' }">focus</c:if>" href="/mainGoodsList?category1=남성의류&category2=이너웨어">이너웨어</a>
				</c:if>
				<c:if test="${category1 eq '아동상품' }">
					<span class="mainTitle">아동상품</span>
					<a class="<c:if test="${category2 eq null || category2 eq ''}">focus</c:if>" href="/mainGoodsList?category1=아동상품">ALL</a>
					<a class="<c:if test="${category2 eq '의류' }">focus</c:if>" href="/mainGoodsList?category1=아동상품&category2=의류">의류</a>
					<a class="<c:if test="${category2 eq '신발' }">focus</c:if>" href="/mainGoodsList?category1=아동상품&category2=신발">신발</a>
					<a class="<c:if test="${category2 eq '가방' }">focus</c:if>" href="/mainGoodsList?category1=아동상품&category2=가방">가방</a>
				</c:if>
				<c:if test="${category1 eq '뷰티상품' }">
					<span class="mainTitle">뷰티상품</span>
					<a class="<c:if test="${category2 eq null || category2 eq ''}">focus</c:if>" href="/mainGoodsList?category1=뷰티상품">ALL</a>
					<a class="<c:if test="${category2 eq '스킨케어' }">focus</c:if>" href="/mainGoodsList?category1=뷰티상품&category2=스킨케어">스킨케어</a>
					<a class="<c:if test="${category2 eq '메이크업' }">focus</c:if>" href="/mainGoodsList?category1=뷰티상품&category2=메이크업">메이크업</a>
					<a class="<c:if test="${category2 eq '향수' }">focus</c:if>" href="/mainGoodsList?category1=뷰티상품&category2=향수">향수</a>
					<a class="<c:if test="${category2 eq '바디케어' }">focus</c:if>" href="/mainGoodsList?category1=뷰티상품&category2=바디케어">바디케어</a>
					<a class="<c:if test="${category2 eq '헤어케어' }">focus</c:if>" href="/mainGoodsList?category1=뷰티상품&category2=헤어케어">헤어케어</a>
					<a class="<c:if test="${category2 eq '남성뷰티' }">focus</c:if>" href="/mainGoodsList?category1=뷰티상품&category2=남성뷰티">남성뷰티</a>
				</c:if>
			</div>
		</nav>
		<div class="goodsList">
			<c:choose>
				<c:when test="${empty list }">
					<span class="emptyGoods">등록된 상품이 없습니다.</span>
				</c:when>
				<c:otherwise>
					<ul>
						<c:forEach var="item" items="${list }">
							<li>
								<div>
									<a href="/mainGoodsView?goods_id=${item.goods_id }"><img class="thumb" alt="" src="/image/goods/women/${item.goods_img }"></a>	
								</div>
								<div class="border">
									<div class="name">${item.goods_brand }</div>
									<div class="desc">${item.goods_name }</div>
									<div class="price">
										<span class="dot"></span>
										<span>
											<fmt:formatNumber value="${item.goods_price }" pattern="###,###,###" />
										</span>
										원
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>
			<%
	// 			int lastPage = (int) request.getAttribute("total");
	// 			if(true) {
	// 				out.println("out.println : "+lastPage+"<br>");
	// 			}
	
				int total = (int) request.getAttribute("total");
				int countPerPage = (int) request.getAttribute("countPerPage");
				
	// 			ceil(101/10) == 11
				double lastPage = Math.ceil( (double)total / (double)countPerPage);
	
				// 페이징 그룹
				// 한 그룹당 보여줄 수
				int groupCount = 3;
				// 현재 페이지
				int pageNum = (int) request.getAttribute("pageNum");
				// 현재 속한 그룹
				double group = Math.floor((((double)pageNum - 1) / groupCount) + 1); 
				// 그룹의 시작 페이지, 끝 페이지
				int end = (int)group * groupCount;
				int begin = end - (groupCount - 1);
				System.out.println("group : "+ group);
				System.out.println("end : "+ end);
				System.out.println("begin : "+ begin);
				if(end > lastPage) {
					end = (int)lastPage;
				}
				
			%>
			<div class="pageNumber">
	            <% 
				if(begin != 1) {
				%>
						<a href="/mainGoodsList?pageNum=<%= begin-1 %>&category1=${category1 }&category2=${category2}">[이전]</a>
				<%
					}
				%>
	            <% 
					for(int i=begin; i<=end; i++) {
				%> 
						<a href="/mainGoodsList?pageNum=<%= i %>&category1=${category1 }&category2=${category2}">
							<c:set var="i2" value="<%= i %>" scope="page"/>
							<c:if test="${pageNum eq i2}">
								<strong style="text-decoration: underline; color: black;"><%= i %></strong>
							</c:if>
							<c:if test="${pageNum ne i2}">
								<%= i %>
							</c:if>
						</a>
				<% 
					}
				%>
				<% 
					if(end != lastPage) {
				%>
						<a href="/mainGoodsList?pageNum=<%= end+1 %>&category1=${category1 }&category2=${category2}">[다음]</a>
				<%
					}
				%>
			</div>
		</div>
	</section>
	
	<jsp:include page="../footer/footer.jsp"/>
	
	
	
	
	

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../js/blackHeader.js"></script>
</body>
</html>




