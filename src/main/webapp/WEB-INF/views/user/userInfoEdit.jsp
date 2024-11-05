<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보확인</title>
<link rel="stylesheet" href="/header/blackheader.css">
<link rel="stylesheet" href="/css/footer_style.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
	* {
            margin: 0;
            padding: 0;
        }
        /* div {
            border: 1px solid red;
        } */
        #all_section {
            width: 100%;
            height: auto;
        }
        #top_section {
            width: 100%;
            height: 250px;
            background-color: black;
        }
        #top_section .user_img {
            width: 10em;
            height: auto;
            margin-top: 1em;
            margin-left: 6em;
            display: inline-block;
            background-color: white;
            border: 5px solid #bfbfbf;
            border-radius: 70%;
            overflow: hidden;
        }
        #top_section .user_img img {
            width: 100%;
            height: 100%;
        }
        #top_section .user_nick {
            text-align: center;
            vertical-align: top;
            display: inline-block;
            margin-top: 3em;
            margin-left: 2em;
            margin-right: 4em;
            width: auto;
        }
        #top_section .user_nick .user_nick2 {
            color: white;
            font-size: 4em;
        }
        /* #top_section .user_nick .user_nick2>input {
        	border: none;
            background-color: black;
            box-sizing: border-box;
            color: white;
            width: auto;
            font-size: 100%;
            resize: horizontal;
        } */
        #top_section .user_nick .user_nick3 {
            margin-top: 0.6em;
        }
        #top_section .user_nick a {
            color: #bfbfbf;
            text-decoration: none;
        }
        #top_section .user_point {
            margin-top: 4em;
            display: inline-block;
            width: auto;
            vertical-align: top;
        }
        #top_section .user_point .user_point2 {
            display: inline-block;
            color: white;
            text-decoration: none;
            font-size: 1em;
            margin-right: 3em;
        }
        #top_section .user_point .user_point2 p {
            margin-top: 0.3em;
            font-size: 3em;
        }
        #main {
            width: 100%;
            height: auto;
            box-sizing: border-box;
            padding-left: 2.5em;
            padding-right: 2.5em;
        }
        #main .title {
            margin-top: 1.5em;
            border-left: 8px dashed black;
            border-bottom: 4px solid black;
            padding-left: 2.5em;
            padding-bottom: 0.6em;
        }
        #main .user_info, .check_section {
            margin-top: 1.5em;
            padding-left: 1.3em;
            padding-bottom: 1em;
            border-bottom: 0.2em solid #bfbfbf;
        }
        #main .user_info .user_info_mini_title {
            margin-top: 1.5em;
            font-size: 1.2em;
        }
        #main .user_info .user_info_mini_title .input_base {
            margin-top: 0.1em;
            border: none;
            font-size: 1em;
            vertical-align: top;
        }
        #main .user_info div span {
            display: inline-block;
            width: 4em;
            padding-right: 2em;
        }
        #main .user_info .user_info_mini_title .search_add {
            width: 5em;
            height: 2em;
            margin-left: 1em;
            vertical-align: top;
            background-color: #262626;
            color: #d9d9d9;
            border: none;
        }
        #main .user_info .user_info_mini_title .add {
            margin-top: 0.4em;
            border: 1px solid black;
            font-size: 1em;
        }
        .save {
            background-color: #262626;
            color: #d9d9d9;
            border: none;
            margin-top: 2em;
            width: 18.4em;
            height: 4em;
        }
        .chk {
            padding-bottom: 1em;
        }
        .chkBox {
            padding-bottom: 1.5em;
        }
        .all {
            margin-left: 0.7em;
        }
        .chk1 {
            margin-left: 1.1em;
            margin-right: 3em;
        }
        .bottom_write {
            color: #bfbfbf;
        }
        .out {
            border-top: 0.2em solid #bfbfbf;
            padding-top: 2em;
            margin-top: 2em;
            padding-bottom: 3em;
        }
        .out_btn {
            border: none;
            background-color: white;
            font-size: 1.1em;
            padding-bottom: 0.2em;
            border-bottom: 1px solid #262626;
        }
        input[type="button"] {
            cursor: pointer;
        }
        .out_check {
            display: none;
        }
        .out_chk_pw {
            margin-top: 0.5em;
            margin-bottom: 0.5em;
        }
        .out_chk_pw > input {
            width: auto;
            height: 1.5em;
        }
</style>
</head>
<body>
<!-- blackHeader영역 -->
<jsp:include page="../header/blackHeader.jsp" />
	<div id="all_section">
        <div id="top_section">
            <div class="user_img">
                <img class="user_img2" src="/image/user.png" alt="회원이미지">
            </div>
            <div class="user_nick">
                <div class="user_nick2">${userDTO.nickName }</div>
                <div class="user_nick3"><a href="/userInfoEdit">회원정보수정 ></a></div>
            </div>
            <div class="user_point">
                <a class="user_point2" href="">적립금 >
                    <p>1,700</p>
                </a>
                <a class="user_point2" href="">쿠폰 >
                    <p>2</p>
                </a>
                <a class="user_point2" href="">리뷰 >
                    <p>3</p>
                </a>
            </div>
        </div>
        <div id="main">
            <div class="title">
                <h1>회원정보 수정</h1>
            </div>
            <form class="save_form" action="save_userInfo" method="post">
                <div class="user_info">
                        <div class="user_info_title">
                            <h3>회원정보</h3>
                        </div>
                        <div class="user_info_mini_title">
                            <span>성명</span>
                            <span><input class="input_base" name="name" type="text" value="${userDTO.name }"></span>
                        </div>
                        <div class="user_info_mini_title">
                            <span>닉네임</span>
                            <span><input class="input_base" name="nickName" maxlength="6" type="text" value="${userDTO.nickName }"></span>
                        </div>
                        <div class="user_info_mini_title">
                            <span>연락처</span>
                            <span><input class="input_base" name="phoneNum" maxlength="13" oninput="autoHyphen(this)" type="text" value="${userDTO.phoneNum }"></span>
                        </div>
                        <div class="user_info_mini_title">
                            <span>생년월일</span>
                            <span><input class="input_base" name="birth_date" maxlength="10" oninput="autoHyphen2(this)" type="text" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${userDTO.birth_date }"/>"></span>
                        </div>
                        <div class="user_info_mini_title">
                            <span>이메일</span>
                            <span><input class="input_base" name="mail" type="text" value="${userDTO.mail }"></span>
                        </div>
                        <div class="user_info_mini_title">
                            <div>주소 <input class="search_add" type="button" value="검색하기"></div>
                            <div><input class="input_base add" name="address1" type="text" value="${userDTO.address1 }"></div>
                            <div><input class="input_base add" name="address2" type="text" value="${userDTO.address2 }"></div>
                        </div>
                </div>
                <div class="title">
                    <h1>(선택) 개인정보 수집 및 이용 동의</h1>
                </div>
                <div class="check_section">
                    <div class="checkbox_all chk">
                        <input type="checkbox" class="all_chk" name="" id=""> <span class="all">모두 동의합니다.</span>
                    </div>
                    <div class="chkBox chk">
                        <input type="checkbox" class="checkbox1"><span class="chk1">SMS (문자)</span>
                        <input type="checkbox" class="checkbox1"><span class="chk1">이메일</span>
                    </div>
                    <div class="bottom_write">서비스의 중요 안내사항 및 주문/배송에 대한 정보는 위 수신 여부와 관계없이 발송됩니다.</div>
                </div>
            </form>
            <div class="save_btn">
                <input class="save" type="button" value="저장하기">
            </div>
            <form class="user_out" action="user_out" method="post">
                <div class="out">
                    <div class="out_check">
                        <div class="out_chk2">회원 탈퇴를 원하시면 아래에 비밀번호를 입력해주세요.</div>
                        <div class="out_chk_pw">
                        	<input class="chk_pw" type="password" name="chk_pw" placeholder="비밀번호">
                        	<input class="id" type="hidden" name="id" value=${userDTO.id }>
                        </div>
                    </div>
                    <div>
                    	<c:if test="${msg3 != null }">
                    		<div>${msg3 }</div>
                    	</c:if>
                    </div>
                    <span><input class="out_btn" type="button" value="회원탈퇴"></span>
                </div>
            </form>
        </div>
    </div>
    
    <!-- footer영역 -->
    <jsp:include page="../footer/footer.jsp"/>
    <script src="../js/userInfoEdit.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    /*-----------------------------------------------------------------------------------------*/
	    $(function() {
		    $('#menu2').hide();
		    $('#mid2').hide();
		
		    var menu2Timeout; // Declare a variable to store the timeout for menu2
		
		    $('#header').hover(function() {
		        var menu2 = $(this).parent().find('#menu2');
		        var mid2 = $(this).parent().find('#mid2');
		        clearTimeout(menu2Timeout); // Clear the timeout for menu2
		        menu2.slideDown(300);
		        mid2.hide();
		    }, function() {
		        var header = $(this);
		        var menu2 = header.parent().find('#menu2');
		        var mid2 = header.parent().find('#mid2');
		        menu2Timeout = setTimeout(function() {
		            if (!menu2.is(':hover') && !mid2.is(':hover')) {
		                mid2.slideUp(300);
		                menu2.slideUp(300);
		            } else if (!mid2.is(':hover')) {
		                mid2.slideUp(300);
		            }
		        }, 300);
		    });
		
		    $('#menu2').hover(function() {
		        clearTimeout(menu2Timeout); // Clear the timeout for menu2
		        $(this).parent().find('#mid2').slideDown(300);
		    }, function() {
		        var header = $(this).closest('#header');
		        var mid2 = header.find('#mid2');
		        var menu2 = header.find('#menu2');
		        menu2Timeout = setTimeout(function() {
		            if (!mid2.is(':hover')) {
		                mid2.slideUp(300);
		            }
		        }, 300);
		    });
		
		    $('#mid2').mouseenter(function() {
		        clearTimeout(menu2Timeout); // Clear the timeout for menu2
		    });
		
		    $('#mid2').mouseleave(function() {
		        var mid2 = $(this);
		        var menu2 = mid2.parent().find('#menu2');
		        mid2.slideUp(300);
		        menu2.slideUp(300);
		    });
		});
	
	    const bestMenu2 = document.querySelector(".best_menu2");
	    const bestSubMenu2 = document.querySelector("#best2");
	
	    bestSubMenu2.addEventListener("mouseover", function() {
	     bestMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    bestSubMenu2.addEventListener("mouseout", function() {
	    bestMenu2.style.borderBottom = "none";
	    });
	
	    bestMenu2.addEventListener("mouseover", function() {
	    bestMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	    bestMenu2.addEventListener("mouseout", function() {
	    bestMenu2.style.borderBottom = "none";
	    });
	
	    const womenMenu2 = document.querySelector(".women_menu2");
	    const womenSubMenu2 = document.querySelector("#women2");
	
	    womenSubMenu2.addEventListener("mouseover", function() {
	    womenMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    womenSubMenu2.addEventListener("mouseout", function() {
	    womenMenu2.style.borderBottom = "none";
	    });
	
	    womenMenu2.addEventListener("mouseover", function() {
	    womenMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    womenMenu2.addEventListener("mouseout", function() {
	    womenMenu2.style.borderBottom = "none";
	    });
	
	    const menMenu2 = document.querySelector(".men_menu2");
	    const menSubMenu2 = document.querySelector("#men2");
	
	    menSubMenu2.addEventListener("mouseover", function() {
	    menMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    menSubMenu2.addEventListener("mouseout", function() {
	    menMenu2.style.borderBottom = "none";
	    });
	
	    menMenu2.addEventListener("mouseover", function() {
	    menMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    menMenu2.addEventListener("mouseout", function() {
	    menMenu2.style.borderBottom = "none";
	    });
	
	    const kidsMenu2 = document.querySelector(".kids_menu2");
	    const kidsubMenu2 = document.querySelector("#kids2");
	
	    kidsubMenu2.addEventListener("mouseover", function() {
	    kidsMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    kidsubMenu2.addEventListener("mouseout", function() {
	    kidsMenu2.style.borderBottom = "none";
	    });
	
	    kidsMenu2.addEventListener("mouseover", function() {
	    kidsMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    kidsMenu2.addEventListener("mouseout", function() {
	    kidsMenu2.style.borderBottom = "none";
	    });
	
	    const beautyMenu2 = document.querySelector(".beauty_menu2");
	    const beautyubMenu2 = document.querySelector("#beauty2");
	
	    beautyubMenu2.addEventListener("mouseover", function() {
	    beautyMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    beautyubMenu2.addEventListener("mouseout", function() {
	    beautyMenu2.style.borderBottom = "none";
	    });
	
	    beautyMenu2.addEventListener("mouseover", function() {
	    beautyMenu2.style.borderBottom = "0.2em solid #C80808";
	    });
	
	    beautyMenu2.addEventListener("mouseout", function() {
	    beautyMenu2.style.borderBottom = "none";
	    });
	    
	    
	</script>
</body>
</html>









