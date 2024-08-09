FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shopping_charge_id { 2 }
    prefecture_id { 2 }
    daily_id { 2 }
    price { Faker::Number.between(from: 300, to: 9999999) }
    user { create(:user) }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public', 'images', 'test_image.png')), filename: 'test_image.png')
    end
  end
end