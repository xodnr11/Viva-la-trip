<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Viva La Trip</title>
    <!--파비콘-->
    <link rel="shortcut icon" type="image/x-icon"
        href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
    <!--CSS-->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/public_plan.css">

    <!--외부 소스-->

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script><!-- 기억안남; -->
    <script src="https://kit.fontawesome.com/f633810772.js" crossorigin="anonymous"></script><!-- 아이콘 -->
</head>

<body>
    <div id="wrap">
        <!-- header -->
        <div id="header">
            <!-- 플렉스박스 적용으로 container 삭제 -->
            <nav class="header">
                <div class="header_logo">
                    <i class="fab fa-apple"></i>
                    <a id="logo" href="<%=request.getContextPath()%>/">Viva La Trip</a>
                </div>
                <div class="header_menu">
                    <a href="my_plan.do?id=${id }">내일정</a>
                    <a href="login">로그인</a>
                    <c:set var="id_"  value="${id }" />
                       <c:if test="${not empty id_}">
                       	<a onclick="location.href=''"><c:out value="${id_ }"></c:out></a>
                       </c:if>
                </div>
            </nav>
        </div>

        <div id="contents">
            <!-- cont_title -->
            <div id="cont_title">
                <div class="container">
                    <div class="major_title">다른 사람의 여행 일정</div> <!-- 새로고침 추가 -->
                    <div class="list_order">
                        <span id="order_recent">
                            최신순
                        </span>
                        <span id="order_popular">
                            인기순
                        </span>
                    </div>
                </div>
            </div>
            <div id="cont_main">
                <!-- cont_aside -->
                <div id="cont_aside">
                    <div class="menu_box">
                        <div class="city_korea">
                            <div class="city_title">국내</div>
                            <div class="city_list">
                                <ul>
                                    <li><a href="">서울</a></li>
                                    <li><a href="">부산</a></li>
                                    <li><a href="">인천</a></li>
                                    <li><a href="">광주</a></li>
                                    <li><a href="">울산</a></li>
                                    <li><a href="">제주도</a></li>
                                    <li><a href="">경주</a></li>
                                    <li><a href="">강릉</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="city_abroad">
                            <div class="city_title">해외</div>
                            <div class="city_list">
                                <ul>
                                    <li><a href="">일본</a></li>
                                    <li><a href="">미국</a></li>
                                    <li><a href="">중국</a></li>
                                    <li><a href="">러시아</a></li>
                                    <li><a href="">이탈리아</a></li>
                                    <li><a href="">프랑스</a></li>
                                    <li><a href="">스위스</a></li>
                                    <li><a href="">스웨덴</a></li>
                                    <li><a href="">대만</a></li>
                                    <li><a href="">베트남</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- cont_public_plan -->
                <div id="cont_public_plan">
					
                </div>
            </div>
        </div>
        <div id="footer">
            <div class="container">
                <button id="btn_make_plan_container">내일정 보기</button>
            </div>
        </div>
    </div>
    <script>
    	function make_plan_con() {
    		cont_public_plan = document.getElementById('cont_public_plan');
		
        	//var id = '${id}';
        	'<c:forEach var="arraylist_plan_public" items="${arraylist_plan_public }">'
        	plan_con = document.createElement('div');
        	plan_con.setAttribute("class","plan_container");
        	plan_con.innerHTML = '<div class="plan_contents">' 
        	+'<div class="plan_img">'
        	    +'<img src="img1.webp" href=""></img></div>'
        	+'<div class="plan_info">'
        	    +'<ul><li><a href="" id="info_title"><c:out value="${arraylist_plan_public.info_title }"></c:out></a></li>'
        	        +'<li class="info_date"><c:out value="${arraylist_plan_public.start_date }"></c:out>~<c:out value="${arraylist_plan_public.end_date }"></c:out></li>'
        	        +'<li class="info_name"><c:out value="${arraylist_plan_public.id }"></c:out></li>'
        	        +'<li class="info_selected"><c:out value="${arraylist_plan_public.places_count }"></c:out></li></ul>'
        	    +'<div class="plan_like"><a href=""><i class="far fa-heart"></i></a></div>'
        	    +'<div class="plan_icon">'
        	        +'<a href=""><i class="far fa-share-square"></i></a>&nbsp;'
        	        +'<a href=""><i class="far fa-edit"></i></a>&nbsp;'
        	        +'<a href=""><i class="far fa-trash-alt"></i></a></div></div></div>'
        	+'<hr><div class="plan_comment"><c:out value="${arraylist_plan_public.plan_comment }"></c:out></div>';
        	cont_public_plan.append(plan_con);
        	'</c:forEach>'
		}

    $("#btn_make_plan_container").click(function(){
        make_plan_con();
    });
    </script>

</body>

</html>

