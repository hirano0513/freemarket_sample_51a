$(function(){
  function buildChild(){
    // 2つ目のセレクトボックスの外枠
    var html = `<div class="select-warp child-box">
    <select class="select-default" id="children-form" name="item[category_ids][]"><option value="">---</option>
    </select>
    <i class="fas fa-angle-down"></i>
    </div>`
    return html;
  }
  function buildChildOption(child){
    // 2つ目のセレクトボックスの選択肢
    var childOption = `<option value="${child.id}">${child.name}</option>`
    return childOption;
  }
  function buildGrandChild(){
    // 3つ目のセレクトボックスの外枠
    var html = `<div class="select-warp grandchild-box">
    <select class="select-default" id="grand-children-form" name="item[category_ids][]"><option value="">---</option>
    </select>
    <i class="fas fa-angle-down"></i>
    </div>`
    return html;
  }
  function buildGrandChildOption(grandchild){
    // 3つ目のセレクトボックスの選択肢
    var GrandChildOption = `<option value="${grandchild.id}">${grandchild.name}</option>`
    return GrandChildOption;
  }
  $("#parent-form").on("change",function(){
    // 1つ目のセレクトボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var parentValue = document.getElementById("parent-form").value;
    $(".child-box").remove();
    $(".grandchild-box").remove();
    $('.hidden').css({
      'display': 'none'
    });
    $.ajax({
      url: '/items/category_search',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })
    .done(function(child){
      var InsertHTML = '';
      $('#children-form-area').append(buildChild());
      child.forEach(function(child){
        InsertHTML = buildChildOption(child);
        $('#children-form').append(InsertHTML);
      })
    })
    .fail(function(){
      console.log("失敗");
    });
  })
  $(document).on("change", "#children-form",function(){
    // 2つ目のセレクトボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var childrenValue = document.getElementById("children-form").value;
    $(".grandchild-box").remove();
    $('.hidden').css({
      'display': 'none'
    });
    $.ajax({
      url: '/items/category_search',
      type: "GET",
      data: {
        child_id: childrenValue
      },
      dataType: 'json'
    })
    .done(function(grandchild){
      var InsertHTML = '';
      $('#grandchild-form-area').append(buildGrandChild());
      grandchild.forEach(function(grandchild){
        InsertHTML = buildGrandChildOption(grandchild);
        $('#grand-children-form').append(InsertHTML);
      })
    })
    .fail(function(){
      console.log("失敗");
    });
  });
  $(document).on("change", "#grand-children-form",function(){
    // 3つ目のセレクトボックスの値が変わった時、ブランドとサイズの入力ボックスを表示させる
    $('.hidden').css({
      'display': 'block'
    });
  });
});
