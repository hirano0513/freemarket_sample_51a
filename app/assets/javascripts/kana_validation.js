$(function(){
  $("#registration-submit").click(function(){
    if(!$("input[name='user[personal_attributes][kana_first_name]']").val().match(/^[ァ-ロワヲンー \r\n\t]*$/)){
      alert('カナ入力欄にはカタカナを入力してください。')
    }
    else if(!$("input[name='user[personal_attributes][kana_last_name]']").val().match(/^[ァ-ロワヲンー \r\n\t]*$/)){
      alert('カナ入力欄にはカタカナを入力してください。')
    }
    else{
      alert('登録できました。')
    }
  })
})