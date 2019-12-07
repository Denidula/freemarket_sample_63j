// =========================
//       価格レンジ選択欄
// =========================

$(document).on('turbolinks:load', function() {
  $('#price_select').on('change', function(){
    var price_range = $('#price_select').val();
    if(price_range == '選択してください'){
      $('#q_price_gteq').val('');
      $('#q_price_lteq').val('');
    } if(price_range == "300 ~ 1,000"){
      $('#q_price_gteq').val('300');
      $('#q_price_lteq').val('1000');
    } if(price_range == "1,000 ~ 5,000"){
      $('#q_price_gteq').val('1000');
      $('#q_price_lteq').val('5000');
    } if(price_range == "5,000 ~ 10,000"){
      $('#q_price_gteq').val('5000');
      $('#q_price_lteq').val('10000');
    } if(price_range == "10,000 ~ 30,000"){
      $('#q_price_gteq').val('10000');
      $('#q_price_lteq').val('30000');
    } if(price_range == "30,000 ~ 50,000"){
      $('#q_price_gteq').val('30000');
      $('#q_price_lteq').val('50000');
    } if(price_range == "50,000 ~"){
      $('#q_price_gteq').val('50000');
      $('#q_price_lteq').val('');
    }
  })
});

// =========================
//       カテゴリ選択
// =========================

$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml =`<div class="select" id="children_wrapper" style="margin-top: -10px">
                          <select id="child_category" class="form-group__text-field" name="q[child_category_eq]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                          <div class="chevron-down" style="top: 105px"></div>
                        </div>`;
      $('#category_search').append(childSelectHtml);
    }
    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class="select" id="grandchildren_wrapper" style="margin-top: -10px">
                                <select id="grandchild_category" class="form-group__text-field" name="q[grandchild_category_eq]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                                <div class="chevron-down" style="top: 163px"></div>
                              </div>`;  
      $('#category_search').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択後のイベント
    $('#parent_category_search').on('change', function(){
      var parentCategory = document.getElementById('parent_category_search').value; //選択された親カテゴリーの名前を取得
      if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
    // 子カテゴリー選択後のイベント
    $('#category_search').on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (childId != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
  });
});

// ===========================
// チェックボックスの「すべて」機能
// ===========================

$(document).on('turbolinks:load', function(){
  $('#q_status_in_すべて').on('change', function(){
    if($(this).prop('checked')){
      $('#q_status_in_新品未使用').prop('checked', true)
      $('#q_status_in_未使用に近い').prop('checked', true)
      $('#q_status_in_目立った傷や汚れなし').prop('checked', true)
      $('#q_status_in_やや傷や汚れあり').prop('checked', true)
      $('#q_status_in_傷や汚れあり').prop('checked', true)
      $('#q_status_in_全体的に状態が悪い').prop('checked', true)
    } else {
      $('#q_status_in_新品未使用').prop('checked', false)
      $('#q_status_in_未使用に近い').prop('checked', false)
      $('#q_status_in_目立った傷や汚れなし').prop('checked', false)
      $('#q_status_in_やや傷や汚れあり').prop('checked', false)
      $('#q_status_in_傷や汚れあり').prop('checked', false)
      $('#q_status_in_全体的に状態が悪い').prop('checked', false)
    }
  })
})

$(document).on('turbolinks:load', function(){
  $('#q_charge_in_すべて').on('change', function(){
    if($(this).prop('checked')){
      $('#q_charge_in_着払い購入者負担').prop('checked', true)
      $('#q_charge_in_送料込み出品者負担').prop('checked', true)
    } else {
      $('#q_charge_in_着払い購入者負担').prop('checked', false)
      $('#q_charge_in_送料込み出品者負担').prop('checked', false)
    }
  })
})

