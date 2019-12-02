
$(document).on('turbolinks:load', function() {

  $(function(){

  //追加するHTMLを定義

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

  //見た目上、HTMLを追加する

    function displayPicture(pictureOriginal){
      var insertPicture = "";
      insertPicture = appendPicture(pictureOriginal);
      
      if($('div').hasClass('image-box') == true){
        $('.image-ul:last').append(insertPicture);
        
      }else{
        $('.image-ul').append(insertPicture);
        
      }
    }

  //アップロードする記述

    var Uploader = {
      upload: function(imageFile){
        var def =$.Deferred();
        var formData = new FormData();
        formData.append('image', imageFile);
        $.ajax({
          type: "POST",
          url: '/items/upload_image',
          data: formData,
          dataType: 'json',
          processData: false,
          contentType: false,
          success: def.resolve
        })
        return def.promise();
      }
    }
    

    $(".sell-dropbox").on("change",function(e){
      
    //見た目上、複数選択できてるように見せる

      var picture_file = e.target.files[0];
      var reader = new FileReader();

      reader.addEventListener("load", function(){
        displayPicture(reader.result);
      },false);

      if(picture_file){
        reader.readAsDataURL(picture_file);
      }

    //選択するたびにアップロードする

      var files = e.target.files;
      var d = (new $.Deferred()).resolve();
    
      $.each(files,function(i,file){
        d = d.then(function(){
          return Uploader.upload(file);
        });
      });
      
      $('.sell-dropbox').val('');

    });


  });

});