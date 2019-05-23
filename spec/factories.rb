FactoryBot.define do
  
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com"}
    password { "password" }
    name { "Joe" }
  end

end