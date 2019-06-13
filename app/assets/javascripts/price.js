$(function(){
  var $input = $("#price-input-box");
  $input.on('input',function(){
    var value = $input.val();
    if (300 <= value && value < 9999999){
      var salesCommission = document.getElementById('commission');
      commission.innerHTML = Math.round(value * 0.1).toLocaleString()
      var commissionInput = commission.innerHTML.replace(/,/g, "");
      var salesProfit = document.getElementById('profit');
      salesProfit.innerHTML = Math.round(value - commissionInput).toLocaleString()
    } else {
      var commitReset = document.getElementById('commission');
      commitReset.innerHTML = '-';
      var profitReset = document.getElementById('profit');
      profitReset.innerHTML = '-';
    }
  });
})