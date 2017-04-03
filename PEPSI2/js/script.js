// WOW

new WOW().init();

// MENU & LOGIN

$('#open_menu').click(function(){
    $('#menu').addClass('menu_in');
    $('#menu').removeClass('menu_out');
});

$('#close_menu').click(function(){
    $('#menu').addClass('menu_out');
    $('#menu').removeClass('menu_in');
});

$('#open_login').click(function(){
    $('#login').addClass('login_in');
    $('#login').removeClass('login_out');
});

$('#close_login').click(function(){
    $('#login').addClass('login_out');
    $('#login').removeClass('login_in');
});

// FIXED NAV

$(function(){
   $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
          $('.logo').addClass("fixed");
      } else {
      $('.logo').removeClass("fixed");
      }
   });
 });

// PANIER

$(document).ready(function(){
    $(".prix_a").click(function(){
        $(this).closest("li").remove(".prix_li");
    });
});

// HOVER IMG

$(document).ready(function(){
  $(".catalogue_img_link, .article_img_link").hover(function(){
    $(this).children().toggleClass('zoom');
  }, function(){
    $(this).children().removeClass('zoom');
 });
});