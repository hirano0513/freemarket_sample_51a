$(function(){
  var $input = $("#price-input-box");
  $input.on('input',function(){
    var value = $input.val();
    if (300 <= value && value < 9999999){
      var salesCommission = document.getElementById('commission');
      var yen = "¥"
      var commission_price = Math.round(value * 0.1);
      salesCommission.innerHTML = yen + commission_price.toLocaleString();
      var salesProfit = document.getElementById('profit');
      var salesProfit_price =  Math.round(value - commission_price).toLocaleString()
      salesProfit.innerHTML = yen + salesProfit_price
    } else {
      var commitReset = document.getElementById('commission');
      commitReset.innerHTML = '-';
      var profitReset = document.getElementById('profit');
      profitReset.innerHTML = '-';
    }
  });
  $(window).on('load',function(){
    var value = $input.val();
    if (300 <= value && value < 9999999){
      var salesCommission = document.getElementById('commission');
      var yen = "¥"
      var commission_price = Math.round(value * 0.1);
      salesCommission.innerHTML = yen + commission_price.toLocaleString();
      var salesProfit = document.getElementById('profit');
      var salesProfit_price =  Math.round(value - commission_price).toLocaleString()
      salesProfit.innerHTML = yen + salesProfit_price
    } else {
      var commitReset = document.getElementById('commission');
      commitReset.innerHTML = '-';
      var profitReset = document.getElementById('profit');
      profitReset.innerHTML = '-';
    }
  });
})