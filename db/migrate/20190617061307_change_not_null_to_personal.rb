class ChangeNotNullToPersonal < ActiveRecord::Migration[5.2]
  def up
    # Not Null制約を外す(NULLがOK)
    change_column_null :personals, :postal_code, true
    change_column_null :personals, :prefecture_id, true
    change_column_null :personals, :city, true
    change_column_null :personals, :address, true
    change_column_null :personals, :birth_day, true
  end

  def down
    # Not Null制約を付ける(NULLがNG)
    change_column_null :personals, :postal_code, false
    change_column_null :personals, :prefecture_id, false
    change_column_null :personals, :city, false
    change_column_null :personals, :address, false
    change_column_null :personals, :birth_day, false
  end
end
