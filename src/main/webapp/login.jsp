<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
		<!-- get방식은 정보가 전부 다 주소창에 보이고 post는 주소창에 안보임 -->
		<!-- 여기서 로그인 정보 받고 디비에 넣기 -->
		<!-- 세션값을 다르게 준다 -->
		<!-- 세션값이 있으면 > 회원전용 -->
    
    <div id="login_box">
        <h2>Viva La Trip</h2>
        <form action="loginpro.do" method="post" class="loginForm">
            
            <div class="idForm">
                <input type="text" name= "id" class="id" placeholder="ID">
            </div>
            <div class="passForm">
                <input type="password" name= "pw" class="pw" placeholder="PW">
            </div>
            <button class="btn_login">
                LOG IN
            </button>
    
            <div class="bottomText">
                아이디가 없다면? <a onclick="location.href='make_member_join.do'">회원가입</a>
            </div>
        </form>
    </div>
	

</body>
</html>