// ==================================
//            プレビュー機能
// ==================================

$(document).on('turbolinks:load', function() {
  $(function(){
    function appendPicture(image_id, picture){
      var html = `<li class = "image-box" id="image-box-${image_id}">
                    <figure>
                      <img src = "${picture}">
                    </figure>
                    <div class = "box-bottom clearfix">
                      <div class = "edit">
                        編集
                      </div>
                      <div class = "delete" id="delete-${image_id}">
                        削除
                      </div>
                    </div>
                  </li>
                  `;
      return html;
    }

    function displayPicture(image_id, pictureOriginal){
      var insertPicture = "";
      insertPicture = appendPicture(image_id, pictureOriginal);
      
      if($('div').hasClass('image-box') == true){
        $('.image-ul:last').append(insertPicture);
      }else{
        $('.image-ul').append(insertPicture);
      }
    }
    
    $(".sell-dropbox").on("change",function(e){
      var li_count = $('.image-box').length;
      var picture_file = e.target.files[0];
      var reader = new FileReader();
      
      reader.addEventListener("load", function(){
        var image_id = li_count;
        displayPicture(image_id, reader.result);
      },false);
      
      if(picture_file){
        reader.readAsDataURL(picture_file);
      }  
    })
  })
})

// ======================
//    削除機能（new&edit）
// ======================

$(document).on('turbolinks:load', function(){
  $(document).on('click', `.delete`, function(){
    var li_count = $('.image-box').length;
    li_count = parseInt(li_count);
    var image_id = $(this).attr('id');
    image_id = image_id.slice(-1);
    image_id = parseInt(image_id);
    $(`#image-box-${image_id}`).remove();
    $(`#post_img_${image_id}`).remove();
    if (li_count < 10){
      for( var i = image_id; i <= li_count - 1; i++ ){
        $(`#post_img_${i + 1}`).attr('id', `post_img_${i}`);
      };
      $("#image-drop-zone__label").attr('for', `post_img_${li_count - 1}`)
    } if (li_count == 10) {
      for( var i = image_id; i <= 9; i++){
        $(`#post_img_${i + 1}`).attr('id', `post_img_${i}`);
      }
      $("#image-drop-zone__label").attr('for', `post_img_${li_count - 1}`)
      $('#image-drop-zone').show();
    }
  })
})

// ==================
//    削除機能（edit）
// ==================

$(document).on('turbolinks:load', function(){
  $('.delete').on('click', function(){
    function buildHTML(id){
      html = `
      <div id="image-drop-zone">
        <label class="sell-upload-drop-box" for="post_img_9" id="image-drop-zone__label">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_0">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_1">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_2">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_3">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_4">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_5">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_6">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_7">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_8">
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_9">
          <pre class="visible-pc">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre>
          <input multiple="multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_10">
        </label>
      </div>`
      return html;
    }

    var image_id = $(this).attr('id');
    image_id = image_id.slice(-1);
    image_id = parseInt(image_id);
    $(`.check-box-${image_id}`).prop('checked', true);

    var li_count = $('.image-box').length;
    if(li_count == 10){
      var html = buildHTML(li_count);
      $(".sell-dropbox").append(html);
    }
  })
})

// ===========================================
// 画像を都度選択できるようにする/10枚までアップできる
// ===========================================

$(function(){
  $(document).on('change', `.sell-dropbox`, function(){
    var li_count = $('.image-box').length;
    if(li_count < 10){
      var input_area = $('.sell-upload-drop-box');
      var new_input = $(`<input multiple= "multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img_${li_count + 1}">`);
      input_area.append(new_input);
      $("#image-drop-zone__label").attr('for', `post_img_${li_count + 1}`);
      if (li_count + 1 == 10){
        $('#image-drop-zone').hide();
      }
    }
  });
});

// ==================================
// （表示機能）下部の画像をホバーすると選択される
// ==================================
  
$(document).on('turbolinks:load', function(){
  function buildHTML(src){
    image = `<img id="image-upper" src="${src}">`
    return image;
  }

  $('.image-select').mouseover(function(){
    src = $(this).attr('src');
    var image = buildHTML(src);
    $('#main-image').empty();
    $('#main-image').append(image);
    $(this).addClass("active");
    $(this).mouseleave(function(){
      $(this).removeClass("active");
    });
  });
});

// ==================================================
// （表示機能）下部の画像群からマウスアウトしてもアクティブ状態が維持される
// ==================================================

$(document).on('turbolinks:load', function(){
  var image_last_id = $('.image-select').attr('id')
  $(`#${image_last_id}`).addClass("active");
  $('.stage__item__inner__group').mouseleave(function(){
    var upper_src = $('#image-upper').attr('src');
    for ( var i = 9; i >= 0; i-- ){
      var bottom_src = $(`#image-${i}`).attr('src');
      if(upper_src == bottom_src){
        $(`#image-${i}`).addClass("active");
      } else {
        $(`#image-${i}`).removeClass("active");
      }
    }
  })
});

// ====================================================================
// （表示機能）下部の画像群にマウスインすると上部画像と一致しない画像のアクティブクラスをリムーブ
// ====================================================================

$(document).on('turbolinks:load', function(){
  $('.stage__item__inner__group').mouseover(function(){
    var upper_src = $('#image-upper').attr('src');
    for ( var i = 9; i >= 0; i-- ){
      var bottom_src = $(`#image-${i}`).attr('src');
      if(upper_src !== bottom_src){
        $(`#image-${i}`).removeClass("active");
      } 
    } 
  })
});


// =============================
//  トップページの画像を自動スライド
// =============================


$(document).on('turbolinks:load', function(){

  $(function() {

    $('.slider').slick({
      prevArrow:'',
      nextArrow:'',
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
      speed: 800
    });

  });

})

// ======================================
// アップロードせずにsubmitするとアラートが出る
// ======================================

$(document).on('turbolinks:load', function(){
  $('#new_item').on('submit', function(e){
    li_count = $('.image-box').length;
    if(!(li_count)){
      e.preventDefault();
      $.ajax({
      }).done(function(){
        alert('画像を１枚以上アップロードしてください');
        $('input[name="commit"]').prop('disabled', false);
      }).fail(function(){
        alert('ajax失敗');
      })
    }
  })
})