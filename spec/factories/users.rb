FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester#{n}@example.com" }
    password {"examplepassword"}
    password_confirmation {"examplepassword"}
    confirmed_at {Time.now}
  end
end
