class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  has_many :articles, foreign_key: :owner_id

  def initials
    "#{first_initial}#{last_initial}".upcase
  end

  def name_or_username
    @name_or_email ||= (name.presence || email.split('@').first)
  end

  private

  def first_initial
    @first_initial ||= name_or_username&.split(' ')&.send(:[], 0)&.first
  end

  def last_initial
    return unless name_or_username.include?(' ')

    @last_initial ||= name_or_username&.split(' ')&.send(:[], -1)&.first
  end
end
