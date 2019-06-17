$(function(){
  $("#shipment-cost-form").one("change", function(){
    // 配送の方法を表示する
    $('.shipment-hidden').css({
      'display': 'block'
    });
  });
})