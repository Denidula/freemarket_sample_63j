$(document).on("turbolinks:load", function(e){
  var modal_open = $("#modal-open-btn").get(0);
  var modal_close = $("#modal-close-btn").get(0);
  var not_modalWindow = $("#modalWindow").not();
  $(modal_open).on('click', function(){
    $("#overlay").fadeIn();
    $(modal_close).on('click', function(){
      $("#overlay").fadeOut();
    })
  })
});