import jquery from "jquery"
window.$ = jquery

$(document).on("click",".openbtn",function () {//ボタンがクリックされたら
	$(this).toggleClass('active');//ボタン自身に activeクラスを付与し
    $("#g-nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
});

$(document).on("click","#g-nav a",function () {//ナビゲーションのリンクがクリックされたら
    $(document).on('load',"window",function(){
        $('body').addClass('appear');
        console.log("ok");
    $(".openbtn").removeClass('active');//ボタンの activeクラスを除去し
    $("#g-nav").removeClass('panelactive');//ナビゲーションのpanelactiveクラスも除去
});

});  