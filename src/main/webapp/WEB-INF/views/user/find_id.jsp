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
    body {
        font-family: Arial, sans-serif;
    }

    .all {
        text-align: center;
        margin-top: 2%;
    }

    .head {
        display: inline-block;
    }

    header img {
        vertical-align: middle;
    }


    input[type="text"] {
        margin-right: 0.5em;
        border: none;
        border-bottom: 0.08em solid #BFBFBF;
        outline: none;
        width: 13em;
    }

    /* 비밀번호 찾기 버튼 */
    .pwfind {
        background-color: #262626;
        color: white;
        cursor: pointer;
        padding: 1.5em;
        border-width: 0;
        margin-top: 2em;
    }

    /* 로그인하러 가기 버튼 */
    .login {
        background-color: #262626;
        color: white;
        cursor: pointer;
        padding-top: 1.5em;
        padding-bottom: 1.5em;
        box-shadow: 0;
        border-width: 0;
        margin-top: 2em;
    }
</style>
<body>
	<div class="all">
        <div class="head">
            <a href="">
                <img src="/image/logo1.png" alt="example image" style="width:10em">
            </a>
        </div>
        <p style="text-align: center; font-size: 1.2em; margin-top: 1em; font-family: 'NanumSquareAcr';">아이디 찾기</p>
        <br>

        <p style="text-indent: -8em; margin-top: x1em; font-family: 'NanumSquareAcl';">귀하의 아이디는</p>
        <input type="text" name="id" id="id" readonly value=${userDTO.id }>
        <p style="text-align: center;
        font-size: 1.2em; display: inline; font-family: 'NanumSquareAcl';">입니다.</p>
        <br>

        <div>
            <label style="margin-right:0.5em; font-family: 'NanumSquareAcb';" href="">
                <button class="pwfind">비밀번호 찾기</button>
            </label>

            <label style="margin-right:0.5em; font-family: 'NanumSquareAcb';" href="">
                <button class="login">로그인하러 가기</button>
            </label>
        </div>
    </div>
</body>
</html>