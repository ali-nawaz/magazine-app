FactoryGirl.define do
  factory :article do
    sequence(:title) { |i| "Title##{i}" }
    content { Faker::Lorem.paragraph(40) }
  end
end
