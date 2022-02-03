<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>유저 스케쥴</h2>
	<div>
		<table border="1">
			<tr>
				<td>no</td>
				<td>지역</td>
				<td>기간</td>
				<td>여행지 개수</td>
				<td>여행지 목록</td>
				<td>여행 제목</td>
				<td>여행 내용</td>
			</tr>
		<c:forEach var="user_arraylist" items="${arraylist_user_schedule_ }">
			<tr>
				<td><c:out value="${user_arraylist.no_ }"></c:out></td>
				<td><c:out value="${user_arraylist.region }"></c:out>"></td>
				<td><c:out value="${user_arraylist.first_period }"></c:out>~<c:out value="${user_arraylist.last_period }"></c:out></td>
				<td><c:out value="${user_arraylist.place_count }"></c:out></td>
				<td><c:out value="${user_arraylist.place_list }"></c:out></td>
				<td><c:out value="${user_arraylist.travel_name }"></c:out></td>
				<td><c:out value="${user_arraylist.travel_content }"></c:out></td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>