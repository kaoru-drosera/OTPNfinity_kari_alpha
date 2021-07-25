FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "killy#{n}@soundeffects.com"}
    user_name {"K1lly"}
    password {"K1lly()-"}
    password_confirmation {"K1lly()-"}
  end
end
