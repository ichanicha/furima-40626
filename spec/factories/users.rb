FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {'加納'}
    name {'美樹'}
    family_name_kana {'カノウ'}
    name_kana {'ミキ'}
    birthday  {Faker::Date.birthday}
  end
end

