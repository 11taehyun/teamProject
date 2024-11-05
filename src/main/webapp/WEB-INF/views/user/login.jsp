<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/login_style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
</head>
<body>
	<section class="login-form">
        <!-- 이미지 삽입 -->
        <div class="logo" style="text-align: center; margin-top: 2em;">
            <a href="/mainPage">
                <img src="/image/logo1.png" alt="example image" style="width: 200px;">
            </a>
        </div>
        <br>
        <br>
        <br>
        <h1 style="font-family: 'NanumSquareExtraBold';">로그인</h1>
        <form action="login_check" method="post">
            <div class="int-area">
                <!-- 아이디 입력 창 -->
                <input type="text" name="id" id="id" autocomplete="off" placeholder="아이디" required>
                <label for="id" style="font-size: 1.8em; font-family: 'NanumSquareAcl';"></label>
            </div>
            <div class="int-area">
                <!-- 비밀번호 입력 창 -->
                <input type="password" name="psw" id="psw" autocomplete="off" placeholder="비밀번호" required>
                <label for="id" style="font-size: 1.8em; font-family: 'NanumSquareAcl';"></label>
            </div>
            <div class="msg">
            	<c:if test="${msg != null }">
            		<div>${msg }</div>
            	</c:if>
            </div>

            <div class="btn-area">
                <!-- 로그인 버튼 -->
                <button type="submit" style="font-family: 'NanumSquareAcb';">로그인</button>
            </div>
            <br>
        </form>

            <!-- 회원가입 ID찾기 비밀번호 찾기 링크 -->
            <ul class="nav" style="font-family: 'NanumSquareAcr';">
                <li><a href="/signin1">회원가입</a></li>
                <li><a href="/find">ID 찾기</a></li>
                <li><a href="/find">비밀번호 찾기</a></li>
            </ul>
        <br>


        <!-- 이미지 슬라이드 삽입 -->
        <div class="slide slide_wrap">
            <div class="slide_item item1">1</div>
            <div class="slide_item item2">2</div>
            <div class="slide_item item3">3</div>
            <div class="slide_item item4">4</div>
            <div class="slide_item item5">5</div>
            <div class="slide_prev_button slide_button">◀</div>
            <div class="slide_next_button slide_button">▶</div>
            <ul class="slide_pagination"></ul>
        </div>
    </section>
    <script>
        // 슬라이크 전체 크기(width 구하기)
        const slide = document.querySelector(".slide");
        let slideWidth = slide.clientWidth;

        // 버튼 엘리먼트 선택하기
        const prevBtn = document.querySelector(".slide_prev_button");
        const nextBtn = document.querySelector(".slide_next_button");

        // 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
        let slideItems = document.querySelectorAll(".slide_item");
        // 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
        const maxSlide = slideItems.length;

        // 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
        let currSlide = 1;

        // 페이지네이션 생성
        const pagination = document.querySelector(".slide_pagination");

        for (let i = 0; i < maxSlide; i++) {
            if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
            else pagination.innerHTML += `<li>•</li>`;
        }

        const paginationItems = document.querySelectorAll(".slide_pagination > li");

        // 무한 슬라이드를 위해 start, end 슬라이드 복사하기
        const startSlide = slideItems[0];
        const endSlide = slideItems[slideItems.length - 1];
        const startElem = document.createElement("div");
        const endElem = document.createElement("div");

        endSlide.classList.forEach((c) => endElem.classList.add(c));
        endElem.innerHTML = endSlide.innerHTML;

        startSlide.classList.forEach((c) => startElem.classList.add(c));
        startElem.innerHTML = startSlide.innerHTML;

        // 각 복제한 엘리먼트 추가하기
        slideItems[0].before(endElem);
        slideItems[slideItems.length - 1].after(startElem);

        // 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
        slideItems = document.querySelectorAll(".slide_item");
        //
        let offset = slideWidth + currSlide;
        slideItems.forEach((i) => {
            i.setAttribute("style", `left: \${-offset}px`);
        });

        function nextMove() {
            currSlide++;
            // 마지막 슬라이드 이상으로 넘어가지 않게 하기 위해서
            if (currSlide <= maxSlide) {
                // 슬라이드를 이동시키기 위한 offset 계산
                const offset = slideWidth * currSlide;
                // 각 슬라이드 아이템의 left에 offset 적용
                slideItems.forEach((i) => {
                    i.setAttribute("style", `left: \${-offset}px`);
                });
                // 슬라이드 이동 시 현재 활성화된 pagination 변경
                paginationItems.forEach((i) => i.classList.remove("active"));
                paginationItems[currSlide - 1].classList.add("active");
            } else {
                // 무한 슬라이드 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
                currSlide = 0;
                let offset = slideWidth * currSlide;
                slideItems.forEach((i) => {
                    i.setAttribute("style", `transition: ${0}s; left: \${-offset}px`);
                });
                currSlide++;
                offset = slideWidth * currSlide;
                // 각 슬라이드 아이템의 left에 offset 적용
                setTimeout(() => {
                    // 각 슬라이드 아이템의 left에 offset 적용
                    slideItems.forEach((i) => {
                        // i.setAttribute("style", `transition: ${0}s; left: \${-offset}px`);
                        i.setAttribute("style", `transition: ${0.15}s; left: \${-offset}px`);
                    });
                }, 0);
                // // 슬라이드 이동 시 현재 활성화된 pagination 변경
                paginationItems.forEach((i) => i.classList.remove("active"));
                paginationItems[currSlide - 1].classList.add("active");
            }
        }
        function prevMove() {
            currSlide--;
            // 1번째 슬라이드 이하로 넘어가지 않게 하기 위해서
            if (currSlide > 0) {
                // 슬라이드를 이동시키기 위한 offset 계산
                const offset = slideWidth * currSlide;
                // 각 슬라이드 아이템의 left에 offset 적용
                slideItems.forEach((i) => {
                    i.setAttribute("style", `left: \${-offset}px`);
                });
                // 슬라이드 이동 시 현재 활성화된 pagination 변경
                paginationItems.forEach((i) => i.classList.remove("active"));
                paginationItems[currSlide - 1].classList.add("active");
            } else {
                // 무한 슬라이드 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
                currSlide = maxSlide + 1;
                let offset = slideWidth * currSlide;
                // 각 슬라이드 아이템의 left에 offset 적용
                slideItems.forEach((i) => {
                    i.setAttribute("style", `transition: ${0}s; left: \${-offset}px`);
                });
                currSlide--;
                offset = slideWidth * currSlide;
                setTimeout(() => {
                    // 각 슬라이드 아이템의 left에 offset 적용
                    slideItems.forEach((i) => {
                        // i.setAttribute("style", `transition: ${0}s; left: \${-offset}px`);
                        i.setAttribute("style", `transition: ${0.15}s; left: \${-offset}px`);
                    });
                }, 0);
                // 슬라이드 이동 시 현재 활성화된 pagination 변경
                paginationItems.forEach((i) => i.classList.remove("active"));
                paginationItems[currSlide - 1].classList.add("active");
            }
        }

        // 버튼 엘리먼트에 클릭 이벤트 추가하기
        nextBtn.addEventListener("click", () => {
            // 이후 버튼 누를 경우 현재 슬라이드를 변경
            nextMove();
        });
        // 버튼 엘리먼트에 클릭 이벤트 추가하기
        prevBtn.addEventListener("click", () => {
            // 이전 버튼 누를 경우 현재 슬라이드를 변경
            prevMove();
        });

        // 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
        window.addEventListener("resize", () => {
            slideWidth = slide.clientWidth;
        });

        // 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
        for (let i = 0; i < maxSlide; i++) {
            // 각 페이지네이션마다 클릭 이벤트 추가하기
            paginationItems[i].addEventListener("click", () => {
                // 클릭한 페이지네이션에 따라 현재 슬라이드 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
                currSlide = i + 1;
                // 슬라이드를 이동시키기 위한 offset 계산
                const offset = slideWidth * currSlide;
                // 각 슬라이드 아이템의 left에 offset 적용
                slideItems.forEach((i) => {
                    i.setAttribute("style", `left: \${-offset}px`);
                });
                // 슬라이드 이동 시 현재 활성화된 pagination 변경
                paginationItems.forEach((i) => i.classList.remove("active"));
                paginationItems[currSlide - 1].classList.add("active");
            });
        }

        // 드래그(스와이프) 이벤트를 위한 변수 초기화
        let startPoint = 0;
        let endPoint = 0;

        // PC 클릭 이벤트 (드래그)
        slide.addEventListener("mousedown", (e) => {
            startPoint = e.pageX; // 마우스 드래그 시작 위치 저장
        });

        slide.addEventListener("mouseup", (e) => {
            endPoint = e.pageX; // 마우스 드래그 끝 위치 저장
            if (startPoint < endPoint) {
                // 마우스가 오른쪽으로 드래그 된 경우
                prevMove();
            } else if (startPoint > endPoint) {
                // 마우스가 왼쪽으로 드래그 된 경우
                nextMove();
            }
        });

        // 모바일 터치 이벤트 (스와이프)
        slide.addEventListener("touchstart", (e) => {
            startPoint = e.touches[0].pageX; // 터치가 시작되는 위치 저장
        });
        slide.addEventListener("touchend", (e) => {
            endPoint = e.changedTouches[0].pageX; // 터치가 끝나는 위치 저장
            if (startPoint < endPoint) {
                // 오른쪽으로 스와이프 된 경우
                prevMove();
            } else if (startPoint > endPoint) {
                // 왼쪽으로 스와이프 된 경우
                nextMove();
            }
        });

        // 기본적으로 슬라이드 루프 시작하기
        let loopInterval = setInterval(() => {
            nextMove();
        }, 3000);

        // 슬라이드에 마우스가 올라간 경우 루프 멈추기
        slide.addEventListener("mouseover", () => {
            clearInterval(loopInterval);
        });

        // 슬라이드에서 마우스가 나온 경우 루프 재시작하기
        slide.addEventListener("mouseout", () => {
            loopInterval = setInterval(() => {
                nextMove();
            }, 3000);
        });
    </script>
</body>
</html>