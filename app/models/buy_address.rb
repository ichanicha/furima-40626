class BuyAddress

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :house_number, :tel, :buy
  
  validates :user, :item, presence: true
  validates :postal_code, :prefecture_id, :city, :house_number, :tel, :buy, presence: true
  validates :postal_code, numericality: true, length: { maximum: 7 }
  validates :tel, numericality: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 

  
  def save
    buy = Buy.create(user: user, item: item)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, tel: tel, buy_id: buy.id)
  end
end
