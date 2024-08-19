class BuyAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :other, :tel
  attr_accessor :token

  validates :user_id, :item_id, presence: true
  validates :postal_code, :city, :house_number, :tel, presence: true
  validates :postal_code, numericality: true, format: {with: /\A\d{3}[-]?\d{4}\z/}
  validates :tel, numericality: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :token, presence: true

  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, other: other, tel: tel, buy_id: buy.id)
  end
end
