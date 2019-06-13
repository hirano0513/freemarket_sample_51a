crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link 'マイページ', user_path(current_user.id)
end

crumb :edit do
  link 'プロフィール', edit_user_path(current_user.id)
  parent :user
end

crumb :logout do
  link 'ログアウト'
  parent :user
end

crumb :card_edit do
  link '支払い方法'
  parent :user
end

crumb :personal_edit do
  link '本人情報の登録'
  parent :user
end
