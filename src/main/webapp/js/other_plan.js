function make_plan_con() {
    cont_others_list = document.getElementById('cont_others_list');

    plan_con = document.createElement('div');
    plan_con.setAttribute("class","plan_container");
    plan_con.innerHTML = '<div class="plan_contents">' 
    +'<div class="plan_img">'
        +'<img src="img1.webp" href=""></img></div>'
    +'<div class="plan_info">'
        +'<ul><li><a href="" id="info_title">info_title</a></li>'
            +'<li class="info_date">info_date</li>'
            +'<li class="info_name">info_name</li>'
            +'<li class="info_selected">info_selected</li></ul>'
        +'<div class="plan_like"><a href=""><i class="far fa-heart"></i></a></div>'
        +'<div class="plan_icon">'
            +'<a href=""><i class="far fa-share-square"></i></a>&nbsp;'
            +'<a href=""><i class="far fa-edit"></i></a>&nbsp;'
            +'<a href=""><i class="far fa-trash-alt"></i></a></div></div></div>'
    +'<hr><div class="plan_comment">plan_comment</div>';
    cont_others_list.append(plan_con);
}

$("#btn_make_plan_container").click(function(){
    make_plan_con();
});