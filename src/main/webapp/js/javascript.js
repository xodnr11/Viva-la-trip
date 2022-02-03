$(".popular_list").slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    autoplay: true,
    autoplaySpeed: 7000,
    dots: true,
    prevArrow: $('.prev_arrow'),
    nextArrow: $('.next_arrow')

});

$("#btn_pop").click(function(e){
    e.preventDefault();
    //$("#cont_nav").css("display","block");
    //$("#cont_nav").show();
    //$("#cont_nav").fadeIn();
    //$("#cont_nav").slideDown();
    //$("#cont_nav").toggle();
    //$("#cont_nav").fadeToggle();
    $("#second_pop").slideToggle(200);
    $(this).text( $(this).text() == '더보기' ? "줄이기" : "더보기");
});

$(function(){
    $(".des").slice(0, 6).css('display', 'flex'); // 최초 10개 선택
    $("#btn_load_more").click(function(e){ // Load More를 위한 클릭 이벤트e
        e.preventDefault();
        $(".des:hidden").slice(0, 6).css('display', 'flex'); // 숨김 설정된 다음 10개를 선택하여 표시
        if($(".des:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
            $("#btn_load_more").css("display","none");// 더 이상 로드할 항목이 없는 경우 버튼 가리기
        }
    });
});

for(let i=0; i<6; i++){
    genCon();
}

function genCon() {
    des_list = document.getElementById('public_list');

    li = document.createElement('li');
    li.setAttribute("class","des");

    img = document.createElement('img');
    img.setAttribute("src","");
    img.setAttribute("alt","여행지");

    div = document.createElement('div');
    div.setAttribute("class","plan_info");
    div.innerHTML = "일정 정보";
    
    li.append(img, div);
    //listItem = '<img src="" alt="여행지"><div class="description">일정 정보</div>'
    //li.appendChild(listItem);
    des_list.append(li);
}

$("#btn_load_intinity").click(function(e){
    e.preventDefault();
    for(let i=0; i<6; i++){
        genCon();
    }

});
