$(function(){
  function commentHTML(comment){
    var html = `
    <li class="message-content__all__self">
      <div class="message-content__all__self__left">
        <div class="message-content__all__self__left__nickname">
        ${comment.user_name}
        </div>
        <div class="message-content__all__self__left__comment">
        <i class="fa fa-comment balloon"></i>
          ${comment.text}
        <div class="message-content__all__self__left__comment__icon">
        <i class="fa fa-edit message-content__all__self__left__comment__icon__left"></i>
        <i class="fa fa-trash message-content__all__self__left__comment__icon__right"></i>
        </div>
        </div>
      </div>
      <div class="message-content__all__self__right">
        <img class="message-content__all__self__right__user-icon" src="http://static.mercdn.net/images/member_photo_noimage_thumb.png" width="40" height="40">
        <div class="message-content__all__self__right__seller">
        出品者
        </div>
      </div>
    </li>`
    return html;
  }
  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = commentHTML(data);
      $('.message-content__all').append(html);
      $('.textarea').val('');
      $('input').prop('disabled', false)
    })
    .fail(function(){
      alert("表示に失敗しました");
    })
  });
});