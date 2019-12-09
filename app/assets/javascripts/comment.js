$(document).on('turbolinks:load', function() {
  $(function(){
    function commentHTML(comment){
      if(comment.user_id == comment.item_user_id){
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
                <div class="create_date">
                ${comment.created_at}
                </div>
              </div>
              <a class="message-content__all__self__left__comment__icon__right" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.id}"><i class="fa fa-trash"></i></a>
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
      } else {
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
                <div class="create_date">
                ${comment.created_at}
                </div>
              </div>
              <a class="message-content__all__self__left__comment__icon__right" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.id}"><i class="fa fa-trash"></i></a>
            </div>
          </div>
          <div class="message-content__all__self__right">
            <img class="message-content__all__self__right__user-icon" src="http://static.mercdn.net/images/member_photo_noimage_thumb.png" width="40" height="40">
          </div>
        </li>`
        return html;
      }
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
        // var input_text = $('#comment_text').val();
        var html = commentHTML(data);
        $('.message-content__all').append(html);
        $('.textarea').val('');
        $('input').prop('disabled', false)
      })
      .fail(function(){
        alert("表示に失敗しました");
        $('input').prop('disabled', false)
      })
    });
  });
})
