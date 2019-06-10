class Shipment < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum cost_payer: {"--": "", "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _suffix: true

  enum method: {"--": "","未定": 1, "らくらくメルカリ便": 2,"ゆうメール": 3,"レターパック": 4,"普通郵便(定形、定型外)": 5, "クロネコヤマト": 6, "ゆうパック": 7, "クリックポケット": 8, "ゆうパケット": 9}, _suffix: true

  enum days: {"--": "", "1〜2日で発送": 1, "2〜3日で発送": 2, "4〜7日で発送": 3}, _suffix: true
end
