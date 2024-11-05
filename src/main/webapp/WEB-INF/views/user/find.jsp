<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>아이디/비밀번호 찾기</title>
        <link rel="stylesheet" href="/css/find.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    </head>

    <body>
        <header style="transform:scale(2)">
            <section id="id" class="tabcontent">
                <div class="tabs">
                    <div class="head">
                        <a href="">
                            <img class="image" src="/image/logo1.png" alt="example image">
                        </a>
                        <p class="header_p">아이디 찾기</p>

                        <div>
                            <button class="tablinks_active" onclick="openTab(event,'id')">아이디 찾기</button><button
                                class="tablinks" onclick="openTab(event,'pw')">비밀번호 찾기</button>
                        </div>
                    </div>
                </div>

                <!-- 아이디 찾기 폼 -->

                <br>

                <!-- 휴대전화 입력 -->
                <div>
                    <form class="form1" action="find_id" method="post">
                        <input type="radio" name="contact" value="phone" checked onchange="showHideElements()"> 휴대전화
                        <br>
                        <br>
                        <div id="phone-form">
                            <div>
                                <div>
                                    <input type="text" class="chk1" name="phone_name" id="phone_name" placeholder="이름">
                                    <br>
                                    <br>
                                    <input type="text" class="input_ij chk1" name="phone" id="phone" maxlength="13"
                                        oninput="autoHyphen(this)" placeholder="휴대전화(-없이)">
                                    <input class="authentication_request1" type="button" name="name" value="인증요청">
                                    <div class="request_error">
                                        <a id="error">인증되었습니다.</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <br>
                        <!-- 이메일 입력 -->
                        <div>
                            <input type="radio" name="contact" value="email" onchange="showHideElements()"> 이메일
                            <br>
                            <br>
                            <div id="email-form" class="hidden">
                                <div>
                                    <div>
                                        <input type="text" class="chk2" name="email_name" id="email_name" placeholder="이름">
                                        <br>
                                        <br>
                                        <input type="text" name="email" id="email" placeholder="이메일" class="input_ij chk2">
                                        <input class="authentication_request1" type="button" name="name" value="인증요청">
                                        <div class="request_error">
                                            <a id="error">인증되었습니다.</a>
                                        </div>

                                    </div>

                                </div>
                                <br>
                            </div>
                    </form>
                </div>
                <div class="msg">
                	<c:if test="${msg2 != null }">
                		<div>${msg2 }</div>
                	</c:if>
                </div>
                <div class="run1">
                    <button class="find_id_btn">아이디 찾기</button>
                </div>
            </section>

            <section id="pw" class="tabcontent">
                <div class="tabs">
                    <div class="head">
                        <a href="">
                            <img src="/image/logo1.png" alt="example image" style="width:10em;">
                        </a>
                    </div>
                    <p>비밀번호 찾기</p>

                    <div>
                        <button class="tablinks_active" onclick="openTab(event,'id')">아이디 찾기</button><button 
		                        class="tablinks" onclick="opentab(event,'pw')">비밀번호 찾기</button>
                    </div>

                    <!-- 비밀번호 찾기 폼 -->

                    <div class="find_pw">
                        <p>비밀번호 찾기를 위한 아이디를 입력해주세요.</p>
                    </div>
                    <form class="form2" action="findPw" method="post">
                        <div class="pwfind_text">
                            <div>
                                <input type="text" name="pw_id" id="pw_id" placeholder="아이디">
<!--                                 <div class="pwfind_error"> -->
<!--                                     <br> -->
<!--                                     <p>입력하신 아이디를 찾을 수 없습니다. -->
<!--                                         <br> -->
<!--                                         기억나지않으시면 아이디 찾기를 먼저 진행해 주세요. -->
<!--                                     </p> -->
<!--                                 </div> -->
                            </div>
							<div class="input_phone">
                                <input type="text" class="input_ij chk1" name="pw_phone" id="pw_phone" maxlength="13"
                                        oninput="autoHyphen(this)" placeholder="휴대전화(-없이)">
                                    <input class="authentication_request1" type="button" name="name" value="인증요청">
                                    <div class="request_error err">
                                        <a id="error">인증되었습니다.</a>
                                    </div>
<!--                                     <div class="msg"> -->
<%-- 					                	<c:if test="${msg3 != null }"> --%>
<%-- 					                		<div>${msg3 }</div> --%>
<%-- 					                	</c:if> --%>
<!-- 					                </div> -->
                            </div> 
                        </div>
                    </form>
                    <div class="run2">
                        <button onclick="myFunction()">비밀번호 찾기</button>
                    </div>

                </div>

            </section>
        </header>

        <script>
            function myFunction() {
            	let pw_id = document.querySelector("#pw_id")
            	let err = document.querySelector(".err")
            	let form2 = document.querySelector(".form2")
            	
            	if( pw_id.value.length == 0 || err.style.display != "block" ){
            		alert("빈 항목이 있거나 인증을 완료하지 않았습니다")
            	} else {
            		form2.submit();
            	}
            }

            // 아이디 찾기, 비밀번호 찾기 탭 전환
            function openTab(evt, tabName) {
                // 현재 탭의 내용과 탭 버튼 요소를 가져와서 저장
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");

                // 모든 탭 내용을 숨김
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }

                // 모든 탭 버튼의 클래스에서 'active'를 제거
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }

                // 선택한 탭의 내용을 표시하고, 선택한 탭 버튼에 'active' 클래스 추가
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
                
                // 탭 전환시 입력한 모든 값 초기화
                let input = document.querySelectorAll("input[type='text']")
                for (let i=0; i<input.length; i++){
                	input[i].value = "";
                }
            }

            function showHideElements() {
                var phoneForm = document.getElementById("phone-form");
                var emailForm = document.getElementById("email-form");
                var contact = document.querySelector('input[name="contact"]:checked').value;
                if (contact === "phone") {
                    phoneForm.classList.remove("hidden");
                    emailForm.classList.add("hidden");
                } else {
                    phoneForm.classList.add("hidden");
                    emailForm.classList.remove("hidden");
                }
            }

            // // 인증확인 메세지
            // function showAuthenticationMessage() {
            //     var errorElement = document.getElementById("error");
            //     errorElement.innerText = "인증되었습니다.";
            //     errorElement.style.display = "block";
            // }

            // 전화번호 자동 하이픈
            const autoHyphen = (target) => {
                target.value = target.value
                    .replace(/[^0-9]/g, '')
                    .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
            }

            // let btn1 = document.querySelector(".ar1")
            // btn1.addEventListener("click", function() {
            //     let msg = document.querySelector(".request_error1")
            //     let pn_input = document.querySelector("#phone")
            //     let pn_value = pn_input.value

            //     if( pn_value.length == 13 ) {
            //         msg.style.display = "block";
            //     } else {
            //         alert("전화번호가 올바르게 입력되지 않았습니다.");
            //         msg.style.display ="none";
            //     };

            // });

            // 아이디 찾기 전화번호 인증요청
            let btn1 = document.querySelectorAll(".authentication_request1")
            let err = document.querySelectorAll(".request_error")
            let input_ij = document.querySelectorAll(".input_ij")

            btn1[0].addEventListener("click", function () {

                if (input_ij[0].value.length == 13) {
                    err[0].style.display = "block";
                } else {
                    alert("전화번호가 올바르게 입력되지 않았습니다.");
                    err[0].style.display = "none";
                };

            });
            
         	// 비밀번호 찾기 전화번호 인증요청
            btn1[2].addEventListener("click", function () {

                if (input_ij[2].value.length == 13) {
                    err[2].style.display = "block";
                } else {
                    alert("전화번호가 올바르게 입력되지 않았습니다.");
                    err[2].style.display = "none";
                };

            });
            

            // 이메일 인증요청
            btn1[1].addEventListener("click", function () {

                if (input_ij[1].value.indexOf("@") != -1) {
                    err[1].style.display = "block";
                } else {
                    alert("이메일 양식이 올바르지 않습니다")
                    err[1].style.display = "none"
                }
            })
            
            for( let i=0; i<input_ij.length; i++) {
            	input_ij[i].addEventListener("input", function() {
					
            		if( err[i].style.display = "block"){
            			err[i].style.display = "none"
            		}
            	})
            }
            

            let form1 = document.querySelector(".form1")
            let form_btn1 = document.querySelector(".find_id_btn")
            let chk1 = document.querySelectorAll(".chk1")
            let chk2 = document.querySelectorAll(".chk2")
            // form_btn1.addEventListener("click", function () {
            //     let is = true
            //     let is2 = true
            //     for (let i = 0; i < chk1.length; i++) {
            //         if (chk1[i].value.length == 0) {
            //             is = false
            //             chk1[i].focus();
            //         }
            //     }

            //     if (err[0].style.display != "block" || input_ij[0].value.length != 13) {
            //         is2 = false
            //     }

            //     if (is == false) {
            //         alert("빈 항목이 있습니다.")
            //         // return;
            //     } else if (is2 == false) {
            //         alert("전화번호 양식이 맞지 않거나 인증요청을 완료하지 않았습니다")
            //         // return;
            //     } else {
            //         form1.submit();
            //     }
            // })
            form_btn1.addEventListener("click", function() {
                let chk_radio = document.querySelector("input[name='contact']:checked").value
                console.log(chk_radio);
                let is = true

                if(chk_radio == "phone") {
                    if(chk1[0].value.length == 0 || err[0].style.display != "block") {
                        alert("빈 항목이 있거나 인증요청을 완료하지 않았습니다")
                    } else {
                        form1.submit();
                    }
                } else if(chk2[0].value.length == 0 || err[1].style.display != "block") {
                    alert("빈 항목이 있거나 인증요청을 완료하지 않았습니다")
                } else {
                    form1.submit();
                }
                
            })






        </script>
    </body>

    </html>