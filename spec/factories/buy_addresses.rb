FactoryBot.define do
  factory :buy_address do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { Faker::Lorem.sentence }
    house_number { Faker::Lorem.sentence }
    other { Faker::Lorem.sentence }
    tel { '09012345678' }
    user_id { 1 } 
    item_id { 1 } 
  end
end
