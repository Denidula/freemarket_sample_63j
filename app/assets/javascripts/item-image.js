// ==================================
//            プレビュー機能
// ==================================

$(document).on('turbolinks:load', function() {
  $(function(){
    function appendPicture(picture){
      var html = `<li class = "image-box" >
                    <figure>
                      <img src = "${picture}">
                    </figure>
                    <div class = "box-bottom clearfix">
                      <div class = "edit">
                        編集
                      </div>
                      <div class = "delete">
                        削除
                      </div>
                    </div>
                  </li>
                  `;
      return html;
    }

    function displayPicture(pictureOriginal){
      var insertPicture = "";
      insertPicture = appendPicture(pictureOriginal);
      
      if($('div').hasClass('image-box') == true){
        $('.image-ul:last').append(insertPicture);
      }else{
        $('.image-ul').append(insertPicture);
      }
    }
    
    $(".sell-dropbox").on("change",function(e){
      var picture_file = e.target.files[0];
      var reader = new FileReader();

      reader.addEventListener("load", function(){
        displayPicture(reader.result);
      },false);

      if(picture_file){
        reader.readAsDataURL(picture_file);
      }  
    })
  })
})

// ==================================
//     画像を都度選択できるようにする
// ==================================

$(document).on('turbolinks:load', function() {
  var input_area = $('.sell-upload-drop-box');
  $(document).on('change', '#post_img,#post_img_last',function(event) {
    var new_input = $(`<input multiple= "multiple" name="item[images][]" class="sell-upload-drop-file" type="file" id="post_img">`);
    input_area.prepend(new_input);
  });
});

// ==================================
//   下部の画像をホバーすると選択される
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
// 下部の画像群からマウスアウトしてもアクティブ状態が維持される
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
// 下部の画像群にマウスインすると上部画像と一致しない画像のアクティブクラスをリムーブ
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