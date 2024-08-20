class BuyAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :other, :tel
  attr_accessor :token

  with_options presence: true do
    validates :user_id, :item_id
    validates :city, :house_number
    validates :token
  end
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "must be in the format XXX-XXXX" }
  validates :tel, format: { with: /\A\d{10,11}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 

  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, other: other, tel: tel, buy_id: buy.id)
  end
end
