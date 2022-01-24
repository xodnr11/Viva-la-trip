<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="css/other_plan.css">

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
                <div class="header-logo">
                    <i class="fab fa-apple"></i>
                    <a id="logo" href="#">Viva La Trip</a>
                </div>
                <div class="header-menu">
                    <a onclick="location.href='login.do'">로그인</a>
                </div>
            </nav>
        </div>

        <div id="contents">
            <!-- cont_title -->
            <div id="cont_title">
                <div class="container">
                    <div class="major_title">다른 사람의 여행 일정</div>
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
                <!-- cont_others_list -->
                <div id="cont_others_list">

                </div>
            </div>
        </div>
        <div id="footer">
            <div class="container">
                <button id="btn_make_plan_container">더보기</button>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="js/other_plan.js"></script>

</body>

</html>

