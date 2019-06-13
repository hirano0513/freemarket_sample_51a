class Shipment < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum cost_payer: {postage_included: 1, cash_on_delivery: 2}

  enum method: {undecided: 1, easy_courier_service: 2, postal_mail: 3, letter_pack: 4, regular_mail: 5, Kuroneko_Yamato: 6, postal_pack: 7, Click_Pocket: 8, postal_packet: 9}

  enum days: {one_to_two_days: 1, two_to_three_days: 2, four_to_seven_days: 3}

end
