let btn = document.querySelector("#checkbox1")
let btn2 = document.querySelector("#checkbox2")
let btn3 = document.querySelector("#checkbox3")
let btn4 = document.querySelector("#checkbox4")
let btn5 = document.querySelector("#checkbox5")
let btn6 = document.querySelector("#checkbox6")
let cb_all = document.querySelector(".check_box_all")

let btn_all = document.querySelectorAll(".checkbox")
let all_chk = btn6.checked;
console.log(all_chk)

// 전체 동의하기 체크를 누를때 전체 체크/체크해제
btn.addEventListener("click",function () {
    let ischeck = btn.checked;
    console.log(ischeck);

    for(let i = 0; i < btn_all.length; i++) {
        btn_all[i].checked = ischeck;
    }
});

// 세부 약관 하나라도 해제되거나 모두 체크했을때 전체 동의 체크박스 연동
for(let i = 0; i < btn_all.length; i++) {
    btn_all[i].addEventListener("click", function() {

        let btn_all2 = document.querySelectorAll(".checkbox:checked")
        console.log(btn_all)
        

        if (this.checked === false){
            btn.checked = false;
        } else if (btn_all2.length == btn_all.length) {
            btn.checked = true;
        }
    });
};

//	// 아이디 중복체크
//	let id_chk = document.querySelector("#id_chk")
//	id_chk.addEventListener("click", function(event) {
//		let id = document.querySelector("[name='id']");
//		let id_val = id.value
//		
//		let id_ok = document.querySelector(".id_check_ok")
//		let id_no = document.querySelector(".id_check_no")
//		
//		console.log("event.target", event.target)
//		console.log("id 값", id_val)
//		
//		// ajax 객체 생성
//		const xhr = new XMLHttpRequest();
//		
//		// 보낼 준비
//		let url = "/idCheck";
//		xhr.open("POST", url);
//		xhr.setRequestHeader("Content-Type", "application/json");
//		
//		let param = {
//			id: id_val
//		}
//		console.log("param :", param)
//		
//		xhr.send(JSON.stringify(param));
//		
//		// 다녀오는게 끝났을때
//		xhr.onload = function() {
//			console.log(xhr.responseText);
//			
//			if( Number(xhr.responseText) == 0) {
//				id_ok.style.display = "block"
//				id_no.style.display = "none"
//				id.readOnly = true;
//			} else {
//				id_no.style.display = "block"
//				id_ok.style.display = "none"
//			}
//		}
//		
//	})
	
	// 아이디 중복체크
	let id = document.querySelector("[name='id']");
	id.addEventListener("input", function(event) {
		let id_val = id.value
		
		let id_ok = document.querySelector(".id_check_ok")
		let id_no = document.querySelector(".id_check_no")
		
		console.log("event.target", event.target)
		console.log("id 값", id_val)
		
		// ajax 객체 생성
		const xhr = new XMLHttpRequest();
		
		// 보낼 준비
		let url = "/idCheck";
		xhr.open("POST", url);
		xhr.setRequestHeader("Content-Type", "application/json");
		
		let param = {
			id: id_val
		}
		console.log("param :", param)
		
		xhr.send(JSON.stringify(param));
		
		// 다녀오는게 끝났을때
		xhr.onload = function() {
			console.log(xhr.responseText);
			
			if( Number(xhr.responseText) == 0) {
				id_ok.style.display = "block"
				id_no.style.display = "none"
			} else {
				id_no.style.display = "block"
				id_ok.style.display = "none"
			}
		}
		
	})

    // 비밀번호 숨기기/보이기
    let btn7 = document.querySelector("#icon")
    btn7.addEventListener("click", function(){
        let passwordInput = document.querySelector("#psw");

        if (passwordInput.type === "password"){
            passwordInput.type = "text";
            btn7.src = "../image/eye-crossed.png";
        } else {
            passwordInput.type = "password";
            btn7.src = "../image/eye.png";
        };
    });

    // 비밀번호 확인칸 숨기기/보이기
    let btn8 = document.querySelector("#icon2")
    btn8.addEventListener("click", function(){
        let passwordInput2 = document.querySelector("#psw_chk");

        if (passwordInput2.type === "password"){
            passwordInput2.type = "text";
            btn8.src = "../image/eye-crossed.png";
        } else {
            passwordInput2.type = "password";
            btn8.src = "../image/eye.png";
        };
    });

    // let psw_ip = document.querySelector("#psw");
    // psw_ip.addEventListener("keyup", function() {
    //     let regex = /^(?=(.*\d.*[a-zA-Z])|.*(\d.*[!@#$%^&*()\-_=+{};:,<.>])|.*([a-zA-Z].*[!@#$%^&*()\-_=+{};:,<.>]))/;
    //     let pi_val = psw_ip.value;
    //     let psw_hs = document.querySelector("#psw_hs");

    //     if(regex.test(pi_val)) {
    //         psw_hs.style.display = "none";
    //     } else {
    //         psw_hs.style.display = "block";
    //     }
    // });

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


    // 입력한 두 개의 비밀번호가 같은지
    let psw_chk = document.querySelector("#psw_chk");
    psw_chk.addEventListener("keyup", function() {
        let psw = document.querySelector("#psw").value;
        let psw2 = document.querySelector("#psw_chk").value;
        let psw3 = document.querySelector("#psw_chk2");

        if (psw != psw2) {
            psw3.style.display = "block"
        } else {
            psw3.style.display = "none"
        };
    });
    
    // 생년월일 자동 하이픈
    const autoHyphen2 = (target) => {
        target.value = target.value
          .replace(/[^0-9]/g, '')
          .replace(/^(\d{4})(\d{2})(\d{2})$/, `$1-$2-$3`);
    }

    // 닉네임 중복확인
    let nick_chk = document.querySelector("#nick_chk")
    nick_chk.addEventListener("click", function() {
        let nick23 = document.querySelector("#nick2");
        let nick_input = document.querySelector("#nick");
        let ni_value = nick_input.value;
        console.log("2222", nick23.style.display)

        if (ni_value.length !== 0) {
            nick23.style.display = "block";
        } else {
            alert("닉네임을 입력해주세요!");
        };
    });

    // 주소 찾기
    window.onload = function () {
        let sc = document.querySelector("#sc")
        sc.addEventListener("click", function () { //주소입력칸을 클릭하면
           //카카오 지도 발생
           new daum.Postcode({
                oncomplete: function (data) { //선택시 입력값 세팅
                document.getElementById("search_add").value = data.address; // 주소 넣기
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
              }
           }).open();
        });
    };
    
    // 전화번호 자동 하이픈
    const autoHyphen = (target) => {
        target.value = target.value
          .replace(/[^0-9]/g, '')
          .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }

    // 전화번호 인증요청
    let pn_chk = document.querySelector("#pn_chk");
    pn_chk.addEventListener("click", function() {
        let pn_chk2 = document.querySelector("#pn_chk2");
        let pn_input = document.querySelector("#pn_input");
        let pi_value = pn_input.value;

        if (pi_value.length === 13) {
            pn_chk2.style.display = "block";
        } else {
            alert("전화번호가 올바르게 입력되지 않았습니다.");
        };
    });

    // 메일 인증요청
    let mail_chk = document.querySelector("#mail_chk");
    mail_chk.addEventListener("click", function() {
        let m_chk2 = document.querySelector("#mail_chk2");
        let mail_input = document.querySelector("#m_input");
        let mi_value = mail_input.value;

        if (mi_value.indexOf("@") != -1) {
            m_chk2.style.display = "block";
        } else {
            alert("이메일 양식이 올바르지 않습니다");
        };
    });
    
    // 중복확인 및 인증요청을 완료한 상태에서 input창을 수정했을 경우 중복확인 및 인증요청 숨기기
    let ok = document.querySelectorAll(".ok");
    let ok2 = document.querySelectorAll(".ok2");
    
    for( let i=0; i<ok2.length; i++ ) {
		ok2[i].addEventListener("input", function() {
			if( ok[i].style.display = "block" ){
				ok[i].style.display = "none"
			}
		})
	}

    // 가입하기 버튼 
    let signin_lb = document.querySelectorAll(".signin_lb");
    let signin_lb1 = document.querySelectorAll(".signin_lb1");
    let signin_lb2 = document.querySelectorAll(".sm_psw");
    
    let id_ok = document.querySelector(".id_check_ok")
    console.log(signin_lb);
    console.log(signin_lb1);
    console.log(signin_lb2);
    console.log(ok);
    console.log(ok2);

    // let signin = document.querySelector(".signin_button");
    // signin.addEventListener("click", function() {
    //     for(let i = 0; i < signin_lb.length; i++) {
    //         console.log(signin_lb[i].value, signin_lb[i].value.length);
    //     };

    // });

    let submit = document.querySelector("form");
    let signin = document.querySelector(".signin_button");
    signin.addEventListener("click", function() {
        let is = true
        let is2 = true
        let is3 = true
        
        if(id_ok.style.display != "block"){
			id.style = "border: 1px solid #C80808;"
			id.focus();
			alert("아이디를 확인해주세요")
			return;
		}
        
        for(let i = 0; i < signin_lb.length; i++) {
            // let slVal = signin_lb[i].value
            // let slVal_lt = slVal.length
            if(signin_lb[i].value.length == 0) {
                is = false
                signin_lb[i].style = "border: 1px solid #C80808;"
                signin_lb[i].focus();
            } else {
                signin_lb[i].style = "border: none; border-bottom: 0.1em solid black; padding-bottom: 0.8em; outline: none;"
            }
        }; console.log(is)

        if(is == false) {
            alert("빈 항목이 있습니다. 필수 항목을 모두 입력해주세요");
            return;
        } else if(btn2.checked == false || btn3.checked == false || btn4.checked == false) {
            alert("필수 약관을 체크해주세요");
            cb_all.style = "border: 1px solid #C80808; margin-top: 10px;"
            btn_all.focus();
            return;
        } else {
            cb_all.style = "none";
        };

        for(let i = 0; i < signin_lb2.length; i++) {
            if(signin_lb2[i].style.display == "block") {
                is2 = false
                signin_lb1[i].style = "border: 1px solid #C80808;"
                signin_lb1[i].focus();
            }
        }

        if(is2 == false) {
            alert("비밀번호를 확인해주세요")
            return;
        }

        for(let i = 0; i < ok.length; i++) {
            if(ok[i].style.display != "block") {
                is3 = false
                ok2[i].style = "border: 1px solid #C80808;"
                ok2[i].focus();
            }
            console.log(ok[i].style.display)
        }

        if(is3 == false) {
            alert("중복확인 및 인증요청을 해주세요")
        } else {
            submit.submit();
        };

    //     if (is == true && is2 == true && btn2.checked == true && btn3.checked == true && btn4.checked == true) {
    //         submit.submit();
    //     } else if (is2 == false) {
    //         alert("비밀번호를 확인해주세요")
    //     } else if(is3 == false) {
    //         alert("중복확인 및 인증요청을 해주세요")
    //     } else {
    //         alert("빈 항목이 있거나 필수 체크 약관을 동의하지 않았습니다");
    //     }
    });

    