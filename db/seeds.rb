# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

10.times do |i|
  User.where(email: "user#{i + 1}@example.org").first_or_create do |user|
    user.name = Faker::Name.unique.name
    user.password = 'abcd123456'
    user.password_confirmation = 'abcd123456'
  end
end

unless Article.exists?
  users = User.take(10)

  10.times do |i|
    Article.create!(
      content: Faker::Lorem.paragraph(50),
      title:   Faker::Lorem.words.join(' '),
      owner:   users[i % users.size]
    )
  end
end
