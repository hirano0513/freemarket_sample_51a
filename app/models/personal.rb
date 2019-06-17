class Personal < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :kana_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}

  attr_writer :last_name, :first_name, :kana_last_name, :kana_first_name

  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :kana_last_name,  presence: true
  validates :kana_first_name, presence: true

  before_validation :set_name
  before_validation :set_kana_name

  # 画面表示時に呼ばれる
  def last_name
    @last_name || self.name.split(" ").first if self.name.present?
  end

  # 画面表示時に呼ばれる
  def first_name
    @first_name || self.name.split(" ").last if self.name.present?
  end

  def kana_last_name
    @kana_last_name || self.kana_name.split(" ").first if self.kana_name.present?
  end

  def kana_first_name
    @kana_first_name || self.kana_name.split(" ").first if self.kana_name.present?
  end

  # DBのカラムはnameのため、last_nameとfirst_nameを
  # バリデーションの前に結合させて、設定しておく必要がある
  def set_name
    self.name = [@last_name, @first_name].join(" ")
  end

  def set_kana_name
    self.kana_name = [@kana_last_name, @kana_first_name].join(" ")
  end
end
