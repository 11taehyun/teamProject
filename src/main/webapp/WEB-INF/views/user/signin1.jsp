<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀지 | 회원가입</title>
<link href="/css/signin1.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
</head>
<body>
	<!--전체-->
    <div class="all">
        <!--전체보다 살짝 작은 세로박스-->
        <div class="big_height_box">
            <!--로고-->
            <div class="center"><a href=""><img src="/image/logo.png" class="signin_img_size"></a></div>
            <!--회원가입글씨-->
            <div class="center h2_margin">
                <h2 class="signin_h2">회원가입</h2>
            </div>
            <form action="signin" method="post">
                <div class="signin_input_big_box">
                    <div class="signin_input_text">
                        <div class="input_name"><span class="signin_text_title">아이디</span><span
                                class="red_star">*</span>
                        </div>
						<div class="input_id">
							<input type="text" name="id" placeholder="아이디" class="input_base signin_lb">
	                        <div class="id_check_ok">사용 가능한 아이디 입니다.</div>
	                        <div class="id_check_no">이미 사용중인 아이디 입니다.</div>
                        </div>
                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title">비밀번호</span><span
                                class="red_star">*</span>
                        </div>
                        <div class="han">
                            <input type="password" name="psw" id="psw" placeholder="숫자, 영문, 특수문자 2가지 이상 포함"
                                class="input_base input_under_margin signin_lb signin_lb1">
                            <span><img src="/image/eye.png" id="icon" class="eye_img_size"></span>
                            <div class="psw_hs sm_psw" id="psw_hs">비밀번호 형식이 올바르지 않습니다.</div>
                        </div>
                        <div class="han">
                            <input type="password" name="psw_chk" id="psw_chk" placeholder="비밀번호 확인"
                                class="input_base signin_lb signin_lb1">
                            <span><img src="/image/eye.png" id="icon2" class="eye_img_size"></span>
                            <div class="psw_chk2 sm_psw" id="psw_chk2">비밀번호가 서로 다릅니다.</div>
                        </div>
                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title">성명</span><span class="red_star">*</span>
                        </div>
                        <div><input type="text" name="name" placeholder="성명" class="input_base signin_lb"></div>
                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title">생년월일</span><span class="red_star">*</span>
                        </div>
                        <div><input type="text" maxlength="10" oninput="autoHyphen2(this)" name="birth_date" placeholder="생년월일 8자리" class="input_base signin_lb"></div>
                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title">닉네임</span><span
                                class="red_star">*</span>
                        </div>
                        <div class="wndqhrqjxmstm">
                            <input type="text" name="nickName" id="nick" placeholder="닉네임" class="input_base signin_lb ok2">
                            <span><input type="button" class="jungbok" id="nick_chk" value="중복확인"></input></span>
                            <div class="nickname_hide ok" id="nick2">사용 가능한 닉네임 입니다</div>
                        </div>

                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title" for="search_add">주소</span><span
                                class="red_star">*</span>
                        </div>
                        <div class="sebl">
                            <input type="text" name="address1" id="search_add" placeholder="우편번호 검색"
                                class="input_base input_under_margin signin_lb" readonly>
                            <span><img src="/image/search.png" id="sc" class="search_img_size"></span>
                        </div>
                        <div><input type="text" name="address2" placeholder="상세주소 입력" class="input_base signin_lb"></div>
                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title">전화번호</span><span
                                class="red_star">*</span>
                        </div>
                        <div class="phoneNumber">
                            <input type="text" maxlength="13" oninput="autoHyphen(this)" name="phoneNum" id="pn_input" placeholder="-없이 숫자만"
                                class="input_base signin_lb ok2">
                            <span><input type="button" class="pn_chk" id="pn_chk" value="인증요청"></input></span>
                            <div class="pn_chk2 ok" id="pn_chk2">인증 되었습니다.</div>
                        </div>

                    </div>
                    <div>
                        <div class="input_name"><span class="signin_text_title">이메일</span><span
                                class="red_star">*</span>
                        </div>
                        <div class="email">
                            <input type="text" name="mail" id="m_input" placeholder="example@mail.com" class="input_base signin_lb ok2">
                            <span><input type="button" class="mail_chk" id="mail_chk" value="인증요청"></input></span>
                            <div class="mail_chk2 ok" id="mail_chk2">인증 되었습니다.</div>
                        </div>
                    </div>
				</div>
            </form>
            <div class="check_box_all">
                <div class="checkbox_big_box">
                    <input type="checkbox" name="checkbox1" id="checkbox1" value="">
                    <span class="signin_text_title">약관 전체 동의하기(선택동의포함)</span>
                </div>
                <div>
                    <input type="checkbox" class="checkbox cb_ps" id="checkbox2"><span class="check_text"> [필수] 만 14세
                        이상입니다.</span><br>
                    <input type="checkbox" class="checkbox cb_ps" id="checkbox3"><span class="check_text"> [필수] TEAM.G 이용
                        약관 </span><span><a href="" class="jasehi">자세히</a></span><br>
                    <input type="checkbox" class="checkbox cb_ps" id="checkbox4"><span class="check_text"> [필수] 개인정보 수집 및
                        이용 동의 </span><span><a href="" class="jasehi">자세히</a></span><br>
                    <input type="checkbox" class="checkbox" id="checkbox5"><span class="check_text"> [선택] 광고성 정보 수신
                        동의</span><br>
                    <input type="checkbox" class="checkbox" id="checkbox6"><span class="check_text"> [선택] 개인정보 수집 및
                        이용 동의 </span><span><a href="" class="jasehi">자세히</a></span><br>
                </div>
            </div>
            <div>
                <div class="signin_button_box">
                    <input type="button" class="signin_button" value="가입하기"></input>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/signin1.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>