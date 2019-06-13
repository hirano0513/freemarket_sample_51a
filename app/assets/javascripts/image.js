$(function(){
  function buildImage(){
    var html = `<div class="upload-container">
    <div class="uploads">
    <ul id="image-area">
    </ul>
    </div>
    </div>`
    return html;
  }
  function buildImageArea(){
    var html= `<li class="upload-box">
    <figure class="upload-figure landscape" id="image-upload">
    </figure>
    <div class="upload-btn">
    <a class="upload-edit" href="#">編集</a>
    <a class="upload-destroy" href="javascript:void(0)">削除</a>
    </div>
    </li>`
    return html;
  }
  $('#item_images').on('change', function(e){
    var files = e.target.files;
    var d = (new $.Deferred()).resolve();
    $.each(files,function(i,file){
      d = d.then(function(){return previewImage(file)});
    });
  })

  var previewImage = function(imageFile){
    var reader = new FileReader();
    var img = new Image();
    var def = $.Deferred();
    $('#image-box').append(buildImage());
    reader.onload = function(e){
      $('#image-area').append(buildImageArea());
      $('#image-upload').append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  }
  $(document).on("change", "#item_images", function(){
    var cnt = $('#image-upload').length;
    switch( cnt ){
      case 0:
        $('#image-box').addClass('image-1')
        $('.image-label').addClass('item-1');
        break;
      }
  });
  $(document).on('click','.upload-destroy', function(e){
    e.preventDefault();
    $('.upload-box').remove();
    $('#image-box').removeClass('image-1');
    $('.image-label').removeClass('item-1');
  });
})