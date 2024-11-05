<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/footer_style.css">
<link rel="stylesheet" href="/css/adminMain.css">
<link rel="stylesheet" href="/header/adminHeader.css">

</head>
<body>
    <jsp:include page="../header/adminHeader.jsp"/>
	
	<section id=content>
		<div id="title">
			<h2> 회원목록 조회 </h2>
		</div>
		<div>
			<table id="table">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>회원 id</th>
						<th>이름</th>
						<th>생일</th>
						<th>닉네임</th>
						<th>주소</th>
                        <th>상세주소</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입날짜</th>
<!-- 						<th>수정</th> -->
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
		                    <tr>
		                        <td colspan='12' style="height: 360px; font-size: 16px;">가입한 회원이 없습니다.</td>
		                    </tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${list }">
								<tr>
									<td>${item.user_id }</td>
									<td>${item.id }</td>
									<td>${item.name }</td>
									<td>${item.birth_date }</td>
									<td>${item.nickName }</td>
			                        <td>${item.address1 }</td>
			                        <td>${item.address2 }</td>
									<td>${item.phoneNum }</td>
									<td>${item.mail }</td>
									<td>${item.join_date }</td>
<!-- 									<td><a href=""><input type="button" value="수정"></a></td> -->
									<td>
										<input type="button" class="deleteUser" value="삭제">
										<input type="hidden" class="user_id" value="${item.user_id }">
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
					<a href="/adminMain?pageNum=<%= begin-1 %>&type=${type }&keyword=${keyword}">[이전]</a>
			<%
				}
			%>
            <% 
				for(int i=begin; i<=end; i++) {
			%> 
					<a href="/adminMain?pageNum=<%= i %>&type=${type }&keyword=${keyword}">
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
					<a href="/adminMain?pageNum=<%= end+1 %>&type=${type }&keyword=${keyword}">[다음]</a>
			<%
				}
			%>
        </div>
        <form action="/adminMain">
			<select name="type">
				<option value="name">이름</option>
				<option value="phoneNum">전화번호</option>
			</select> 
			<input type="text" name="keyword" placeholder="검색어를 입력하세요"> 
			<input type="submit" value="검색">
		</form>
	</section>

</body>
<jsp:include page="../footer/footer.jsp"/>

<!-- 회원 삭제 ajax -->
<script>
	let delete_btn = document.querySelectorAll(".deleteUser")
	let user_id = document.querySelectorAll(".user_id")
	for( let i=0; i<delete_btn.length; i++ ){
		delete_btn[i].addEventListener("click", function() {
			
			let id = user_id[i].value
			console.log("id 값 : ", id)
			
			const xhr = new XMLHttpRequest();
			
			let url = "/delete"
			xhr.open("POST", url)
			xhr.setRequestHeader("Content-Type", "application/json")
			
			let param = {
				user_id: id
			}
			console.log("param :", param)
			
			xhr.send(JSON.stringify(param))
			
			xhr.onload = function() {
				console.log(xhr.responseText);
				
				if( Number(xhr.responseText) != 0 ){
					location.href = "/adminMain?pageNum=${pageNum}&type=${type }&keyword=${keyword}"
				} else {
					alert("회원 삭제 실패")
				}
			}
		})
		
	}
</script>

</html>