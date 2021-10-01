FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              { "1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            { '山田' }
    last_name             { '太郎' }
    first_kana            { 'ヤマダ' }
    last_kana             { 'タロウ' }
    birth_day             { '2020-01-01' }
  end
end
