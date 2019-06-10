class Shipment < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum cost_payer: [['---',""], '送料込み(出品者負担)', '着払い(購入者負担)']
  enum method: ['未定', 'らくらくメルカリ便', 'ゆうメール', 'レターパック', '普通郵便(定形、定形外)', 'クロネコヤマト', 'ゆうパック', 'クリックポスト', 'ゆうパケット']
  enum days: ['1〜2日で発送', '2〜3日で発送', '4〜7日で発送']
end
