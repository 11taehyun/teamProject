<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/footer_style.css">
<link rel="stylesheet" href="/css/goodsList.css" >
<link rel="stylesheet" href="/header/adminHeader.css">

</head>
<body>
    <jsp:include page="../header/adminHeader.jsp"/>
	
	<section id=content>
		<div id="title">
			<h2> 상품목록 조회 </h2>
		</div>
		<div>
			<table id="table">
				<thead>
					<tr>
						<th>브랜드</th>
						<th>상품명</th>
						<th>상품 가격</th>
						<th>상품사진</th>
						<th>1차 분류</th>
						<th>2차 분류</th>
                        <th>상품 재고</th>
						<th>상품 소개</th>
						<th>상품등록일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
		                    <tr>
		                        <td colspan='12' style="height: 360px; font-size: 16px;">등록한 상품이 없습니다.</td>
		                    </tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${list }">
								<tr>
									<td>${item.goods_brand }</td>
									<td>${item.goods_name }</td>
									<td><fmt:formatNumber value="${item.goods_price }" pattern="###,###,###" /></td>
									<td>${item.goods_img }</td>
									<td>${item.goods_category1 }</td>
			                        <td>${item.goods_category2 }</td>
			                        <td>${item.goods_quantity }</td>
									<td>${item.goods_features }</td>
									<td>${item.goods_addDate }</td>
									<td><a href="/modifyGoods?goods_id=${item.goods_id }"><input type="button" value="수정"></a></td>
									<td>
										<input type="button" class="deleteGoods" value="삭제">
										<input type="hidden" class="goods_id" value="${item.goods_id }">
									</td>
								</tr>
							</c:forEach>
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
					
				</tbody>
				
			</table>
		</div>
		        
<!--         <div class="pageNumber"> -->
<!--             <a href="">[이전]</a> -->
<!--             <a href="">1</a> -->
<!--             <a href="">2</a> -->
<!--             <a href="">3</a> -->
<!--             <a href="">[다음]</a> -->
<!--         </div> -->
        <div class="pageNumber">
            <% 
			if(begin != 1) {
			%>
					<a href="/goodsList?pageNum=<%= begin-1 %>&type=${type}&keyword=${keyword}">[이전]</a>
			<%
				}
			%>
            <% 
				for(int i=begin; i<=end; i++) {
			%> 
					<a href="/goodsList?pageNum=<%= i %>&type=${type}&keyword=${keyword}">
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
					<a href="/goodsList?pageNum=<%= end+1 %>&type=${type}&keyword=${keyword}">[다음]</a>
			<%
				}
			%>
        </div>
        <form action="/goodsList">
		<select name="type">
			<option value="goods_name">상품명</option>
			<option value="goods_category1">카테고리</option>
		</select> 
		<input type="text" name="keyword" placeholder="검색어를 입력하세요"> 
		<input type="submit" value="검색">
		</form>
	</section>

</body>
<jsp:include page="../footer/footer.jsp"/>

<!-- 상품 삭제 ajax -->
<script>
	let delete_btn = document.querySelectorAll(".deleteGoods")
	let goods_id = document.querySelectorAll(".goods_id")
	for( let i=0; i<delete_btn.length; i++ ){
		delete_btn[i].addEventListener("click", function() {
			
			let id = goods_id[i].value
			console.log("id 값 : ", id)
			
			const xhr = new XMLHttpRequest();
			
			let url = "/deleteGoods"
			xhr.open("POST", url)
			xhr.setRequestHeader("Content-Type", "application/json")
			
			let param = {
				goods_id: id
			}
			console.log("param :", param)
			
			xhr.send(JSON.stringify(param))
			
			xhr.onload = function() {
				console.log(xhr.responseText);
				
				if( Number(xhr.responseText) != 0 ){
					location.href = "/goodsList?pageNum=${pageNum}&type=${type }&keyword=${keyword}"
				} else {
					alert("상품 삭제 실패")
				}
			}
		})
		
	}
</script>

</html>