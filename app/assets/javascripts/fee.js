$(document).on('turbolinks:load', function() {
  function buildHTML(fee){
    html = `<div class="right">
            ¥${fee.toLocaleString()}
            </div>`
    return html;
  }
  function buildHTML(profit){
    html = `<div class="right">
            ¥${profit.toLocaleString()}
            </div>`
    return html;
  }
  
  $("#item_price").keyup(function(){    
    var val = $(this).val();
    var fee = Math.round(val * 0.1);
    var profit = (val - fee);
    var html_fee = buildHTML(fee);
    var html_profit = buildHTML(profit);
    if (val >= 300 && val <= 9999999){
      $('#fee').empty();
      $('#fee').append(html_fee);
      $('#profit').empty();
      $('#profit').append(html_profit);
    } if (val < 300 || val > 9999999 || String(val).split(".")[1] != null) {
      $('#fee').text('ー');
      $('#profit').text('ー');
    }
  });
});