<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
  <link rel="stylesheet" href="css/make_member_join.css">
</head>
<body>
<div class="container">
        <h2>Sign Up</h2>

        <form action="make_member_joinpro.jsp">
            <div class="form-item-username">
                <input name="username" placeholder="Name">
                <input name="gender" placeholder="Ex)M or W">
            </div>
			
            <div class="form-item">
            	<input name="id" placeholder="ID">	
                <input name="date_of_birth" placeholder="Ex)19450815">
            </div>

            <div class="form-item">
                 add a password format display
                <span class="pwd-format">
                    8-15 AlphaNumeric Characters
                </span>
                <input name="pw" id="password" placeholder="Enter password">
                <input name="confirmPassword" id="confirmPassword" placeholder="Confirm password">
            </div>

            <div class="accept-box">
                <input type="checkbox" name="accept" id="accept">
                <p> <a href="#">개인정보 수집 방침에 동의합니다.</a></p>
            </div>

            <div class="form-btns">
                <button class="signup" type="submit">가입하기</button>
                <div class="options">
                    이미 가입하신 아이디가 있으신가요? <a href="login.jsp">로그인 하러가기</a>
                </div>
            </div>

        </form>  
 
  <!--<form action ="make_member_joinpro.jsp">
  	아이디 :<input name = "id">
  	비밀번호 : <input name = "pw">
  	이름 : <input name = "username">
  	생년월일 : <input name = "date_of_birth">
  	성별 : <input name = "gender">
  	<button>가입하기</button>
  </form>  -->

    </div>

	<!-- <script type="text/javascript" src="make_member_join.js"></script> -->
</body>
</html>