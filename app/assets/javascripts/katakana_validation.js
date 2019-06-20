$(function(){
  $("#registration-submit").click(function(){
    var kana_first_name = $("input[name='user[personal_attributes][kana_first_name]']").val()
    var kana_last_name = $("input[name='user[personal_attributes][kana_last_name]']").val()
    if(kana_first_name == "" || kana_last_name == ""){
      alert("必須項目を入力して下さい。");
    } else {
      if(!kana_first_name.match(/^[ァ-ロワヲンー \r\n\t]*$/)){
        alert('姓カナ入力欄にはカタカナを入力してください。')
      }
      else if(!kana_last_name.match(/^[ァ-ロワヲンー \r\n\t]*$/)){
        alert('名カナ入力欄にはカタカナを入力してください。')
      }
      else{
        alert('登録できました。')
      }
    }
  })
})
