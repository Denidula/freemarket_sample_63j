$(document).on('turbolinks:load', function() {
  $('#scroll_to_ladies').on('click', function(){
    var ladies_index = $('#ladies_index').offset().top;
    $('html, body').animate({scrollTop: ladies_index});
  });
  $('#scroll_to_mens').on('click', function(){
    var mens_index = $('#mens_index').offset().top;
    $('html, body').animate({scrollTop: mens_index});
  });
  $('#scroll_to_devise').on('click', function(){
    var devise_index = $('#devise_index').offset().top;
    $('html, body').animate({scrollTop: devise_index});
  });
  $('#scroll_to_toy').on('click', function(){
    var toy_index = $('#toy_index').offset().top;
    $('html, body').animate({scrollTop: toy_index});
  });
  $('#scroll_to_chanel').on('click', function(){
    var chanel_index = $('#chanel_index').offset().top;
    $('html, body').animate({scrollTop: chanel_index});
  });
  $('#scroll_to_vuitton').on('click', function(){
    var vuitton_index = $('#vuitton_index').offset().top;
    $('html, body').animate({scrollTop: vuitton_index});
  });
  $('#scroll_to_supreme').on('click', function(){
    var supreme_index = $('#supreme_index').offset().top;
    $('html, body').animate({scrollTop: supreme_index});
  });
  $('#scroll_to_nike').on('click', function(){
    var nike_index = $('#nike_index').offset().top;
    $('html, body').animate({scrollTop: nike_index});
  });
});