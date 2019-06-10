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
  
  factory :comment do
    body { "body" }
    user { create :user}
    post { create :post }
  end

  factory :friend_request do
    sender { create :user }
    receiver { create :user}
  end

  factory :friendship do
    user { create :user }
    friend { create :user}
  end
end