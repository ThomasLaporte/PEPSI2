// WOW

new WOW().init();

// CONNEXION

$(".login_a").click(function(){
    $(".login_input").addClass("input_visible");
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