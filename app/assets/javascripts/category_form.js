$(function(){
  function buildChild(){
    // 2つ目のセレクトボックスの外枠
    var html = `<div class="select-warp">
    <select class="select-default" id="children-form" name="item[items_categories_attributes][0][category_id]"><option value="">---</option>
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
    var html = `<div class="select-warp">
    <select class="select-default" id="grand-children-form" name="item[items_categories_attributes][0][category_id]"><option value="">---</option>
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
  $("#parent-form").one("change",function(){
    // 1つ目のセレクトボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var parentValue = document.getElementById("parent-form").value;
    $.ajax({
      url: '/items/search',
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
  $(document).one("change", "#children-form",function(){
    // 2つ目のセレクトボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var childrenValue = document.getElementById("children-form").value;
    $.ajax({
      url: '/items/search',
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
  $(document).one("change", "#grand-children-form",function(){
    // 3つ目のセレクトボックスの値が変わった時、ブランドとサイズの入力ボックスを表示させる
    $('.hidden').css({
      'display': 'block'
    });
  });
});
