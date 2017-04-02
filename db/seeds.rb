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

unless Tag.exists?
  10.times do
    Tag.where(name: Faker::Cat.name).first_or_create!
  end
end

unless SubTag.exists?
  10.times do
    SubTag.where(name: Faker::Color.color_name).first_or_create
  end
end

unless Article.exists?
  users = User.take(10)
  tags = Tag.take(10).map(&:name)
  sub_tags = SubTag.take(10).map(&:name)

  10.times do |i|
    Article.create!(
      content:  Faker::Lorem.paragraph(50),
      title:    Faker::Lorem.words.join(' '),
      owner:    users[i % users.size],
      tags:     tags.sample(4).join(','),
      sub_tags: sub_tags.sample(4).join(',')
    )
  end
end
