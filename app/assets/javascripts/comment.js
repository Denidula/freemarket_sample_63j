$(function(){

  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    // var data = $(this).val();
    var data = $('#comment_text').val();
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: data,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
    })
    .fail(function(){
      alert("表示に失敗しました。");
    })
  });
});