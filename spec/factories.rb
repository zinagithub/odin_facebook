FactoryBot.define do
  
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password { "password" }
    name { "Joe" }
  end

  factory :post do
    body { "body" }
    user { create :user }
  end

  factory :like do
    user { create :user }
    post { create :post }
  end

end