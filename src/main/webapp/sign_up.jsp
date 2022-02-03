<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Viva La Trip</title>
    <!--파비콘-->
    <link rel="shortcut icon" type="image/x-icon"
        href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
    <!--CSS-->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/sign_up.css">
</head>
<body>
    <div id="sign_up_box">
        <h2>Sign Up</h2>

        <form action="sign_up_pro.do" class="sign_up_form">
            <div class="user_form">
                <input class="username" name="username" placeholder="Name">
            </div>
			
            <div class="user_form">
            	<input class="id" name="id" placeholder="ID">
            </div>

            <div class="user_form">
                <input class="pw" name="pw" placeholder="Enter password" type="password" minlength="4">
            </div>

            <div class="user_form">
                <input class="pw" name="confirmPassword" placeholder="Confirm password" type="password">
            </div>

            <div class="accept_box">
                <input type="checkbox" name="accept" id="accept">
                <p> <a href="#">개인정보 수집 방침</a>에 동의합니다.</p>
            </div>

            <div class="form-btns">
                <button class="btn_sign_up" type="submit">SIGN UP</button>
                <div class="options">
                    이미 가입하신 아이디가 있으신가요? <a href="login">로그인 하러가기</a>
                </div>
            </div>
        </form>  
    </div>
</body>
</html>