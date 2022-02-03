<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Viva La Trip</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!--CSS-->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/makeSchedule.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://kit.fontawesome.com/f633810772.js" crossorigin="anonymous"></script><!-- 아이콘 -->

</head>
<body>
	
	 <div id="wrap">
        <!-- header -->
        <div id="header">
      		<!-- 플렉스박스 적용으로 container 삭제 -->
                <nav class="header">
                    <div class="header-logo">
                    	<i class="fab fa-apple"></i>
                        <a id="logo" href="<%=request.getContextPath()%>/">Viva La Trip</a>
                    </div>
                    <ul class="header-select">
                    	<li><a href="#">국내</a></li>
                    	<li><a href="#">해외</a></li>
                    </ul>
                    <div class="header-menu">
                    	<c:set var="id_"  value="${id }" />
                        <a href="login">로그인</a>
                        <c:if test="${not empty id}">
                        	<a onclick="location.href=''"><c:out value="${id }"></c:out></a>
                        </c:if>
                    </div>
                </nav>
        </div>
       </div>
       <a>내일정 목록</a>
	<div>
		<form action="plus_user_schedule.do">
		<table border="1">
			<tr>
				<td>NO</td>
				<td>여행지역</td>
				<td>기간</td>
				<td>여행지 개수</td> 
				<td>여행지 목록</td>
				<td>여행 제목</td>
				<td>공유</td>
				<td>삭제</td>
			</tr>
		<c:forEach var="arraylist_plan" items="${arraylist_plan }">
			<tr>
				<td><input name="no_" value="<c:out value="${arraylist_plan.num }"></c:out>"></td>
				<td><input name="region" value="<c:out value="${arraylist_plan.area }"></c:out>"></td>
				<td><input name="first_period" value="<c:out value="${arraylist_plan.start_date }"></c:out>">~<input name="last_period" value="<c:out value="${arraylist_plan.end_date }"></c:out>"></td>
				<td><input name="place_count" value="<c:out value="${arraylist_plan.places_count }"></c:out>"></td>
				<td><input name="place_list" value="<c:out value="${arraylist_plan.places }"></c:out>"></td>
				<td><input name="travel_name" value="<c:out value="${arraylist_plan.info_title }"></c:out>"></td>
				<td><button type="button" onclick="location.href='plus_public_plan.do?id=${id }&no__=${arraylist_plan.num}'">커뮤니티 일정 공유하기</button></td>
				<td><button type="button" onclick="location.href='my_plan_delete.do?id=${id }&no__=${arraylist_plan.num }'">해당일정 삭제하기</button></td>
			</tr>
		</c:forEach>
		</table>
		</form>
	</div>
</body>
</html>