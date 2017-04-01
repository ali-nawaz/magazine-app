FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.org" }
    sequence(:name)  { |i| "User ##{i}" }

    password 'pass123456'
    password_confirmation 'pass123456'
  end
end
