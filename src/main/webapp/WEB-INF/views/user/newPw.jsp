<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
</head>

<style>
         header {
         	 width: 25%;
         	 margin: 0 auto;
/*              text-align: center; */
             margin-top: 7%;
         }
         
         .head {
             text-align: center;
         }
     
         header img {
             vertical-align: middle;
         }
     
     
/*          input[type="text"] { */
/*              margin-right: 0.5em; */
/*              border: none; */
/*              border-bottom: 0.08em solid #BFBFBF; */
/*              outline: none; */
/*              width: 13em; */
/*          } */
         /* 비밀번호 찾기 버튼 */
         .pwfind{
             background-color: #262626; 
             color: white;
             cursor: pointer; 
             padding: 1.5em; 
             border-width: 0;
             margin-top: 2em;
         }
         /* 로그인하러 가기 버튼 */
         .submit{
             background-color: #262626; 
             color: white;
             cursor: pointer; 
             padding: 1.3em;
             width: 100%;
             box-shadow: 0; 
             border-width: 0;
             margin-top: 2em;
         }
         
         .han {
         	position: relative;
		 }
		 .input_base{
		 	width: 100%;
		    border: none;
		    border-bottom: 0.1em solid black;
		    padding-bottom: 0.8em;
		    padding-top: 1.6em;
		    outline: none;
		    margin-bottom: 10px;
		 }
		 .eye_img_size{
		    width: 0.8em;
		    position: absolute;
		    left: 19em;
		    top: 1.4em;
		    cursor: pointer;
		    position: absolute;
		 }
		 
		 .psw_err {
		    padding-bottom: 1em;
 		    display: none; 
		    color: #c80808;
		 }
         
/*          div{ */
/*          	border: 1px solid red; */
/*          } */
</style>

<body>
	<header>
		<div class="head">
                <img class="logo" src="/image/logo1.png" alt="example image" style="width:10em">
        </div>
        <p style="text-align: center; font-size: 1.2em; margin-top: 1em; font-family: 'NanumSquareAcr';">비밀번호 재설정</p>
        <br>
        <div>
        	<strong>새로운 비밀번호를 입력해주세요.</strong>
        </div>
        <form action="updatePw" method="post" class="form">
	        <div>
	        	<p>아이디 :
	        		<strong>${userDTO.id }</strong>
	        		<input type="hidden" name="id" value="${userDTO.id }">
	        	</p>
	        </div>
	        <div class="han">
			    <input type="password" name="psw" id="psw" placeholder="숫자, 영문, 특수문자 2가지 이상 포함"
			        class="input_base input_under_margin signin_lb signin_lb1">
			    <span><img src="/image/eye.png" id="icon" class="eye_img_size"></span>
			    <div class="psw_err" id="psw_hs">비밀번호 형식이 올바르지 않습니다.</div>
			</div>
			<div class="han">
			    <input type="password" name="psw_chk" id="psw_chk" placeholder="비밀번호 확인"
			        class="input_base signin_lb signin_lb1">
			    <span><img src="/image/eye.png" id="icon2" class="eye_img_size"></span>
			    <div class="psw_err" id="psw_chk2">비밀번호가 서로 다릅니다.</div>
			</div>
        </form>
        
        <div>
            <label style="font-family: 'NanumSquareAcb';">
                <input type="button" class="submit" value="비밀번호 재설정" >
            </label>
        </div>
	</header>
	
	<script>
		// 비밀번호 보이기/숨기기
		let icon = document.querySelectorAll(".eye_img_size")
		let input = document.querySelectorAll(".input_base")
		for(let i=0; i<icon.length; i++){
			icon[i].addEventListener("click", function() {
				if( input[i].type == 'password' ){
					input[i].type = 'text';
					icon[i].src = '/image/eye-crossed.png';
				} else {
					input[i].type = 'password';
					icon[i].src = '/image/eye.png';
				}
			})
		}
		
		// 비밀번호 형식 조건(숫자, 영문, 특수문자 중 2가지 이상 포함)
	    let psw_ip = document.querySelector("#psw");
	    psw_ip.addEventListener("keyup", function() {
		    // let regex = /^(?=(.*\d.*[a-zA-Z])|.*(\d.*[!@#$%^&*()\-_=+{};:,<.>])|.*([a-zA-Z].*[!@#$%^&*()\-_=+{};:,<.>]))/;
		    let pi_val = psw_ip.value;
		    let psw_hs = document.querySelector("#psw_hs");
	
		    if (hasMultipleCharacterTypes(pi_val)) {
		        psw_hs.style.display = "none";
		    } else {
		        psw_hs.style.display = "block";
		    }
	    });

	    function hasMultipleCharacterTypes(password) {
		    let count = 0;
		    if (/\d/.test(password)) {
		        count++;
		    }
		    if (/[a-zA-Z]/.test(password)) {
		        count++;
		    }
		    if (/[!@#$%^&*()\-_=+{};:,<.>]/.test(password)) {
		        count++;
		    }
		    return count >= 2;
	    }

	    // 입력한 비밀번호 두 개가 같은지
	    let err2 = document.querySelector("#psw_chk2")
	    
		for(let i=0; i<input.length; i++){
			input[i].addEventListener("input", function() {
				if(input[0].value != input[1].value){
					err2.style.display = "block"
				} else {
					err2.style.display = "none"
				}
			})
		}
	    
	    // submit
	    let btn = document.querySelector(".submit")
	    let err = document.querySelectorAll(".psw_err")
	    let form = document.querySelector(".form")
	    btn.addEventListener("click", function() {
	    	is = false;
	    	
	    	for(let i=0; i<err.length; i++){
	    		if(err[i].display != "block" && input[i].value != ""){
	    			is = true
	    		} else {
	    			is = false
	    		}
	    	}
	    	
	    	if( is == true ){
	    		alert("비밀번호가 변경되었습니다.")
	    		form.submit();
	    	} else {
	    		alert("빈 칸이 있거나 비밀번호 형식이 올바르지 않습니다.")
	    	}
	    	
	    })
	</script>
	
		
</body>
</html>









