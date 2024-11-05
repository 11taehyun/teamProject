<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>

    <div id="header">
        <div id="logo2">
            <div><a href="/mainPage"><img src="/header/logo2.png" alt=""></a></div>
        </div>
        <div id="search2">
            <input type="text" placeholder="여름 준비, 지금부터!">
            <!--
                1. 여름 준비, 지금부터!
                2. 올 여름, 나의 휴가패션은?
                3. 우리 아이, 유치원 인싸템
                4. 인싸들의 OOTD
                5. 지름신 강림! flex템!
            -->
            
            <a href=""><img src="/header/search_regular_icon.png" alt="" style="width: 2em;"></a>
        </div>
        <c:choose>
            <c:when test="${ login == 'ok' && user_grade == '1' }">
                <div id="logout">
                    <div><a href="/adminMain">관리자 페이지</a></div>
                    <div><a>ㅣ</a></div>
                    <div><a href="/myPage">마이페이지</a></div>
                    <div><a>ㅣ</a></div>
                    <div><a href="/myPage">장바구니</a></div>
                    <div><a>ㅣ</a></div>
                    <div><a href="/logOut">로그아웃</a></div>
                </div>    
            </c:when>
            <c:when test="${ login == 'ok' }">
                <div id="logout">
                    <div><a href="/myPage">마이페이지</a></div>
                    <div><a>ㅣ</a></div>
                    <div><a href="/myPage">장바구니</a></div>
                    <div><a>ㅣ</a></div>
                    <div><a href="/logOut">로그아웃</a></div>
                </div>    
            </c:when>
            <c:otherwise>
                <div id="logout">
                    <div><a href="/login">로그인</a></div>
		            <div><a>ㅣ</a></div>
		            <div><a href="/signin1">회원가입</a></div>
                </div>
            </c:otherwise>
        </c:choose>
        
        <div id="menu2">
            <div><a href="/mainGoodsList?category1=인기상품" class="best_menu2">BEST</a></div>
            <div><a href="/mainGoodsList?category1=여성의류" class="women_menu2">WOMEN</a></div>
            <div><a href="/mainGoodsList?category1=남성의류" class="men_menu2">MEN</a></div>
            <div><a href="/mainGoodsList?category1=아동상품" class="kids_menu2">KIDS</a></div>
            <div><a href="/mainGoodsList?category1=뷰티상품" class="beauty_menu2">BEAUTY</a></div>
        </div>
        
        
        <div id="all2">
            <div id="mid2">
                <div id="best2">
                    <div><a href="/mainGoodsList?category1=인기상품&category2=상의">상의</a></div>
                    <div><a href="/mainGoodsList?category1=인기상품&category2=하의">하의</a></div>
                    <div><a href="/mainGoodsList?category1=인기상품&category2=아우터">아우터</a></div>
                    <div><a href="/mainGoodsList?category1=인기상품&category2=니트웨어">니트웨어</a></div>
                    <div><a href="/mainGoodsList?category1=인기상품&category2=이너웨어">이너웨어</a></div>
                </div>
                <div id="women2">
                    <div><a href="/mainGoodsList?category1=여성의류&category2=상의">상의</a></div>
                    <div><a href="/mainGoodsList?category1=여성의류&category2=원피스">원피스</a></div>
                    <div><a href="/mainGoodsList?category1=여성의류&category2=하의">하의</a></div>
                    <div><a href="/mainGoodsList?category1=여성의류&category2=치마">스커트</a></div>
                    <div><a href="/mainGoodsList?category1=여성의류&category2=아우터">아우터</a></div>
                    <div><a href="/mainGoodsList?category1=여성의류&category2=니트웨어">니트웨어</a></div>
                    <div><a href="/mainGoodsList?category1=여성의류&category2=이너웨어">이너웨어</a></div>
                </div>
                <div id="men2" style="left: -5em;">
                    <div><a href="/mainGoodsList?category1=남성의류&category2=상의">상의</a></div>
                    <div><a href="/mainGoodsList?category1=남성의류&category2=하의">하의</a></div>
                    <div><a href="/mainGoodsList?category1=남성의류&category2=아우터">아우터</a></div>
                    <div><a href="/mainGoodsList?category1=남성의류&category2=니트웨어">니트웨어</a></div>
                    <div><a href="/mainGoodsList?category1=남성의류&category2=이너웨어">이너웨어</a></div>
                </div>
                <div id="kids2" style="left: -5.8em;">
                    <div><a href="/mainGoodsList?category1=아동상품&category2=의류">의류</a></div>
                    <div><a href="/mainGoodsList?category1=아동상품&category2=신발">신발</a></div>
                    <div><a href="/mainGoodsList?category1=아동상품&category2=가방">가방</a></div>
                </div>
                <div id="beauty2" style="left: -5.1em;">
                    <div><a href="/mainGoodsList?category1=뷰티상품&category2=스킨케어">스킨케어</a></div>
                    <div><a href="/mainGoodsList?category1=뷰티상품&category2=메이크업">메이크업</a></div>
                    <div><a href="/mainGoodsList?category1=뷰티상품&category2=향수">향수</a></div>
                    <div><a href="/mainGoodsList?category1=뷰티상품&category2=바디케어">바디케어</a></div>
                    <div><a href="/mainGoodsList?category1=뷰티상품&category2=헤어케어">헤어케어</a></div>
                    <div><a href="/mainGoodsList?category1=뷰티상품&category2=남성뷰티">남성뷰티</a></div>
                </div>
            </div>
        </div>
    </div>
</header>