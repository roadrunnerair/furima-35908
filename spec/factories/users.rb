FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { 'mac35908' }
    password_confirmation { 'mac35908' }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_kana            { 'ヤマダ' }
    last_kana             { 'タロウ' }
    birth_day             { '2020-01-01' }
  end
end
