// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery"
window.$ = jquery

$(function() {
  console.log("Hello Rails7!");
})
$(".favbtn").click(function () {//ボタンがクリックされたら
	$(this).toggleClass('active');//ボタン自身に activeクラスを付与し
    $(".indexbtn").removeClass('active');//ナビゲーションにpanelactiveクラスを付与
});

$(".indexbtn").click(function () {//ナビゲーションのリンクがクリックされたら
    $("favbtn").removeClass('active');//ボタンの activeクラスを除去し
    $("indexbtn").toggleClass('active');//ナビゲーションのpanelactiveクラスも除去
});