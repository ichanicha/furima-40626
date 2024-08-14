class Item < ApplicationRecord
  validates :category_id, :condition_id, :shopping_charge_id, :prefecture_id, :daily_id, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  belongs_to :user 
  has_one_attached :image
  #has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shopping_charge
  belongs_to :daily
  
  #空の投稿を保存できないようにする
  validates :image, :name, :description, :category_id, :condition_id, :shopping_charge_id, :prefecture_id, :daily_id, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :prefecture_id, :shopping_charge_id, :daily_id, numericality: { other_than: 1, message: "can't be blank" } 


end
