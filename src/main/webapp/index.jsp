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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/><!-- 슬라이더배너 -->
    <!--외부 소스-->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script><!-- 기억안남; -->
    <script src="https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=0fe1da3ede2a77fb6b630f550f0c09ed"></script><!-- openweather-->
	<script src="https://kit.fontawesome.com/f633810772.js" crossorigin="anonymous"></script><!-- 아이콘 -->
<!-- 슬라이더배너 -->
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
                        <a href="my_plan.do?id=${id }">내일정</a>
                        <a href="login">로그인</a>
                        <c:if test="${not empty id}">
                        	<a onclick="location.href=''"><c:out value="${id }"></c:out></a>
                        </c:if>
                    </div>
                </nav>

        </div>
        <!-- //header -->
        <!-- contents -->
        <div id="contents">
            <div id="cont_map">
                <div class="container">
                    <!-- 카카오맵 -->
                    <div class="map_wrap">
                        <div id = "kmap"></div>
                        <div class="hAddr">
                            <span class="title">지도중심기준 행정동 주소정보</span>
                            <span id="centerAddr"></span>
                        </div>
                    </div>
                    <script type="text/javascript"
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eb35eb3a356a7589f696a82e382206f1&libraries=services"></script>
                    <script>
                        var mapContainer = document.getElementById('kmap'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                level: 10 // 지도의 확대 레벨
                            };

                        // 지도를 생성합니다    
                        var kmap = new kakao.maps.Map(mapContainer, mapOption)
                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder = new kakao.maps.services.Geocoder();

                        var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                            infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

                        // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
                        searchAddrFromCoords(kmap.getCenter(), displayCenterInfo);

                        // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
                        kakao.maps.event.addListener(kmap, 'click', function (mouseEvent) {
                            searchAddrFromCoords(mouseEvent.latLng, function (result, status) {
                                
                                if (status === kakao.maps.services.Status.OK) {
                                    
                                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : </div>' : '';

                                    detailAddr += '<div>지번 주소 : ' + result[0].address_name + '</div>';
                                    
                                    var content = '<div class="bAddr">' +
                                        '<span class="title">법정동 주소정보</span>' +
                                        detailAddr + '<button id="btn1" type="button"> 일정 만들기 </button>'+
                                        '</div>';
                                    
                                    // 마커를 클릭한 위치에 표시합니다 
                                    marker.setPosition(mouseEvent.latLng);
                                    marker.setMap(kmap);

                                    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                    infowindow.setContent(content);
                                    infowindow.open(kmap, marker);

                                    function send(){
                                        //행정구역별로 구분
                                        var jbSplit = result[0].address_name.split(' ');
                                        var selected_area = "";

                                        for(i=0; i<jbSplit.length; i++) {
                                            //행정구역 '시'나 '군' 미만 버리기
                                            var ad_div = jbSplit[i].substring(jbSplit[i].length-1);
                                            if(ad_div == ("시") || ad_div == ("도") || ad_div == ("군"))
                                                selected_area += jbSplit[i] + " ";
                                        }
                                        //makeSchedule로 보내기
                                        var id = '<c:out value="${id_}"/>';
                                        location.href="make_plan?area="+selected_area+"&id="+id;
                                    }
                                    var btn1 = document.getElementById("btn1");
                                    btn1.onclick = send;
                                }
                            });
                        });
                        
                        // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
                        kakao.maps.event.addListener(kmap, 'idle', function () {
                            searchAddrFromCoords(kmap.getCenter(), displayCenterInfo);
                        });

                        function searchAddrFromCoords(coords, callback) {
                            // 좌표로 행정동 주소 정보를 요청합니다
                            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
                        }

                        function searchDetailAddrFromCoords(coords, callback) {
                            // 좌표로 법정동 상세 주소 정보를 요청합니다
                            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                        }

                        // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
                        function displayCenterInfo(result, status) {
                            if (status === kakao.maps.services.Status.OK) {
                                var infoDiv = document.getElementById('centerAddr');

                                for (var i = 0; i < result.length; i++) {
                                    // 행정동의 region_type 값은 'H' 이므로
                                    if (result[i].region_type === 'H') {
                                        infoDiv.innerHTML = result[i].address_name;
                                        break;
                                    }
                                }
                            }
                        }
                        
                    </script>
                    <!-- 구글맵 -->
                    <div id="gmap"></div>
                    <script
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2jNxdJkyeg4Lg_DU4GCEnmwMHfl3txwk&callback=initMap&v=weekly"
                        async></script>
                    <script>
                        let gmap;
                        function initMap() {
                            gmap = new google.maps.Map(document.getElementById("gmap"), {
                                center: { lat: 37.379840, lng: 126.927986 },
                                zoom: 15,
                            });
                        }
                    </script>
                </div>
            </div>
            <div id="cont_instruction">
                <div class="container">
                    <div class="cont_instruction">
                        <div class="instruction">
                            <div class="step">step 1</div>
                            <div class="how_to">지도에서 여행지 선택</div>
                        </div>
                        <div class="instruction">
                            <div class="step">step 2</div>
                            <div class="how_to">여행 일자와 명소 선택</div>
                        </div>
                        <div class="instruction">
                            <div class="step">step 3</div>
                            <div class="how_to">일정 생성</div>
                        </div>
                        <div class="instruction">
                            <div class="step">step 4</div>
                            <div class="how_to">내 일정에 추가</div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="cont_popular">
                <div class="container">
                    <div class="cont_popular">
                        <div class="title">
                            <h2>Viva La Trip이 인정한 인기 여행지</h2>
                        </div>
                        <div class="popular_list">
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지1"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지2"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지3"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지4"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지5"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지6"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지7"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지8"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지9"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지10"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지11"></a></div>
                            <div class="area_li"><a href="#"><img src="#" alt="인기 여행지12"></a></div>
                        </div>
                        <ul>
        					<li class="prev_arrow"><i class="fas fa-chevron-left"></i></li>
        					<li class="next_arrow"><i class="fas fa-chevron-right"></i></li>
    					</ul>
                    </div>
                </div>
            </div>
            <div id="cont_public"> <!-- 더보기 토글 -->
                <div class="container">
                    <div class="cont_public">
                        <div class="cont_public_title">
                            <h2>다른 사람들의 일정 목록</h2>
<<<<<<< HEAD
                            <a id="go_public_plan_list" href="other_plan.jsp">더 찾아보기</a>
=======
                            <h2>다른 사람들의 여행 일정</h2>
                            <a id="other_list" href="public_plan?id=${id_ }">더 찾아보기</a>
>>>>>>> branch 'master' of https://github.com/xodnr11/Viva-la-trip.git
                        </div>
                        <ul>
                            <li class="destination1"> <!-- plan_info -->
                                <img src="" alt="여행지1">
                                <div class="description">일정 정보</div> <!-- plan_info -->
                            </li>
                            <li class="destination2">
                                <img src="" alt="여행지2">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="destination3">
                                <img src="" alt="여행지3">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="destination4">
                                <img src="" alt="여행지4">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="destination5">
                                <img src="" alt="여행지5">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="destination6">
                                <img src="" alt="여행지6">
                                <div class="description">일정 정보</div>
                            </li>
                        </ul>
                        <div class="second_pop">
                            <ul class="more">
                                <li class="destination1">
                                    <img src="" alt="여행지1">
                                    <div class="description">일정 정보</div>
                                </li>
                                <li class="destination2">
                                    <img src="" alt="여행지2">
                                    <div class="description">일정 정보</div>
                                </li>
                                <li class="destination3">
                                    <img src="" alt="여행지3">
                                    <div class="description">일정 정보</div>
                                </li>
                                <li class="destination4">
                                    <img src="" alt="여행지4">
                                    <div class="description">일정 정보</div>
                                </li>
                                <li class="destination5">
                                    <img src="" alt="여행지5">
                                    <div class="description">일정 정보</div>
                                </li>
                                <li class="destination6">
                                    <img src="" alt="여행지6">
                                    <div class="description">일정 정보</div>
                                </li>
                            </ul>
                        </div>
                        
                        <button id="btnMore">더보기</button>
                    </div>
                </div>
            </div>
            <div id="cont_others"> <!-- 박스 수를 미리 정하고 버튼으로 순서대로 로드 -->
                <div class="container">
                    <div class="cont_others">
                        <div class="title">
                            <h2>다른 사람들의 일정 목록</h2>
                            <a id="other_list" href="public_plan?id=${id_ }">더 찾아보기</a>
                        </div>
                        <ul id="des_li">
                            <li class="des">
                                <img src="" alt="여행지1">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지2">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지3">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지4">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지5">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지6">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지1">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지2">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지3">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지4">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지5">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지6">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지1">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지2">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지3">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지4">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지5">
                                <div class="description">일정 정보</div>
                            </li>
                            <li class="des">
                                <img src="" alt="여행지6">
                                <div class="description">일정 정보</div>
                            </li>
                        </ul>
                        <button id="btnLoadMore">더보기</button>

                    </div>
                </div>
            </div>
            <div id="cont_others"> <!-- 박스 동적 생성 -->
                <div class="container">
                    <div class="cont_others">
                        <div class="title">
                            <h2>다른 사람들의 일정 목록</h2>
                            <a id="other_list" href="public_plan?id=${id_ }">더 찾아보기</a>
                        </div>
                        <ul id="others_list"></ul>
                        <button id="btnLoadIntinity">더보기</button>

                    </div>
                </div>
            </div>
        </div>
        <!-- //contents -->
        <div id="footer">
            <div class="container">
                footer
            </div>
        </div>
    </div>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script><!-- 슬라이더배너 -->
	<script type="text/javascript" src="js/javascript.js"></script>
   
</body>

</html>
