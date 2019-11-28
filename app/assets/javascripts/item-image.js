
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
      console.log(insertPicture);
      if($('div').hasClass('image-box') == true){
        $('.image-ul:last').append(insertPicture);
        console.log("move1");
      }else{
        $('.image-ul').append(insertPicture);
        console.log("move2");
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